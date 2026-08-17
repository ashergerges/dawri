import 'dart:async';
import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/topic.dart';
import 'package:dawri/features/splash/cubits/splash_cubit/splash_cubit.dart';
import 'package:dawri/gen/assets.gen.dart';
import 'package:lottie/lottie.dart';


@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  Timer? _safetyTimer;
  bool _hasContinued = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) _continue();
      });

    // If the asset ever fails to load the animation never completes, so don't
    // let that strand the app on the splash.
    _safetyTimer = Timer(const Duration(seconds: 6), _continue);
  }

  /// Leaves the splash exactly once, whichever trigger fires first.
  void _continue() {
    if (_hasContinued || !mounted) return;
    _hasContinued = true;

    _safetyTimer?.cancel();
    log('splash finished — continuing');
    Topic.subscribeToGuest(context: context);
    context.read<SplashCubit>().init();
  }

  @override
  void dispose() {
    _safetyTimer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // Matches the composition's top gradient stop, so the edges left over on
      // very tall screens blend in instead of banding.
      color: AppColors.splashGradientTop,
      child: SizedBox.expand(
        child: Lottie.asset(
          Assets.animations.splash.path,
          repeat: false,
          controller: _animationController,
          onLoaded: (composition) {
            _animationController
              ..duration = composition.duration
              ..forward();
          },
          onWarning: (warning) => log('splash lottie warning: $warning'),
          errorBuilder: (context, error, stack) {
            log('splash lottie failed to load: $error');
            WidgetsBinding.instance.addPostFrameCallback((_) => _continue());
            return const SizedBox.shrink();
          },
          width: double.infinity,
          height: double.infinity,
          // The composition is a full-bleed 390x844, so it should fill.
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
