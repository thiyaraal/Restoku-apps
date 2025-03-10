import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restoku_app/core/constants/color_style.dart';
import 'package:restoku_app/core/constants/image_network.dart';
import 'package:restoku_app/core/constants/text_style.dart';
import 'package:restoku_app/core/widgets/button/elevated_button.dart';
import 'package:restoku_app/features/favorite/models/fav_model.dart';
import 'package:restoku_app/features/favorite/view_models/local_fav_provoder.dart';
import 'package:restoku_app/features/order/views/widgets/expandable_text.dart';

class DescRestoWidget extends StatelessWidget {
  final String restoId;
  final String restoName;
  final String restoAddress;
  final String restoRate;
  final String restoImage;

  final String addres;
  final String description;
  final String typeFood;
  final VoidCallback actionReview;

  const DescRestoWidget(
      {super.key,
      required this.restoId,
      required this.restoName,
      required this.restoAddress,
      required this.restoRate,
      required this.restoImage,
      required this.actionReview,
      required this.typeFood,
      required this.addres,
      required this.description});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    bool isFavorite = favoriteProvider.isRestaurantFavorite(restoId);
    return Column(
      children: [
        const SizedBox(
          height: 12.0,
        ),
        Row(
          children: [
            const Icon(
              Icons.location_on,
              color: ColorStyles.danger,
              size: 18,
            ),
            const SizedBox(width: 5),
            
            Expanded(
              child: Text(
                addres,
                style: TextStyles.regularBodySmall(context)?.copyWith(
                  color: ColorStyles.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            GestureDetector(
              onTap: () {
                favoriteProvider.isRestaurantFavorite(restoId);

                final favoriteRestaurant = FavoriteRestaurant(
                  id: restoId,
                  name: restoName,
                  city: restoAddress,
                  imageUrl: restoImage,
                  rating: double.tryParse(restoRate) ?? 0.0,
                );
                favoriteProvider.toggleFavorite(favoriteRestaurant);
              },
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
                size: 24,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12.0,
        ),
        ExpandableText(
          text: description,
          style: TextStyles.regularBodyLarge(context)?.copyWith(
            color: ColorStyles.white,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.network(
                  ImageNetwork.variant,
                  width: 20,
                ),
                const SizedBox(width: 5),
                Text(
                  typeFood,
                  style: TextStyles.regularBodyMedium(context)
                      ?.copyWith(color: ColorStyles.white),
                ),
              ],
            ),
            CustomElevatedButton(
              fontSize: 14,
              height: 40,
              width: 120,
              onPressed: actionReview,
              variant: ButtonVariant.secondary,
              labelText: "review",
            ),
            
          ],
        ),
      ],
    );
  }
}
