import 'package:flutter/material.dart';
import 'package:sushil_s_application/core/utils/image_constant.dart';
import 'package:sushil_s_application/theme/theme_helper.dart';
import 'package:sushil_s_application/theme/text_style_helper.dart';
import 'package:sushil_s_application/widgets/custom_app_bar.dart';
import 'package:sushil_s_application/widgets/custom_bottom_bar.dart';
import 'package:sushil_s_application/widgets/custom_image_view.dart';
import 'package:sushil_s_application/routes/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.colorFFF7F9,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: CustomAppBar(
          title: 'Profile',
          onBackPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTopProfileCard(context),
            SizedBox(height: 20.h),
            _buildStatsCard(),
            SizedBox(height: 24.h),
            _buildMenuSection(context),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        selectedIndex: 3,
        onChanged: (index) {
          final bottomBarItems = [
            CustomBottomBarItem(
              icon: ImageConstant.imgDepth4Frame0BlueGray50001,
              activeIcon: ImageConstant.imgDepth4Frame0Black900,
              title: 'Members',
              routeName: AppRoutes.teamMembersScreen,
            ),
            CustomBottomBarItem(
              icon: ImageConstant.imgDepth4Frame0BlueGray500,
              activeIcon: ImageConstant.imgDepth4Frame0BlueGray500,
              title: 'Tasks',
              routeName: AppRoutes.addTaskScreen,
            ),
            CustomBottomBarItem(
              icon: ImageConstant.imgDepth4Frame0BlueGray50032x24,
              activeIcon: ImageConstant.imgDepth4Frame0BlueGray50032x24,
              title: 'Escalations',
              routeName: AppRoutes.escalationsScreen,
            ),
            CustomBottomBarItem(
              icon: ImageConstant.imgDepth4Frame032x24,
              activeIcon: ImageConstant.imgDepth4Frame032x24,
              title: 'Profile',
              routeName: AppRoutes.profileScreen,
            ),
          ];
          final routeName = bottomBarItems[index].routeName;
          if (routeName.isNotEmpty) {
            Navigator.pushNamed(context, routeName);
          }
        },
        bottomBarItems: [
          CustomBottomBarItem(
            icon: ImageConstant.imgDepth4Frame0BlueGray50001,
            activeIcon: ImageConstant.imgDepth4Frame0Black900,
            title: 'Members',
            routeName: AppRoutes.teamMembersScreen,
          ),
          CustomBottomBarItem(
            icon: ImageConstant.imgDepth4Frame0BlueGray500,
            activeIcon: ImageConstant.imgDepth4Frame0BlueGray500,
            title: 'Tasks',
            routeName: AppRoutes.addTaskScreen,
          ),
          CustomBottomBarItem(
            icon: ImageConstant.imgDepth4Frame0BlueGray50032x24,
            activeIcon: ImageConstant.imgDepth4Frame0BlueGray50032x24,
            title: 'Escalations',
            routeName: AppRoutes.escalationsScreen,
          ),
          CustomBottomBarItem(
            icon: ImageConstant.imgDepth4Frame032x24,
            activeIcon: ImageConstant.imgDepth4Frame032x24,
            title: 'Profile',
            routeName: AppRoutes.profileScreen,
          ),
        ],
      ),
    );
  }

  Widget _buildTopProfileCard(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: appTheme.whiteCustom,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 12.r,
              offset: Offset(0, 6.h),
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            CustomImageView(
              imagePath: ImageConstant.imgDepth5Frame0,
              height: 90.h,
              width: 90.h,
              radius: BorderRadius.circular(45.r),
              fit: BoxFit.cover,
            ),
            SizedBox(height: 14.h),
            Text(
              'Sophia',
              style: TextStyleHelper.instance.title18Bold.copyWith(
                fontSize: 22.sp,
                color: appTheme.colorFF197F,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'sophia.w@gmail.com',
              style: TextStyleHelper.instance.title16.copyWith(
                color: appTheme.colorFF0C14.withOpacity(0.7),
              ),
            ),
            SizedBox(height: 18.h),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsCard() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        decoration: BoxDecoration(
          color: appTheme.whiteCustom,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatItem(Icons.assignment, 'Assigned', '3', appTheme.colorFF197F),
            _buildStatItem(Icons.warning_amber_rounded, 'Overdue', '1', Colors.redAccent),
            _buildStatItem(Icons.check_circle_outline, 'Completed', '5', Colors.green),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String label, String value, Color iconColor) {
    return Column(
      children: [
        Icon(icon, color: iconColor, size: 28.h),
        SizedBox(height: 6.h),
        Text(
          value,
          style: TextStyleHelper.instance.title18Bold.copyWith(fontSize: 20.sp),
        ),
        SizedBox(height: 2.h),
        Text(
          label,
          style: TextStyleHelper.instance.title16.copyWith(color: appTheme.colorFF0C14),
        ),
      ],
    );
  }

  Widget _buildMenuSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        decoration: BoxDecoration(
          color: appTheme.whiteCustom,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: Column(
          children: [
            _buildMenuItem(
              icon: Icons.person_outline,
              text: 'Edit Profile',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.notifications_none,
              text: 'Notifications',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.settings_outlined,
              text: 'Settings',
              onTap: () {},
            ),
            Divider(height: 1, color: appTheme.colorFFE8ED),
            _buildMenuItem(
              icon: Icons.logout,
              text: 'Logout',
              textColor: Colors.red,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    Color? textColor,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: appTheme.colorFF0C14,
      ),
      title: Text(
        text,
        style: TextStyleHelper.instance.title16.copyWith(color: textColor),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16.h,
        color: appTheme.colorFF0C14,
      ),
      onTap: onTap,
    );
  }
} 