import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:restoku_app/core/constants/image_network.dart';
import 'package:restoku_app/core/constants/text_style.dart';
import 'package:restoku_app/core/helpers/app_routes.dart';
import 'package:restoku_app/core/widgets/custom/app_bar.dart';
import 'package:restoku_app/core/widgets/custom/theme_widget.dart';
import 'package:restoku_app/core/widgets/empty_content/empety_widget.dart';
import 'package:restoku_app/core/widgets/ftext_field/custom_text_field.dart';
import 'package:restoku_app/features/home/view_models/restaurant_provider.dart';
import 'package:restoku_app/features/home/views/widgets/banner_card.dart';
import 'package:restoku_app/features/home/views/widgets/resto_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<RestaurantProvider>(context, listen: false)
          .fetchRestaurants();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RestaurantProvider>(context);

    return  Container(
        decoration: CustomDecorations.backgroundDecoration(context),
        child: Column(
          children: [
            const SizedBox(height: 50),
            AppBarWidget(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.search,
                      arguments: {'query': provider.searchController.text});
                },
                child: AbsorbPointer(
                  child: CustomTextField(
                    controller: provider.searchController,
                    hintText: 'Resto name',
                    prefixIcon: Icon(
                      TablerIcons.search,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: CustomDecorations.contentDecoration(context),
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BannerCard(
                        actionButton: () {
                          context.goNamed('/detail_resto');
                        },
                        bigTitle: 'DISC 50% OFF',
                        describ: 'Exclusive Promo for Your First Purchase!',
                        textButton: 'Order Now',
                        title: 'Discount today only!',
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Popular Restaurants',
                        style: TextStyles.regularHeadlineSmall(context),
                      ),
                      const SizedBox(height: 10),
                      Consumer<RestaurantProvider>(
                        builder: (context, provider, child) {
                          if (provider.isLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (provider.error != null) {
                            return Center(child: Text(provider.error!));
                          } else if (provider.filteredRestaurants.isEmpty) {
                            return Center(
                              child: BadNetworkWidget(
                                onTap: () {
                                  provider.fetchRestaurants();
                                },
                              ),
                            );
                          }
      
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: provider.filteredRestaurants.length,
                            itemBuilder: (context, index) {
                              final resto = provider.filteredRestaurants[index];
      
                              return RestoCard(
                                restoId: resto.id ?? '',
                                actionCard: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.detailResto,
                                    arguments: {
                                      'id': resto.id ?? '',
                                      'imageTag': 'hero-image-${resto.id}',
                                      'imageUrl':
                                          ImageNetwork.getRestaurantImage(
                                        resto.pictureId,
                                        resolution: 'medium',
                                      ),
                                      'restoName':
                                          resto.name ?? 'Unknown Restaurant',
                                      'rate': resto.rating ?? 0.0,
                                    },
                                  );
                                },
                                restoAddress: resto.city ?? 'Unknown Location',
                                restoImage: ImageNetwork.getRestaurantImage(
                                  resto.pictureId,
                                  resolution: 'medium',
                                ),
                                restoName: resto.name ?? 'Unknown Name',
                                restoRate: resto.rating?.toString() ?? '0.0',
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}
