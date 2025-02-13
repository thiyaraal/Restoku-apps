import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';
import 'package:restoku_app/core/helpers/app_routes.dart';
import 'package:restoku_app/core/widgets/custom/theme_widget.dart';
import 'package:restoku_app/core/widgets/custom/row_title_icon.dart';
import 'package:restoku_app/core/widgets/empty_content/empety_widget.dart';
import 'package:restoku_app/core/widgets/modals/category_modals.dart';
import 'package:restoku_app/features/order/view_models/detail_restaurant_provider.dart';
import 'package:restoku_app/features/order/views/widgets/desc_resto.dart';
import 'package:restoku_app/features/order/views/widgets/image_resto_detail.dart';
import 'package:restoku_app/features/order/views/widgets/item_menu.dart';
import 'package:restoku_app/features/order/views/widgets/title_resto.dart';

class DetailRestoScreen extends StatefulWidget {
  final String id;
  final String imageTag;
  final String? imageUrl;
  final String restoName;
  final double rate;

  const DetailRestoScreen({
    super.key,
    required this.id,
    required this.imageTag,
    this.imageUrl,
    required this.restoName,
    required this.rate,
  });

  @override
  State<DetailRestoScreen> createState() => _DetailRestoScreenState();
}

class _DetailRestoScreenState extends State<DetailRestoScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DetailRestaurantProvider>(context, listen: false).fetchDetail(
        widget.id,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: CustomDecorations.backgroundDecoration(context),
        child: SafeArea(
          child: Column(
            children: [
              ImageDetailResto(
                imageUrl: widget.imageUrl ?? '',
                imageTag: widget.imageTag,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: TitleResto(
                  rate: widget.rate.toString(),
                  restoName: widget.restoName,
                ),
              ),
              Expanded(
                child: Consumer<DetailRestaurantProvider>(
                  builder: (context, provider, child) {
                    if (provider.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (provider.error != null) {
                      return Center(child: Text(provider.error!));
                    } else if (provider.detail?.restaurant == null) {
                      return Center(child: BadNetworkWidget(
                        onTap: () {
                          provider.fetchDetail(widget.id);
                        },
                      ));
                    }

                    final resto = provider.detail!.restaurant!;

                    return Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DescRestoWidget(
                            actionReview: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.review,
                                arguments: {
                                  'restaurantId': resto.id ?? '0',
                                },
                              );
                            },
                            typeFood: resto.categories
                                    ?.map((e) => e.name)
                                    .join(', ') ??
                                "Unknown",
                            addres: "${resto.address}, ${resto.city}",
                            description:
                                resto.description ?? "No description available",
                          ),
                          const SizedBox(height: 12.0),
                          RowTitleIcon(
                              title: 'Menu',
                              icon: TablerIcons.list,
                              actionIcon: () {
                                showCategoriesModal(context);
                              }),
                          const SizedBox(height: 12.0),
                          Expanded(
                            child: Consumer<DetailRestaurantProvider>(
                              builder: (context, provider, child) {
                                final menuItems = provider.filteredMenus;

                                return GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1,
                                  ),
                                  itemCount: menuItems.length,
                                  itemBuilder: (context, index) {
                                    final menuItem = menuItems[index];
                                    return ItemMenuCard(
                                      menuName: menuItem.name ?? 'Unknown',
                                      category: provider.selectedCategory,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
