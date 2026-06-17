import 'package:flutter/material.dart';
import 'package:dawri/core/utils/common_widgets/on_tap.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';

import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/app_text_them.dart';

class SwitchTapBar extends StatefulWidget {
  const SwitchTapBar({
    super.key,
    required this.tabs,
    required this.onChangeIndex,
  });

  final List<String> tabs;
  final Function(int) onChangeIndex;

  @override
  State<SwitchTapBar> createState() => _SwitchTapBarState();
}

class _SwitchTapBarState extends State<SwitchTapBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.padHorizontal,
      child: Row(
        children: List.generate(widget.tabs.length, (index) {
          final isSelected = _currentIndex == index;

          return Expanded(
            child: OnTap(
              onTap: () {
                setState(() => _currentIndex = index);
                widget.onChangeIndex(index);
              },
              child: SafeArea(
                top: true,
                bottom: false,
                child: Container(
                  padding: 12.padHorizontal+12.padBottom,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: isSelected
                            ? AppColors.primary
                            : Colors.transparent,
                      ),
                    ),
                  ),
                  child: Text(
                    widget.tabs[index],
                    style: AppTextTheme.bodyMedium(context).copyWith(
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.neutral400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
