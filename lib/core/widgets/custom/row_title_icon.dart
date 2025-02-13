import 'package:flutter/material.dart';
import 'package:restoku_app/core/constants/color_style.dart';
import 'package:restoku_app/core/constants/text_style.dart';

class RowTitleIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function() actionIcon;
  const RowTitleIcon(
      {super.key,
      required this.title,
      required this.icon,
      required this.actionIcon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyles.regularHeadlineSmall(context)?.copyWith(
            color: ColorStyles.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        IconButton(
          onPressed: actionIcon,
          icon: Icon(
            icon,
            color: Colors.white,
            size:20,
          ),
        ),
      ],
    );
  }
}
