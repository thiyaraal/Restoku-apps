import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:restoku_app/core/constants/color_style.dart';
import 'package:restoku_app/core/constants/text_style.dart';

class RestoCard extends StatelessWidget {
  final String restoId;
  final String restoImage;
  final String restoName;
  final String restoAddress;
  final String restoRate;
  final VoidCallback? actionCard;

  const RestoCard({
    super.key,
    required this.restoId,
    required this.restoImage,
    required this.restoName,
    required this.restoAddress,
    required this.restoRate,
    this.actionCard,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: actionCard,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Hero(
                tag: 'hero-image-$restoId',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    restoImage,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                      tag: 'hero-title-$restoId',
                      child: Text(restoName,
                          style: TextStyles.regularBodyLarge(context))),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(
                        TablerIcons.map_pin_filled,
                        color: ColorStyles.danger,
                        size: 18,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          restoAddress,
                          style: TextStyles.regularBodySmall(context),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(restoRate,
                            style: TextStyles.regularBodyLarge(context)),
                        const SizedBox(width: 5),
                        Icon(
                          TablerIcons.star_filled,
                          color: ColorStyles.warning,
                          size: 18,
                        ),
                      ],
                    ),
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
