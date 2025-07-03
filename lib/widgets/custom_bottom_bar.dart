import 'package:flutter/material.dart';
import 'package:sushil_s_application/theme/theme_helper.dart';
import 'package:sushil_s_application/theme/text_style_helper.dart';
import 'custom_image_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';






/**
 * CustomBottomBar - A reusable bottom navigation bar component
 * 
 * Features:
 * - Supports multiple navigation items with icons and labels
 * - Active/inactive states with different styling
 * - Configurable selected index and tap callbacks
 * - Responsive design using SizeUtils
 * - Optional bottom padding area
 * 
 * @param bottomBarItems List of navigation items to display
 * @param selectedIndex Currently selected tab index (default: 0)
 * @param onChanged Callback function when tab is tapped
 * @param showBottomPadding Whether to show additional bottom padding
 * @param backgroundColor Background color of the bottom bar
 * @param borderColor Top border color
 */
class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    Key? key,
    required this.bottomBarItems,
    required this.onChanged,
    this.selectedIndex = 0,
    this.showBottomPadding = false,
    this.backgroundColor,
    this.borderColor,
  }) : super(key: key);

  /// List of bottom bar items with their properties
  final List<CustomBottomBarItem> bottomBarItems;

  /// Current selected index of the bottom bar
  final int selectedIndex;

  /// Callback function triggered when a bottom bar item is tapped
  final Function(int) onChanged;

  /// Whether to show additional bottom padding area
  final bool showBottomPadding;

  /// Background color of the bottom bar
  final Color? backgroundColor;

  /// Top border color
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 56.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: backgroundColor ?? Color(0xFFF7F9FC),
            border: Border(
              top: BorderSide(
                color: borderColor ?? Color(0xFFE8EDF2),
                width: 1.h,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(bottomBarItems.length, (index) {
              final isSelected = selectedIndex == index;
              final item = bottomBarItems[index];

              return InkWell(
                onTap: () => onChanged(index),
                borderRadius: BorderRadius.circular(8.h),
                child: Container(
                  height: 54.h,
                  padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Color(0xFFF3F4F6)
                        : appTheme.transparentCustom,
                    borderRadius: BorderRadius.circular(8.h),
                  ),
                  child: _buildBottomBarItem(item, isSelected),
                ),
              );
            }),
          ),
        ),
        if (showBottomPadding)
          Container(
            height: 20.h,
            width: double.infinity,
            color: backgroundColor ?? Color(0xFFF7F9FC),
          ),
      ],
    );
  }

  /// Builds individual bottom bar item with icon and text
  Widget _buildBottomBarItem(CustomBottomBarItem item, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: isSelected ? item.activeIcon : item.icon,
          height: 24.h,
          width: 24.h,
        ),
        SizedBox(height: 2.h),
        Text(
          item.title,
          style: TextStyleHelper.instance.body12Medium.copyWith(
              color: isSelected ? Color(0xFF0C141C) : appTheme.colorFF4F72,
              height: 1.33),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

/// Item data model for custom bottom bar
class CustomBottomBarItem {
  const CustomBottomBarItem({
    required this.icon,
    required this.activeIcon,
    required this.title,
    required this.routeName,
  });

  /// Path to the inactive state icon
  final String icon;

  /// Path to the active state icon
  final String activeIcon;

  /// Title text shown below the icon
  final String title;

  /// Route name for navigation
  final String routeName;
}
