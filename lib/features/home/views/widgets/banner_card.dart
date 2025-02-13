import 'package:flutter/material.dart';
import 'package:restoku_app/core/constants/color_style.dart';
import 'package:restoku_app/core/constants/image_asset.dart';
import 'package:restoku_app/core/constants/text_style.dart';
import 'package:restoku_app/core/widgets/button/elevated_button.dart';

class BannerCard extends StatelessWidget {
  final String title;
  final String bigTitle;
  final String describ;
  final String textButton;
  final VoidCallback actionButton;
  const BannerCard(
      {super.key,
      required this.actionButton,

      required this.title,
      required this.bigTitle,
      required this.describ,
      required this.textButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                ImageAsset.bannerHome,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 160,
              ),
            ),
            Positioned(
              left: 16,
              top: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyles.regularBodyMedium(context)?.copyWith(
                      color: ColorStyles.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    bigTitle,
                    style: TextStyles.regularDisplayMedium(context)?.copyWith(
                      color: ColorStyles.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    describ,
                    style: TextStyles.regularBodySmall(context)?.copyWith(
                      color: ColorStyles.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  CustomElevatedButton(
                    fontSize: 14,
                    height: 40,
                    width: 120,
                    onPressed: () {},
                    variant: ButtonVariant.primary,
                    labelText: "Order Now",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
