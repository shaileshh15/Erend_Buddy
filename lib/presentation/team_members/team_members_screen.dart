import 'package:flutter/material.dart';
import 'package:sushil_s_application/core/utils/image_constant.dart';
import 'package:sushil_s_application/theme/theme_helper.dart';
import 'package:sushil_s_application/widgets/custom_app_bar.dart';
import 'package:sushil_s_application/widgets/custom_bottom_bar.dart';
import 'package:sushil_s_application/widgets/member_card_widget.dart';
import 'package:sushil_s_application/widgets/member_model.dart';
import 'package:sushil_s_application/routes/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TeamMembersScreen extends StatelessWidget {
  TeamMembersScreen({Key? key}) : super(key: key);

  final List<MemberModel> membersList = [
    MemberModel(
      id: 'sophia',
      name: 'Sophia',
      imagePath: ImageConstant.imgDepth5Frame0,
      assigned: 3,
      overdue: 1,
      completed: 5,
    ),
    MemberModel(
      id: 'ethan',
      name: 'Ethan',
      imagePath: ImageConstant.imgDepth5Frame040x40,
      assigned: 2,
      overdue: 0,
      completed: 7,
    ),
    MemberModel(
      id: 'liam',
      name: 'Liam',
      imagePath: ImageConstant.imgDepth5Frame01,
      assigned: 4,
      overdue: 2,
      completed: 3,
    ),
    MemberModel(
      id: 'olivia',
      name: 'Olivia',
      imagePath: ImageConstant.imgDepth5Frame02,
      assigned: 1,
      overdue: 0,
      completed: 6,
    ),
    MemberModel(
      id: 'noah',
      name: 'Noah',
      imagePath: ImageConstant.imgDepth5Frame03,
      assigned: 3,
      overdue: 1,
      completed: 4,
    ),
    MemberModel(
      id: 'ava',
      name: 'Ava',
      imagePath: ImageConstant.imgDepth5Frame04,
      assigned: 2,
      overdue: 0,
      completed: 5,
    ),
  ];

  // Modified: Removed local CustomBottomBarItem class to use the one from widgets/custom_bottom_bar.dart
  final List<CustomBottomBarItem> bottomBarItems = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: appTheme.colorFFF7F9,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: CustomAppBar(
          title: 'Members',
          onBackPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.h),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 16.h,
            childAspectRatio: 1.0,
          ),
          itemCount: membersList.length,
          itemBuilder: (context, index) {
            return MemberCardWidget(
              member: membersList[index],
              onTap: () {
                _onMemberTap(context, membersList[index]);
              },
            );
          },
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        bottomBarItems: bottomBarItems,
        selectedIndex: 0,
        onChanged: (index) => _onBottomBarItemTap(context, index),
      ),
    );
  }

  void _onMemberTap(BuildContext context, MemberModel member) {
    print('Viewing details for: ${member.name}');
  }

  void _onBottomBarItemTap(BuildContext context, int index) {
    final routeName = bottomBarItems[index].routeName;
    if (routeName.isNotEmpty) {
      Navigator.pushNamed(context, routeName);
    }
  }
}
