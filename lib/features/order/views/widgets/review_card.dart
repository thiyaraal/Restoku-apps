import 'package:flutter/material.dart';
import 'package:restoku_app/core/constants/color_style.dart';
import 'package:restoku_app/core/constants/image_network.dart';
import 'package:restoku_app/core/constants/text_style.dart';
import 'package:restoku_app/core/widgets/custom/box_decoration.dart';

class ReviewCard extends StatelessWidget {
  final String name;
  final String review;

  final Color? color;
  const ReviewCard(
      {super.key, required this.name, required this.review, this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: CircleAvatar(
            backgroundColor: ColorStyles.tertiary,
            child: Image.network(
              ImageNetwork.review,
            )),
        title: Text(name,
            style: TextStyles.boldBodyLarge(context)?.copyWith(
              color: CustomDecorations.darkThemeTextColor(context),
            )),
        subtitle: Text(review,
            style: TextStyles.regularBodyMedium(context)?.copyWith(
              color: ColorStyles.secondary
            )),
      ),
    );
  }
}
