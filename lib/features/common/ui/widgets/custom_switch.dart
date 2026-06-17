import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_colors.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({
    super.key,
    required this.onEnable,
    required this.onDisable,
    required this.isOn,
  });

  final Function() onEnable;
  final Function() onDisable;
  final bool isOn;
  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    const double trackWidth = 50;
    const double knobSize = 28;
    const double trackHeight = 18;

    return GestureDetector(
      onTap: () async {
        widget.isOn ? await widget.onDisable() : await widget.onEnable();
      },
      child: SizedBox(
        width: trackWidth,
        height: knobSize,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: (knobSize - trackHeight) / 2,
              child: Container(
                height: trackHeight,
                decoration: BoxDecoration(
                  color: widget.isOn ? AppColors.primary : AppColors.neutral400,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              top: 0,
              left: widget.isOn
                  ? trackWidth -
                        knobSize // right
                  : 0,
              // left
              child: Container(
                width: knobSize,
                height: knobSize,
                decoration: BoxDecoration(
                  color: widget.isOn ? AppColors.neutral50 : AppColors.neutral100,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
