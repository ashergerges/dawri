// lib/features/partner_details/ui/widgets/reel_player_page.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import '../../data/models/partner_details_model.dart';

class ReelPlayerPage extends StatefulWidget {
  final List<ReelData> reels;
  final int initialIndex;

  const ReelPlayerPage({super.key, required this.reels, this.initialIndex = 0});

  @override
  State<ReelPlayerPage> createState() => _ReelPlayerPageState();
}

class _ReelPlayerPageState extends State<ReelPlayerPage> {
  late final PageController _pageController;
  late int _currentIndex;
  final Map<int, VideoPlayerController> _controllers = {};

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

  void _initController(int index) {
    if (_controllers.containsKey(index) || index < 0 || index >= widget.reels.length) return;
    final controller = VideoPlayerController.networkUrl(Uri.parse(widget.reels[index].videoUrl));
    _controllers[index] = controller;
    controller.initialize().then((_) {
      if (!mounted) return;
      controller.setLooping(true);
      if (index == _currentIndex) controller.play();
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
  final ReelData reel;
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

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;
    final isReady = controller != null && controller.value.isInitialized;

    return GestureDetector(
      onTap: _togglePlayPause,
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
            Image.network(widget.reel.thumbnailUrl, fit: BoxFit.cover),
          if (!isReady)
            const Center(child: CircularProgressIndicator(color: AppColors.white)),
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
            child: Row(
              children: [
                FaIcon(FontAwesomeIcons.eye, size: 13, color: AppColors.white.withOpacity(0.85)),
                const SizedBox(width: 6),
                Text(
                  widget.reel.viewsLabel,
                  style: TextStyle(
                    color: AppColors.white.withOpacity(0.85),
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
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