import 'package:flutter/material.dart';
import 'package:sushil_s_application/core/utils/image_constant.dart';
import 'package:sushil_s_application/theme/theme_helper.dart';
import '../theme/text_style_helper.dart';
import 'custom_image_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




/**
 * CustomAppBar - A reusable app bar component with back navigation and customizable title
 * 
 * Features:
 * - Consistent Material Design appearance
 * - Customizable title text
 * - Optional back button with custom callback
 * - Responsive sizing using SizeUtils
 * - Theme-aware styling
 * 
 * @param title - The title text to display in the app bar
 * @param onBackPressed - Optional callback function for back button tap
 * @param showBackButton - Whether to show the back button (defaults to true)
 * @param backgroundColor - Background color of the app bar
 */
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.onBackPressed,
    this.showBackButton,
    this.backgroundColor,
  }) : super(key: key);

  /// The title text displayed in the app bar
  final String? title;

  /// Callback function triggered when back button is pressed
  final VoidCallback? onBackPressed;

  /// Whether to show the back button
  final bool? showBackButton;

  /// Background color of the app bar
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? appTheme.colorFFF7F9,
      elevation: 0,
      toolbarHeight: 56.0,
      automaticallyImplyLeading: false,
      leading: (showBackButton ?? true)
          ? IconButton(
              onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
              icon: CustomImageView(
                imagePath: ImageConstant.imgDepth4Frame0,
                height: 24.h,
                width: 24.h,
              ),
              padding: EdgeInsets.all(12.h),
            )
          : null,
      title: Text(
        title ?? "",
        style: TextStyleHelper.instance.title18Bold2.copyWith(height: 1.28),
      ),
      titleSpacing: (showBackButton ?? true) ? 0 : 16.h,
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(72.h);
}
