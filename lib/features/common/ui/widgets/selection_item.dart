import 'package:flutter/material.dart';
import 'package:dawri/core/utils/common_widgets/custom_marquee_widget.dart';
import 'package:dawri/core/utils/constants/app_colors.dart';
import 'package:dawri/core/utils/constants/app_text_them.dart';
import 'package:dawri/core/utils/extensions/padding_extensions.dart';

//
// class SelectionItem extends StatelessWidget {
//   const SelectionItem({
//     super.key,
//     required this.title,
//     required this.isSelected,
//   });
//   final String title;
//   final bool isSelected;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: 10.padHorizontal + 6.padVertical,
//       margin: 4.padAll,
//       decoration: BoxDecoration(
//         color: isSelected ? AppColors.primary : null,
//         borderRadius: BorderRadius.circular(20.r),
//       ),
//       child: Center(
//         child: CustomMarquee(
//           child: Text(
//             title,
//             textAlign: TextAlign.center,
//             style: AppTextTheme.bodySmallMediumWeight(context).copyWith(
//               color: AppColors.white,
//               // color: isSelected ? AppColors.white : AppColors.neutral900,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
class SelectionItem extends StatefulWidget {
  const SelectionItem({
    super.key,
    required this.title,
    required this.isSelected,
  });

  final String title;
  final bool isSelected;

  @override
  State<SelectionItem> createState() => _SelectionItemState();
}

class _SelectionItemState extends State<SelectionItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.96,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _opacityAnimation = Tween<double>(
      begin: 0.7,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    if (widget.isSelected) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(SelectionItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected != oldWidget.isSelected) {
      if (widget.isSelected) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            padding: 10.padHorizontal + 6.padVertical,
            margin: 4.padVertical,
            child: Center(
              child: Opacity(
                opacity: _opacityAnimation.value,
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOutCubic,
                  style: AppTextTheme.bodySmallMediumWeight(context).copyWith(
                    color: AppColors.white,
                    // fontWeight: widget.isSelected
                    //     ? FontWeight.w700
                    //     : FontWeight.w500,
                    letterSpacing: widget.isSelected ? 0.3 : 0,
                  ),
                  child: CustomMarquee(
                    child: Text(widget.title, textAlign: TextAlign.center),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
