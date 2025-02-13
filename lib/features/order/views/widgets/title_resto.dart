import 'package:flutter/material.dart';
import 'package:restoku_app/core/constants/color_style.dart';
import 'package:restoku_app/core/constants/text_style.dart';

class TitleResto extends StatelessWidget {
  final String restoName;
  final String rate;
  const TitleResto({super.key, required this.restoName, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Hero(
          tag: 'hero-title-$restoName',
          child: Text(
            restoName,
            style: TextStyles.regularHeadlineSmall(context)?.copyWith(
              color: ColorStyles.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Row(
          children: [
            Text(
              rate,
              style: TextStyles.regularBodyLarge(context)
                  ?.copyWith(color: ColorStyles.white),
            ),
            const SizedBox(width: 5),
            const Icon(
              Icons.star,
              color: ColorStyles.warning,
              size: 18,
            ),
          ],
        ),
      ],
    );
  }
}
