import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:restoku_app/core/constants/color_style.dart';

class TopSnackBarWidget {
  static void show({
    required BuildContext context,
    required String message,
    Color backgroundColor = ColorStyles.success,
    IconData icon = Icons.info_outline,
    Duration duration = const Duration(seconds: 3),
    FlushbarPosition position = FlushbarPosition.TOP,
  }) {
    Flushbar(
      message: message,
      duration: duration,
      backgroundColor: backgroundColor,
      flushbarPosition: position,
      borderRadius: BorderRadius.circular(8),
      margin: const EdgeInsets.all(16),
      icon: Icon(
        icon,
        color: Colors.white,
      ),
    ).show(context);
  }

  
  static void showErrorSnackBar(BuildContext context, String message) {
    TopSnackBarWidget.show(
      context: context,
      message: message,
      backgroundColor: ColorStyles.warning,
      icon: TablerIcons.mood_happy,
    );
  }

  
  static void showSuccessSnackBar(BuildContext context, String message) {
    TopSnackBarWidget.show(
      context: context,
      message: message,
      backgroundColor: ColorStyles.success,
      icon: TablerIcons.mood_happy,
    );
  }

  static void showInfoSnackBar(BuildContext context, String message) {
    TopSnackBarWidget.show(
      context: context,
      message: message,
      backgroundColor: ColorStyles.primary,
      icon: TablerIcons.mood_happy,
    );
  }
}
