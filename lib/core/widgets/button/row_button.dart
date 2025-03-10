import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:restoku_app/core/constants/color_style.dart';
import 'package:restoku_app/core/constants/text_style.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  
  const CustomHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        20.0,
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              TablerIcons.chevron_compact_left,
              color: ColorStyles.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Text(
            title,
            style: TextStyles.regularHeadlineSmall(context)
                ?.copyWith(color: ColorStyles.white),
          ),
        ],
      ),
    );
  }
}
