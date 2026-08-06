// lib/features/partner_details/ui/widgets/reel_player_page.dart
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/core/services/launcher/url_launcher.dart';
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import '../../data/models/partner_details_model.dart';

/// Instagram-style vertical reels viewer over the partner's videos.
///
/// Three playback paths:
///  * YouTube links play in-app through [YoutubePlayer].
///  * Direct media files play through `video_player`.
///  * Anything else (Vimeo, TikTok, …) falls back to "open externally" rather
///    than showing a black screen.
class ReelPlayerPage extends StatefulWidget {
  final List<PartnerVideoModel> reels;
  final int initialIndex;

  const ReelPlayerPage({super.key, required this.reels, this.initialIndex = 0});

  @override
  State<ReelPlayerPage> createState() => _ReelPlayerPageState();
}

class _ReelPlayerPageState extends State<ReelPlayerPage> {
  late final PageController _pageController;
  late int _currentIndex;
  final Map<int, VideoPlayerController> _controllers = {};

  /// Embed pages `video_player` can't decode. YouTube is absent on purpose —
  /// it has its own in-app player below.
  static const List<String> _externalOnlyHosts = [
    'vimeo.com',
    'dailymotion.com',
    'facebook.com',
    'instagram.com',
    'tiktok.com',
  ];

  /// Video id when [url] is a YouTube link (watch / youtu.be / shorts / embed),
  /// otherwise null.
  static String? youtubeIdOf(String? url) {
    final trimmed = url?.trim() ?? '';
    if (trimmed.isEmpty) return null;

    final host = Uri.tryParse(trimmed)?.host.toLowerCase() ?? '';
    if (!host.contains('youtube.com') && !host.contains('youtu.be')) return null;

    return YoutubePlayer.convertUrlToId(trimmed);
  }

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
    _initController(_currentIndex);
    _preloadAdjacent(_currentIndex);
  }

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    _pageController.dispose();
    super.dispose();
  }

  /// True when `video_player` can handle the URL directly. YouTube returns
  /// false here — [_ReelPage] renders it with the YouTube player instead.
  static bool isInlinePlayable(String? url) {
    final uri = Uri.tryParse(url?.trim() ?? '');
    if (uri == null || !uri.hasScheme) return false;
    if (youtubeIdOf(url) != null) return false;
    final host = uri.host.toLowerCase();
    return !_externalOnlyHosts.any((blocked) => host.contains(blocked));
  }

  void _initController(int index) {
    if (_controllers.containsKey(index) || index < 0 || index >= widget.reels.length) return;

    final url = widget.reels[index].url;
    if (!isInlinePlayable(url)) return;

    final controller = VideoPlayerController.networkUrl(Uri.parse(url!.trim()));
    _controllers[index] = controller;
    controller.initialize().then((_) {
      if (!mounted) return;
      controller.setLooping(true);
      if (index == _currentIndex) controller.play();
      setState(() {});
    }).catchError((_) {
      // Broken / unsupported media — the page shows its thumbnail fallback.
      if (!mounted) return;
      _controllers.remove(index)?.dispose();
      setState(() {});
    });
  }

  void _preloadAdjacent(int index) {
    _initController(index + 1);
    _initController(index - 1);
  }

  void _onPageChanged(int index) {
    _controllers[_currentIndex]?.pause();
    _controllers[_currentIndex]?.seekTo(Duration.zero);
    setState(() => _currentIndex = index);
    _controllers[index]?.play();
    _preloadAdjacent(index);
    _disposeFarControllers(index);
  }

  void _disposeFarControllers(int index) {
    final keysToRemove = _controllers.keys.where((k) => (k - index).abs() > 1).toList();
    for (final k in keysToRemove) {
      _controllers[k]?.dispose();
      _controllers.remove(k);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Landscape means a reel went fullscreen — hand the whole screen over:
    // no close button on top of the video, no swiping to the next reel.
    final isFullScreen =
        MediaQuery.orientationOf(context) == Orientation.landscape;

    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            physics: isFullScreen
                ? const NeverScrollableScrollPhysics()
                : const PageScrollPhysics(),
            itemCount: widget.reels.length,
            onPageChanged: _onPageChanged,
            itemBuilder: (context, index) {
              return _ReelPage(
                reel: widget.reels[index],
                controller: _controllers[index],
                isActive: index == _currentIndex,
              );
            },
          ),
          if (!isFullScreen)
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const CircleAvatar(
                    backgroundColor: Colors.black45,
                    child: Icon(Icons.close, color: AppColors.white),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _ReelPage extends StatefulWidget {
  final PartnerVideoModel reel;
  final VideoPlayerController? controller;
  final bool isActive;

  const _ReelPage({required this.reel, required this.controller, required this.isActive});

  @override
  State<_ReelPage> createState() => _ReelPageState();
}

class _ReelPageState extends State<_ReelPage> {
  bool _showPauseIcon = false;
  bool _isMuted = false;

  /// Non-null only for YouTube reels; owned by this page, not the parent.
  YoutubePlayerController? _youtubeController;
  String? _youtubeId;

  @override
  void initState() {
    super.initState();
    _youtubeId = _ReelPlayerPageState.youtubeIdOf(widget.reel.url);
    // Booting a webview costs ~a second, so only the visible reel gets one.
    // PageView builds neighbours eagerly — creating a player for each of them
    // meant three webviews racing for the network on open.
    if (_youtubeId != null && widget.isActive) _createYoutubeController();
  }

  void _createYoutubeController() {
    _youtubeController = YoutubePlayerController(
      initialVideoId: _youtubeId!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        // Cheapest stream the device can pick; HD would buffer longer.
        forceHD: false,
        // `hideThumbnail` stays false on purpose — it gates the placeholder
        // image below, which is what makes the open feel instant.
      ),
    );
  }

  @override
  void didUpdateWidget(covariant _ReelPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive == oldWidget.isActive) return;

    if (widget.isActive) {
      // First time this reel is reached — spin the player up now.
      if (_youtubeId != null && _youtubeController == null) {
        setState(_createYoutubeController);
      } else {
        _youtubeController?.play();
      }
    } else {
      _youtubeController?.pause();
    }
  }

  @override
  void dispose() {
    _youtubeController?.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    final controller = widget.controller;
    if (controller == null || !controller.value.isInitialized) return;
    setState(() {
      if (controller.value.isPlaying) {
        controller.pause();
        _showPauseIcon = true;
      } else {
        controller.play();
        _showPauseIcon = false;
      }
    });
  }

  void _toggleMute() {
    final controller = widget.controller;
    if (controller == null) return;
    setState(() {
      _isMuted = !_isMuted;
      controller.setVolume(_isMuted ? 0 : 1);
    });
  }

  Future<void> _openExternally() async {
    final url = widget.reel.url?.trim();
    if (url == null || url.isEmpty) return;
    try {
      await UrlLauncher.openWebInApp(url);
    } catch (_) {
      MessageService.showToast(
        msg: LocaleKeys.errorGeneric.tr(),
        state: ToastStates.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // YouTube reels get their own player and skip the video_player path.
    if (_youtubeId != null) {
      final youtubeController = _youtubeController;
      // Not reached yet — the thumbnail stands in until it becomes active.
      if (youtubeController == null) {
        return _YoutubeThumbnailStandIn(thumbnail: widget.reel.thumbnail);
      }
      return _YoutubeReel(
        controller: youtubeController,
        title: widget.reel.title,
        thumbnail: widget.reel.thumbnail,
      );
    }

    final controller = widget.controller;
    final isReady = controller != null && controller.value.isInitialized;
    // Nothing to initialise (Vimeo, TikTok, …) → show the external fallback.
    final isExternalOnly = !_ReelPlayerPageState.isInlinePlayable(widget.reel.url);

    return GestureDetector(
      onTap: isExternalOnly ? _openExternally : _togglePlayPause,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (isReady)
            FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: controller.value.size.width,
                height: controller.value.size.height,
                child: VideoPlayer(controller),
              ),
            )
          else
            CustomNetworkImage(imageUrl: widget.reel.thumbnail ?? '', fit: BoxFit.cover),
          if (!isReady) ...[
            // Dim the thumbnail so the overlay stays readable.
            const DecoratedBox(
              decoration: BoxDecoration(color: Colors.black45),
              child: SizedBox.expand(),
            ),
            Center(
              child: isExternalOnly
                  ? _OpenExternallyButton(onTap: _openExternally)
                  : const CircularProgressIndicator(color: AppColors.white),
            ),
          ],
          if (isReady && _showPauseIcon)
            Center(
              child: FaIcon(FontAwesomeIcons.play, size: 50, color: AppColors.white.withOpacity(0.85)),
            ),
          if (isReady)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: VideoProgressIndicator(
                controller,
                allowScrubbing: true,
                padding: EdgeInsets.zero,
                colors: VideoProgressColors(
                  playedColor: AppColors.primaryLight,
                  bufferedColor: AppColors.white.withOpacity(0.3),
                  backgroundColor: AppColors.white.withOpacity(0.15),
                ),
              ),
            ),
          Positioned(
            left: 16,
            bottom: 24,
            right: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if ((widget.reel.title ?? '').isNotEmpty) ...[
                  Text(
                    widget.reel.title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 6),
                ],
                Row(
                  children: [
                    FaIcon(FontAwesomeIcons.eye, size: 13, color: AppColors.white.withOpacity(0.85)),
                    const SizedBox(width: 6),
                    Text(
                      widget.reel.views ?? '${widget.reel.viewsCount ?? 0}',
                      style: TextStyle(
                        color: AppColors.white.withOpacity(0.85),
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (isReady)
            Positioned(
              right: 16,
              bottom: 24,
              child: GestureDetector(
                onTap: _toggleMute,
                child: CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: Icon(
                    _isMuted ? Icons.volume_off : Icons.volume_up,
                    color: AppColors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Placeholder for a YouTube reel the user hasn't scrolled to yet — the cached
/// thumbnail, so swiping is instant and no webview is created off-screen.
class _YoutubeThumbnailStandIn extends StatelessWidget {
  const _YoutubeThumbnailStandIn({this.thumbnail});

  final String? thumbnail;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.black,
      child: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CustomNetworkImage(imageUrl: thumbnail ?? '', fit: BoxFit.cover),
              // A play glyph, not a spinner — nothing is loading here yet.
              Center(
                child: FaIcon(
                  FontAwesomeIcons.circlePlay,
                  size: 46,
                  color: AppColors.white.withOpacity(0.85),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// YouTube reel — 16:9 player centred on the black reel background, with the
/// title underneath.
///
/// Wrapped in [YoutubePlayerBuilder] so the fullscreen button works: it swaps
/// to immersive mode, stretches the player to the full height in landscape, and
/// makes back exit fullscreen instead of closing the reel.
class _YoutubeReel extends StatelessWidget {
  const _YoutubeReel({
    required this.controller,
    this.title,
    this.thumbnail,
  });

  final YoutubePlayerController controller;
  final String? title;
  final String? thumbnail;

  @override
  Widget build(BuildContext context) {
    return _PlayerMenuTheme(
      child: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: AppColors.primaryLight,
          // Shown while the iframe boots — the same cached image the grid
          // already downloaded, so it appears immediately.
          thumbnail: CustomNetworkImage(
            imageUrl: thumbnail ?? '',
            fit: BoxFit.cover,
          ),
          progressColors: const ProgressBarColors(
            playedColor: AppColors.primaryLight,
            handleColor: AppColors.primaryLight,
          ),
        ),
        // The package restores only portraitUp on exit, which would quietly
        // drop the portraitDown that app.dart allows.
        onExitFullScreen: () => SystemChrome.setPreferredOrientations(
          const [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
        ),
        builder: (context, player) {
          // In landscape the player owns the whole screen — drop the caption.
          final isLandscape =
              MediaQuery.orientationOf(context) == Orientation.landscape;

          return ColoredBox(
            color: AppColors.black,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  player,
                  if (!isLandscape && (title ?? '').isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
                      child: Text(
                        title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Restyles the player's overflow menus (playback speed) — the package builds a
/// bare [PopupMenuButton], so its colours come from the ambient theme.
class _PlayerMenuTheme extends StatelessWidget {
  const _PlayerMenuTheme({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        popupMenuTheme: PopupMenuThemeData(
          color: AppColors.textDark,
          surfaceTintColor: AppColors.textDark,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        // CheckedPopupMenuItem renders a ListTile — this colours its label and
        // the tick next to the active speed.
        listTileTheme: const ListTileThemeData(
          textColor: AppColors.white,
          iconColor: AppColors.primaryLight,
        ),
      ),
      child: child,
    );
  }
}

class _OpenExternallyButton extends StatelessWidget {
  const _OpenExternallyButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircleAvatar(
            radius: 32,
            backgroundColor: Colors.black54,
            child: FaIcon(FontAwesomeIcons.upRightFromSquare, size: 24, color: AppColors.white),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              LocaleKeys.partnerVideoOpenExternally.tr(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w800,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
