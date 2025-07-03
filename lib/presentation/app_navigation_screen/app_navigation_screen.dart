import 'package:flutter/material.dart';
import 'package:sushil_s_application/core/utils/size_utils.dart';
import 'package:sushil_s_application/presentation/task_escalation_log/task_escalation_log_screen.dart';
import 'package:sushil_s_application/presentation/team_members/team_members_screen.dart';
import 'package:sushil_s_application/theme/text_style_helper.dart';


class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Column(
                    children: [
                      _buildScreenTitle(
                        context,
                        screenTitle: "Escalation Log",
                        onTapScreenTitle: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TaskEscalationLogScreen()),
                        ),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "Family Members",
                        onTapScreenTitle: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TeamMembersScreen()),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle?.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        decoration: BoxDecoration(color: Color(0XFFFFFFFF)),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyleHelper.instance.title20RegularRoboto
                      .copyWith(color: Color(0XFF000000)),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Color(0XFF343330),
                )
              ],
            ),
            SizedBox(height: 10.h),
            Divider(height: 1.h, thickness: 1.h, color: Color(0XFFD2D2D2)),
          ],
        ),
      ),
    );
  }
}
