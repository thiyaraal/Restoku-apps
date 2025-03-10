import 'package:flutter/material.dart';
import 'package:restoku_app/core/constants/color_style.dart';
import 'package:restoku_app/core/constants/image_network.dart';
import 'package:restoku_app/core/constants/text_style.dart';

class ItemMenuCard extends StatelessWidget {
  final String menuName;
  final String category;

  const ItemMenuCard({
    super.key,
    required this.menuName,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    String photoImage = category.toLowerCase() == 'foods'
        ? ImageNetwork.foods
        : ImageNetwork.drinks;

    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorStyles.primary,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: ColorStyles.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  photoImage,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            menuName,
            style: TextStyles.regularBodyMedium(context)?.copyWith(
              color: ColorStyles.white,
            ),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
