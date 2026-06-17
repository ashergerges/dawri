import 'package:flutter/material.dart';

class OnTap extends StatelessWidget {
  const OnTap({super.key,  this.onTap, required this.child,  this.hoverColor});

  final Function()? onTap;
  final Widget child;
  final Color? hoverColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: hoverColor,
      onTap: onTap,
      child: child,
    );
  }
}
