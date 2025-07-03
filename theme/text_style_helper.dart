import 'package:flutter/material.dart';
import 'package:sushil_s_application/core/utils/size_utils.dart';
import 'package:sushil_s_application/theme/theme_helper.dart';

class TextStyleHelper {
  static final TextStyleHelper instance = TextStyleHelper();

  TextStyle get display40BoldPlaypenSans => TextStyle(
    fontSize: 40.fSize,
    fontWeight: FontWeight.bold,
    fontFamily: 'Playpen Sans',
    color: appTheme.colorFF0C14,
  );
  // ... add other text styles as needed ...
} 