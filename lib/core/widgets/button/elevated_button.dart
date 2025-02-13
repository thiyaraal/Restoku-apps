import 'package:flutter/material.dart';
import 'package:restoku_app/core/constants/color_style.dart';
import 'package:restoku_app/core/constants/text_style.dart';

enum ButtonVariant {
  primary,
  secondary,
  disabled,
}

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.variant,
    this.labelText,
    this.buttonStyle,
    this.height,
    this.width,
    this.fontSize,
  });

  final VoidCallback onPressed;
  final ButtonVariant variant;
  final String? labelText;
  final ButtonStyle? buttonStyle;
  final double? width;
  final double? height;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    
    Color buttonColor = ColorStyles.primary;
    Color textColor = ColorStyles.white;

    switch (variant) {
      case ButtonVariant.primary:
        buttonColor = ColorStyles.primary;
        textColor = ColorStyles.white;
        break;

      case ButtonVariant.secondary:
        buttonColor = ColorStyles.tertiary;
        textColor = ColorStyles.black;
        break;
      case ButtonVariant.disabled:
        buttonColor = ColorStyles.disabled;
        textColor = ColorStyles.secondary;
        break;
    }

    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = width ?? screenWidth;
    double buttonHeight = height ?? 50;
     


    return ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle ??
          ElevatedButton.styleFrom(
            minimumSize: Size(buttonWidth, buttonHeight),
            padding: const EdgeInsets.symmetric(vertical: 12),
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
      child: Text(
        labelText ?? "null",
        style: TextStyles.regularBodyLarge(context)?.copyWith(
          color: textColor, fontSize: fontSize ?? 16,
        ),
      ),
    );
  }
}
