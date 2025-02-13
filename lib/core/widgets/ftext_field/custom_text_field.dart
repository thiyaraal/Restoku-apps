import 'package:flutter/material.dart';
import 'package:restoku_app/core/constants/color_style.dart';
import 'package:restoku_app/core/constants/text_style.dart';
import 'package:restoku_app/core/widgets/custom/box_decoration.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final Function()? ontap;
  final Function(String)? onSubmitted;

  const CustomTextField({
    super.key,
    this.ontap,
    this.controller,
    this.onSubmitted,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: TextField(
        onSubmitted: widget.onSubmitted,
        controller: widget.controller,
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor:  CustomDecorations.darkThemeColor(context),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          hintText: widget.hintText,
          hintStyle: TextStyles.regularBodyMedium(context)?.copyWith(
            color: ColorStyles.disabled,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
