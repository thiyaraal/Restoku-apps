import 'package:flutter/material.dart';
import 'package:restoku_app/core/constants/color_style.dart';
import 'package:restoku_app/core/constants/text_style.dart';

class RestaurantListTile extends StatelessWidget {
  final String name;
  final String city;
  final List<String> menus;
  final VoidCallback onTap;
  final bool isLastItem;

  const RestaurantListTile({
    super.key,
    required this.name,
    required this.city,
    required this.menus,
    required this.onTap,
    required this.isLastItem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            name,
            style: TextStyles.boldBodyMedium(context)?.copyWith(
              color: ColorStyles.white,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (menus.isNotEmpty)
                Text(
                  "Menu: ${menus.join(", ")}",
                  style: TextStyles.regularBodyMedium(context)?.copyWith(
                    color: ColorStyles.white,
                  ),
                ),
              if (menus.isEmpty)
                Text(
                  city,
                  style: TextStyles.regularBodyMedium(context)?.copyWith(
                    color: ColorStyles.white,
                  ),
                ),
              if (!isLastItem)
                Divider(
                  color: ColorStyles.disabled,
                  thickness: 0.5,
                ),
            ],
          ),
          onTap: onTap,
        ),
      ],
    );
  }
}
