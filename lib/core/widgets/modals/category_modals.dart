import 'package:flutter/material.dart';
import 'package:restoku_app/core/constants/color_style.dart';
import 'package:restoku_app/core/constants/image_network.dart';
import 'package:provider/provider.dart';
import 'package:restoku_app/core/constants/text_style.dart';
import 'package:restoku_app/features/order/view_models/detail_restaurant_provider.dart';

void showCategoriesModal(BuildContext context) {
  final provider = Provider.of<DetailRestaurantProvider>(context, listen: false);

  final hasFoods = provider.detail?.restaurant?.menus?.foods?.isNotEmpty ?? false;
  final hasDrinks = provider.detail?.restaurant?.menus?.drinks?.isNotEmpty ?? false;

  if (!hasFoods && !hasDrinks) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("No categories available"),
        duration: Duration(seconds: 2),
      ),
    );
    return;
  }

  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    ),
    builder: (BuildContext context) {
      return const CategoriesModalContent();
    },
  );
}


class CategoriesModalContent extends StatelessWidget {
  const CategoriesModalContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailRestaurantProvider>(
      builder: (context, provider, child) {
        final hasFoods = provider.detail?.restaurant?.menus?.foods?.isNotEmpty ?? false;
        final hasDrinks = provider.detail?.restaurant?.menus?.drinks?.isNotEmpty ?? false;

        List<Map<String, String>> categories = [];
        if (hasFoods) {
          categories.add(
            {"title": "Foods", "image": ImageNetwork.foods, "type": "foods"},
          );
        }
        if (hasDrinks) {
          categories.add(
            {"title": "Drinks", "image": ImageNetwork.drinks, "type": "drinks"},
          );
        }

        return Container(
          decoration: BoxDecoration(
            color: ColorStyles.tertiary,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Categories Menu",
                style: TextStyles.boldHeadlineSmall(context)?.copyWith(
                  color: ColorStyles.primary,
                ),
              ),
              const SizedBox(height: 20),
              categories.isEmpty
                  ? Center(
                      child: Text(
                        "No menu available",
                        style: TextStyles.regularBodyLarge(context)?.copyWith(
                          color: ColorStyles.black,
                        ),
                      ),
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: categories.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.2,
                      ),
                      itemBuilder: (context, index) {
                        final category = categories[index];

                        return GestureDetector(
                          onTap: () {
                            provider.setCategory(category["type"]!);
                            Navigator.pop(context);
                          },
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  category["image"]!,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) => 
                                    const Icon(Icons.image_not_supported, size: 100, color: Colors.grey),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                category["title"]!,
                                style: TextStyles.boldBodyLarge(context)?.copyWith(
                                  color: ColorStyles.black,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ],
          ),
        );
      },
    );
  }
}
