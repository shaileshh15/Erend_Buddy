import 'package:flutter/material.dart';
import '../theme/theme_helper.dart';
import '../theme/text_style_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class EscalatedTaskItem extends StatelessWidget {
  final EscalatedTaskModel escalatedTask;

  EscalatedTaskItem({
    Key? key,
    required this.escalatedTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  escalatedTask.taskName ?? '',
                  style: TextStyleHelper.instance.title16Medium
                      .copyWith(height: 1.31),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Originally assigned to ${escalatedTask.originalAssignee ?? ''}',
                  style: TextStyleHelper.instance.body14Regular
                      .copyWith(height: 1.29),
                ),
              ],
            ),
          ),
          Text(
            escalatedTask.overdueBy ?? '',
            style:
                TextStyleHelper.instance.title16Regular.copyWith(height: 1.31),
          ),
        ],
      ),
    );
  }
}

class EscalatedTaskModel {
  String? taskName;
  String? originalAssignee;
  String? overdueBy;

  EscalatedTaskModel({
    this.taskName,
    this.originalAssignee,
    this.overdueBy,
  });
}
