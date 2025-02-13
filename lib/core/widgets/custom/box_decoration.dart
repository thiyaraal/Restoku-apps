import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restoku_app/core/constants/color_style.dart';
import 'package:restoku_app/features/profile/services/theme_provider.dart';

class CustomDecorations {
  static BoxDecoration backgroundDecoration(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return BoxDecoration(
      gradient: themeProvider.isDarkMode
          ? null
          : LinearGradient(
              colors: [
                ColorStyles.secondary,
                ColorStyles.primary,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
      color: themeProvider.isDarkMode ? Colors.black : null,
    );
  }

  static BoxDecoration contentDecoration(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return BoxDecoration(
      color: themeProvider.isDarkMode ? ColorStyles.tertiary : Colors.white,
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(60),
      ),
    );
  }

  static Color darkThemeColor(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return themeProvider.isDarkMode ? ColorStyles.tertiary : ColorStyles.white;
  }

  static Color darkThemeTextColor(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return themeProvider.isDarkMode ? ColorStyles.black : ColorStyles.primary;
  }

  static Color darkThemeButtonColor(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return themeProvider.isDarkMode
        ? ColorStyles.tertiary
        : ColorStyles.primary;
  }

  static Color darkThemeBottomNavigationColor(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return themeProvider.isDarkMode ? ColorStyles.black : ColorStyles.white;
  }
 
}
