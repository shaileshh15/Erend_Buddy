// Copied from ../shailesh_s_application-main/lib/widgets/custom_button.dart
// ... file content will be inserted here ... 

import 'package:flutter/material.dart';
import '../core/app_export.dart';
import './custom_image_view.dart';
import 'package:sushil_s_application/theme/theme_helper.dart';
import 'package:sushil_s_application/theme/text_style_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * CustomButton - A flexible button component that supports both text and avatar variants
 * 
 * This component can render as either a text button or an avatar button based on the provided parameters.
 * It supports customizable colors, dimensions, and styling while maintaining consistent interaction patterns.
 * 
 * @param text - The text to display (for text button variant)
 * @param imagePath - The path to the image (for avatar button variant)  
 * @param onPressed - Callback function triggered when button is pressed
 * @param buttonType - Type of button (text or avatar)
 * @param backgroundColor - Background color of the button
 * @param textColor - Color of the text (for text buttons)
 * @param hoverColor - Color when button is hovered/focused
 * @param width - Width of the button
 * @param height - Height of the button
 * @param borderRadius - Border radius of the button
 * @param padding - Internal padding of the button
 * @param fontSize - Font size for text buttons
 * @param fontWeight - Font weight for text buttons
 * @param isEnabled - Whether the button is enabled
 */
class CustomButton extends StatefulWidget {
  const CustomButton({
    Key? key,
    this.text,
    this.imagePath,
    this.onPressed,
    this.buttonType,
    this.backgroundColor,
    this.textColor,
    this.hoverColor,
    this.width,
    this.height,
    this.borderRadius,
    this.padding,
    this.fontSize,
    this.fontWeight,
    this.isEnabled,
  }) : super(key: key);

  final String? text;
  final String? imagePath;
  final VoidCallback? onPressed;
  final CustomButtonType? buttonType;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? hoverColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool? isEnabled;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final buttonType = widget.buttonType ?? _determineButtonType();
    final isEnabled = widget.isEnabled ?? true;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: isEnabled ? widget.onPressed : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: _getButtonWidth(buttonType),
          height: _getButtonHeight(buttonType),
          padding: _getButtonPadding(buttonType),
          decoration: BoxDecoration(
            color: _getBackgroundColor(buttonType),
            borderRadius: BorderRadius.circular(_getBorderRadius(buttonType)),
          ),
          child: _buildButtonContent(buttonType),
        ),
      ),
    );
  }

  CustomButtonType _determineButtonType() {
    if (widget.imagePath != null) {
      return CustomButtonType.avatar;
    }
    return CustomButtonType.text;
  }

  double? _getButtonWidth(CustomButtonType type) {
    if (widget.width != null) return widget.width;

    switch (type) {
      case CustomButtonType.avatar:
        return 34.h;
      case CustomButtonType.text:
      default:
        return null;
    }
  }

  double _getButtonHeight(CustomButtonType type) {
    if (widget.height != null) return widget.height!;

    switch (type) {
      case CustomButtonType.avatar:
        return 44.h;
      case CustomButtonType.text:
      default:
        return 36.h;
    }
  }

  EdgeInsetsGeometry _getButtonPadding(CustomButtonType type) {
    if (widget.padding != null) return widget.padding!;

    switch (type) {
      case CustomButtonType.avatar:
        return EdgeInsets.zero;
      case CustomButtonType.text:
      default:
        return EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h);
    }
  }

  double _getBorderRadius(CustomButtonType type) {
    if (widget.borderRadius != null) return widget.borderRadius!;

    switch (type) {
      case CustomButtonType.avatar:
        return 22.h; // Half of height for circular shape
      case CustomButtonType.text:
      default:
        return 8.h;
    }
  }

  Color _getBackgroundColor(CustomButtonType type) {
    if (_isHovered && widget.hoverColor != null) {
      return widget.hoverColor!;
    }

    if (widget.backgroundColor != null) return widget.backgroundColor!;

    switch (type) {
      case CustomButtonType.avatar:
        return appTheme.transparentCustom;
      case CustomButtonType.text:
      default:
        return _isHovered ? appTheme.colorFF197F : appTheme.colorFFE8ED;
    }
  }

  Color _getTextColor(CustomButtonType type) {
    if (widget.textColor != null) return widget.textColor!;

    switch (type) {
      case CustomButtonType.text:
      default:
        return _isHovered ? appTheme.whiteCustom : appTheme.colorFF0C14;
    }
  }

  Widget _buildButtonContent(CustomButtonType type) {
    switch (type) {
      case CustomButtonType.avatar:
        return ClipRRect(
          borderRadius: BorderRadius.circular(_getBorderRadius(type)),
          child: CustomImageView(
            imagePath: widget.imagePath ?? '',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        );
      case CustomButtonType.text:
      default:
        return Center(
          child: Text(
            widget.text ?? 'Button',
            style: TextStyleHelper.instance.textStyle5
                .copyWith(color: _getTextColor(type)),
          ),
        );
    }
  }
}

enum CustomButtonType {
  text,
  avatar,
} 