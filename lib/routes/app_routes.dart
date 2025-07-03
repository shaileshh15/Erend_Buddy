import 'package:flutter/material.dart';
import 'package:sushil_s_application/presentation/onboarding_screen/onboarding_screen.dart';
import 'package:sushil_s_application/presentation/splash_screen/splash_screen.dart';
import 'package:sushil_s_application/presentation/team_members/team_members_screen.dart';
import 'package:sushil_s_application/presentation/task_escalation_log/task_escalation_log_screen.dart';
import 'package:sushil_s_application/presentation/add_task_screen/add_task_screen.dart';
import 'package:sushil_s_application/presentation/profile_screen/profile_screen.dart';
import 'package:sushil_s_application/presentation/task/task_screen.dart';


class EscalationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Escalations')),
      body: Center(child: Text('Escalations Screen')),
    );
  }
}

class AppRoutes {
  static const String onboardingScreen = '/onboarding_screen';
  static const String splashScreen = '/splash_screen';
  static const String teamMembersScreen = '/team_members_screen';
  static const String tasksScreen = '/tasks_screen';
  static const String escalationsScreen = '/escalations_screen';
  static const String profileScreen = '/profile_screen';
  static const String addTaskScreen = '/add_task_screen';

  static const String initialRoute = splashScreen;

  static Map<String, WidgetBuilder> get routes => {
        onboardingScreen: (context) => OnboardingScreen(),
        splashScreen: (context) => SplashScreen(),
        teamMembersScreen: (context) => TeamMembersScreen(),
        tasksScreen: (context) => Task(),
        escalationsScreen: (context) => TaskEscalationLogScreen(),
        profileScreen: (context) => const ProfileScreen(),
        addTaskScreen: (context) => AddTaskScreen(),
      };
}
