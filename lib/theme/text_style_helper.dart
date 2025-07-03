import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/theme_helper.dart';


/// A helper class for managing text styles in the application
class TextStyleHelper {
  static TextStyleHelper? _instance;

  TextStyleHelper._();

  static TextStyleHelper get instance {
    _instance ??= TextStyleHelper._();
    return _instance!;
  }

  // Title Styles
  // Medium text styles for titles and subtitles

  TextStyle get title20RegularRoboto => TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      );

  TextStyle get title18Bold => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: appTheme.colorFF0C14,
      );

  TextStyle get title18Bold2 => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: appTheme.colorFF0C14,
      );

  TextStyle get title16Medium => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: appTheme.colorFF0C14,
      );

  TextStyle get title16Regular => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: appTheme.colorFF0C14,
      );

  TextStyle get title16Bold => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: appTheme.colorFF0C14,
      );

  TextStyle get title16 => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: appTheme.colorFF0C14,
  );

  // Body Styles
  // Standard text styles for body content

  TextStyle get body14Regular => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: appTheme.colorFF4F72,
      );

  TextStyle get body12Medium => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
      );

  TextStyle get display40BoldPlaypenSans => TextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeight.bold,
    fontFamily: 'Playpen Sans',
    color: appTheme.colorFF0C14,
  );

  TextStyle get textStyle5 => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: appTheme.colorFF0C14,
  );
}
