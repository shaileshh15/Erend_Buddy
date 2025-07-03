import 'package:flutter/material.dart';
import 'package:sushil_s_application/theme/text_style_helper.dart';
import 'package:sushil_s_application/widgets/custom_image_view.dart';
import 'package:sushil_s_application/routes/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, AppRoutes.onboardingScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF274B4B),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFF274B4B),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: ScreenUtil().setHeight(343),
                left: ScreenUtil().setWidth(125),
                child: CustomImageView(
                  imagePath: 'assets/images/img_image_1.png',
                  height: ScreenUtil().setHeight(140),
                  width: ScreenUtil().setWidth(140),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: ScreenUtil().setHeight(458),
                left: ScreenUtil().setWidth(42),
                child: SizedBox(
                  height: ScreenUtil().setHeight(69),
                  width: ScreenUtil().setWidth(306),
                  child: Text(
                    'ERAND BUDDY',
                    style: TextStyleHelper.instance.display40BoldPlaypenSans
                        .copyWith(height: 1.525, color: Colors.white, fontSize: 40.sp),
                    textAlign: TextAlign.left,
                    softWrap: false,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
