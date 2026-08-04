// lib/features/partner_details/ui/widgets/reel_player_page.dart
import 'package:dawri/core/services/dialogs/message_service.dart';
import 'package:dawri/core/services/launcher/url_launcher.dart';
import 'package:dawri/core/utils/common_widgets/custom_network_image.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import '../../data/models/partner_details_model.dart';

/// Instagram-style vertical reels viewer over the partner's videos.
///
/// Hosts whose pages can't be played by `video_player` (YouTube, Vimeo, …) fall
/// back to a thumbnail with an "open externally" action instead of a black screen.
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

  /// Embed pages / unsupported hosts — never handed to `video_player`.
  static const List<String> _externalOnlyHosts = [
    'youtube.com',
    'youtu.be',
    'vimeo.com',
    'dailymotion.com',
    'facebook.com',
    'instagram.com',
    'tiktok.com',
  ];

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

  static bool isInlinePlayable(String? url) {
    final uri = Uri.tryParse(url?.trim() ?? '');
    if (uri == null || !uri.hasScheme) return false;
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
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
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
    final controller = widget.controller;
    final isReady = controller != null && controller.value.isInitialized;
    // Nothing to initialise (YouTube & friends) → show the external fallback.
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
