import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sushil_s_application/core/utils/size_utils.dart';
import 'package:sushil_s_application/routes/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(ScreenUtilInit(
    designSize: Size(375, 812), // Replace with your Figma artboard size if different
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sushil_s_application',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.linear(1.0)),
          child: child!,
        );
      },
    );
  }
}
