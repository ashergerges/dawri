import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';

class AutoScrollHorizontalTicker extends StatefulWidget {
  final Widget child;
  final double speed;

  const AutoScrollHorizontalTicker({super.key, required this.child, this.speed = 30});

  @override
  State<AutoScrollHorizontalTicker> createState() => _AutoScrollTickerState();
}

class _AutoScrollTickerState extends State<AutoScrollHorizontalTicker>
    with SingleTickerProviderStateMixin {
  late final ScrollController _controller;
  late final Ticker _ticker;
  bool _userScrolling = false;
  Timer? _pauseTimer;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();

    _ticker = createTicker((elapsed) {
      if (!_controller.hasClients || _userScrolling) return;

      if (_controller.position.maxScrollExtent <= 0) return;

      final newPos = _controller.offset + widget.speed * 0.016; // deltaTime ~1/60s
      if (newPos >= _controller.position.maxScrollExtent) {
        _controller.jumpTo(0);
      } else {
        _controller.jumpTo(newPos);
      }
    });

    Future.delayed(const Duration(seconds: 3), () {
      _ticker.start();
    });
  }

  @override
  void dispose() {
    _ticker.dispose();
    _controller.dispose();
    _pauseTimer?.cancel();
    super.dispose();
  }

  void _onUserScroll() {
    if (!_userScrolling) {
      _userScrolling = true;
      _pauseTimer?.cancel();
      _pauseTimer = Timer(const Duration(seconds: 5), () {
        _userScrolling = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<UserScrollNotification>(
      onNotification: (notification) {
        if (notification.direction != ScrollDirection.idle) {
          _onUserScroll();
        }
        return true;
      },
      child: SingleChildScrollView(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        child: widget.child,
      ),
    );
  }
}
