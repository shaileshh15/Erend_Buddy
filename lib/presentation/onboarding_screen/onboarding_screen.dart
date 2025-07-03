import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushil_s_application/routes/app_routes.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  bool isLoading = true;
  bool _buttonPressed = false;

  // Personalization: Placeholder for user name
  final String userName = "User";

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/undraw_project-team_dip6.svg",
      "title": "Welcome, User!",
      "subtitle": "Manage daily errands and tasks with ease and fun."
    },
    {
      "image": "assets/images/undraw_team-collaboration_phnf.svg",
      "title": "Collaborate Seamlessly",
      "subtitle": "Work together with friends and family in real-time."
    },
    {
      "image": "assets/images/undraw_virtual-assistant_y1xf.svg",
      "title": "Your Personalized Assistant",
      "subtitle": "Smarter, more personalized task management."
    },
  ];

  @override
  void initState() {
    super.initState();
    // Always show onboarding, do not check onboarding_seen
    setState(() => isLoading = false);
  }

  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_seen', true);
    if (mounted) {
      Navigator.pushReplacementNamed(context, AppRoutes.teamMembersScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Colors.blueAccent;
    final isPortrait = MediaQuery.of(context).size.height > MediaQuery.of(context).size.width;
    if (isLoading) {
      return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Skip button
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(top: 24.h, right: 22.w),
                child: currentPage != onboardingData.length - 1
                    ? TextButton(
                        onPressed: () {
                          _pageController.jumpToPage(onboardingData.length - 1);
                        },
                        child: Text(
                          "Skip",
                          style: GoogleFonts.poppins(
                            color: primaryColor,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() => currentPage = index);
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 81.h),
                      SvgPicture.asset(
                        onboardingData[index]['image']!,
                        height: isPortrait ? 227.h : 365.h,
                        width: 300.w,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 32.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 26.w),
                        child: Text(
                          onboardingData[index]['title']!.replaceAll('User', userName),
                          style: GoogleFonts.poppins(
                            fontSize: 26.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 38.w),
                        child: Text(
                          onboardingData[index]['subtitle']!,
                          style: GoogleFonts.poppins(
                            fontSize: 17.sp,
                            color: Colors.grey[700],
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      const Spacer(),
                    ],
                  );
                },
              ),
            ),
            // Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (dotIndex) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 6.w),
                  width: currentPage == dotIndex ? 22.w : 9.w,
                  height: 9.w,
                  decoration: BoxDecoration(
                    color: currentPage == dotIndex
                        ? primaryColor
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                ),
              ),
            ),
            SizedBox(height: 32.h),
            // Next/Get Started button
            Padding(
              padding: EdgeInsets.fromLTRB(22.w, 8.h, 22.w, 32.h),
              child: SizedBox(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: () async {
                    if (currentPage == onboardingData.length - 1) {
                      await _completeOnboarding();
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    currentPage == onboardingData.length - 1
                        ? "Get Started"
                        : "Next",
                    style: GoogleFonts.poppins(
                      fontSize: 19.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





