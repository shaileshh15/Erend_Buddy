import 'package:flutter/material.dart';
import 'package:sushil_s_application/core/utils/image_constant.dart';
import 'package:sushil_s_application/theme/text_style_helper.dart';
import 'package:sushil_s_application/theme/theme_helper.dart';
import 'package:sushil_s_application/widgets/custom_app_bar.dart';
import 'package:sushil_s_application/widgets/custom_bottom_bar.dart';
import 'package:sushil_s_application/widgets/escalated_task_item.dart';
import 'package:sushil_s_application/routes/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


// ignore: must_be_immutable
class TaskEscalationLogScreen extends StatelessWidget {
  TaskEscalationLogScreen({Key? key}) : super(key: key);

  List<EscalatedTaskModel> escalatedTasks = [
    EscalatedTaskModel(
      taskName: 'Grocery Shopping',
      originalAssignee: 'Alex',
      overdueBy: 'Overdue by 24 hours',
    ),
    EscalatedTaskModel(
      taskName: 'Pay Bills',
      originalAssignee: 'Sarah',
      overdueBy: 'Overdue by 12 hours',
    ),
    EscalatedTaskModel(
      taskName: 'Clean the House',
      originalAssignee: 'David',
      overdueBy: 'Overdue by 36 hours',
    ),
    EscalatedTaskModel(
      taskName: 'Laundry',
      originalAssignee: 'Emily',
      overdueBy: 'Overdue by 48 hours',
    ),
    EscalatedTaskModel(
      taskName: 'Walk the Dog',
      originalAssignee: 'Michael',
      overdueBy: 'Overdue by 6 hours',
    ),
  ];

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
      routeName: AppRoutes.tasksScreen,
    ),
    CustomBottomBarItem(
      icon: ImageConstant.imgDepth4Frame0Gray900,
      activeIcon: ImageConstant.imgDepth4Frame0Gray900,
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
      backgroundColor: appTheme.colorFFF7F9,
      appBar: CustomAppBar(
        title: 'Escalation Log',
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),
            Text(
              'Escalated Tasks',
              style:
                  TextStyleHelper.instance.title18Bold.copyWith(height: 1.28),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.separated(
                itemCount: escalatedTasks.length,
                separatorBuilder: (context, index) => SizedBox(height: 16.h),
                itemBuilder: (context, index) {
                  return EscalatedTaskItem(
                    escalatedTask: escalatedTasks[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        bottomBarItems: bottomBarItems,
        selectedIndex: 2,
        onChanged: (index) => _onBottomBarItemTap(context, index),
      ),
    );
  }

  void _onBottomBarItemTap(BuildContext context, int index) {
    final routeName = bottomBarItems[index].routeName;
    if (routeName.isNotEmpty && ModalRoute.of(context)?.settings.name != routeName) {
      Navigator.pushReplacementNamed(context, routeName);
    }
  }
}

// Modified: Removed duplicate EscalatedTaskModel class definition to resolve type conflict
