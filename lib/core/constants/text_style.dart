import 'package:flutter/material.dart';

import 'package:restoku_app/core/constants/color_style.dart';

class TextStyles {
  static TextStyle? regularDisplayLarge(BuildContext context) {
    return Theme.of(context).textTheme.displayLarge?.copyWith(
          color: ColorStyles.black,
        );
  }

  static TextStyle? regularDisplayMedium(BuildContext context) {
    return Theme.of(context).textTheme.displayMedium?.copyWith(
          color: ColorStyles.black,
        );
  }

  static TextStyle? regularBodyMedium(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: ColorStyles.black,
        );
  }

  static TextStyle? boldBodyMedium(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: ColorStyles.black,
          fontWeight: FontWeight.bold,
        );
  }

  static TextStyle? italicDisplayLarge(BuildContext context) {
    return Theme.of(context).textTheme.displayLarge?.copyWith(
          color: ColorStyles.black,
          fontStyle: FontStyle.italic,
        );
  }

  static TextStyle? boldBodyLarge(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: ColorStyles.black,
          fontWeight: FontWeight.bold,
        );
  }

  static TextStyle? boldBodySmall(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall?.copyWith(
          color: ColorStyles.black,
          fontWeight: FontWeight.bold,
        );
  }

  static TextStyle? boldBodyLargeWhite(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: ColorStyles.white,
          fontWeight: FontWeight.bold,
        );
  }

  static TextStyle? boldBodyMediumWhite(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: ColorStyles.white,
          fontWeight: FontWeight.bold,
        );
  }

  static TextStyle? boldBodySmallWhite(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall?.copyWith(
          color: ColorStyles.white,
          fontWeight: FontWeight.bold,
        );
  }

  static TextStyle? regularBodyLarge(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: ColorStyles.black,
        );
  }

  static TextStyle? regularBodySmall(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall?.copyWith(
          color: ColorStyles.black,
        );
  }

  static TextStyle? regularBodySmallWhite(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall?.copyWith(
          color: ColorStyles.white,
        );
  }

  static TextStyle? regularHeadlineSmall(BuildContext context) {
    return Theme.of(context).textTheme.headlineSmall?.copyWith(
          color: ColorStyles.black,
        );
  }

  static TextStyle? boldHeadlineSmall(BuildContext context) {
    return Theme.of(context).textTheme.headlineSmall?.copyWith(
          color: ColorStyles.black,
          fontWeight: FontWeight.bold,
        );
  }

  static TextStyle? boldHeadlineSmallWhite(BuildContext context) {
    return Theme.of(context).textTheme.headlineSmall?.copyWith(
          color: ColorStyles.white,
          fontWeight: FontWeight.bold,
        );
  }

  static TextStyle? boldHeadlineMediumWhite(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium?.copyWith(
          color: ColorStyles.white,
          fontWeight: FontWeight.bold,
        );
  }

  static TextStyle? boldHeadlineMedium(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium?.copyWith(
          color: ColorStyles.black,
          fontWeight: FontWeight.bold,
        );
  }

  static TextStyle? boldHeadlineLarge(BuildContext context) {
    return Theme.of(context).textTheme.headlineLarge?.copyWith(
          color: ColorStyles.black,
          fontWeight: FontWeight.bold,
        );
  }

  static TextStyle? boldHeadlineLargeWhite(BuildContext context) {
    return Theme.of(context).textTheme.headlineLarge?.copyWith(
          color: ColorStyles.white,
          fontWeight: FontWeight.bold,
        );
  }

  static TextStyle? regularDisplaySmall(BuildContext context) {
    return Theme.of(context).textTheme.displaySmall?.copyWith(
          color: ColorStyles.black,
        );
  }
}
