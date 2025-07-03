import 'package:flutter/material.dart';
import 'package:sushil_s_application/theme/theme_helper.dart';
import 'package:sushil_s_application/theme/text_style_helper.dart';
import 'package:sushil_s_application/widgets/member_model.dart';
import 'custom_image_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberCardWidget extends StatelessWidget {
  final MemberModel member;
  final VoidCallback? onTap;

  MemberCardWidget({
    Key? key,
    required this.member,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          color: appTheme.colorFFF7F9,
          border: Border.all(
            color: appTheme.colorFFD1DB,
            width: 1.h,
          ),
          borderRadius: BorderRadius.circular(8.h),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: member.imagePath ?? '',
              height: 28.h,
              width: 28.h,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 6.h),
            Text(
              member.name ?? '',
              style:
                  TextStyleHelper.instance.title16Bold.copyWith(height: 1.31),
            ),
            SizedBox(height: 2.h),
            Text(
              'Assigned: ${member.assigned ?? 0}, Overdue: ${member.overdue ?? 0}, Completed: ${member.completed ?? 0}',
              style:
                  TextStyleHelper.instance.body14Regular.copyWith(height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
