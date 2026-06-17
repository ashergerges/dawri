import 'package:flutter/material.dart';
import 'package:dawri/features/common/ui/widgets/time_line/start_node_completed.dart';
import 'package:dawri/features/common/ui/widgets/time_line/start_node_normal.dart';

import 'center_node_completed.dart';
import 'center_node_normal.dart';
import 'end_node_completed.dart';
import 'end_node_normal.dart';

class CustomTimeLineNode extends StatelessWidget {
  const CustomTimeLineNode({
    super.key,
    required this.isStart,
    required this.isCenter,
    this.content,
    required this.isCompleted,
  });

  final bool isStart;
  final bool isCenter;
  final bool isCompleted;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return isStart
        ? isCompleted
              ? StartNodeCompleted(content: content)
              : StartNodeNormal(suffix: content)
        : isCenter
        ? isCompleted
              ? CenterNodeCompleted(content: content)
              : CenterNodeNormal(content: content)
        : isCompleted
        ? EndNodeCompleted(content: content)
        : EndNodeNormal(content: content);
  }
}
