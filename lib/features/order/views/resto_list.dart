import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';
import 'package:restoku_app/core/constants/image_network.dart';
import 'package:restoku_app/core/constants/text_style.dart';
import 'package:restoku_app/core/widgets/custom/app_bar.dart';
import 'package:restoku_app/core/widgets/custom/theme_widget.dart';
import 'package:restoku_app/core/widgets/empty_content/empety_widget.dart';
import 'package:restoku_app/core/widgets/ftext_field/custom_text_field.dart';
import 'package:restoku_app/features/home/view_models/restaurant_provider.dart';
import 'package:restoku_app/features/home/view_models/restaurant_state.dart';
import 'package:restoku_app/features/home/views/search_screen.dart';
import 'package:restoku_app/features/home/views/widgets/resto_card.dart';
import 'package:restoku_app/features/order/views/detail_resto.dart';

class RestoListScreen extends StatefulWidget {
  const RestoListScreen({super.key});

  @override
  State<RestoListScreen> createState() => _RestoListScreenState();
}

class _RestoListScreenState extends State<RestoListScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: CustomDecorations.backgroundDecoration(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          AppBarWidget(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return SearchScreen(query: _searchController.text);
                  }),
                );
              },
              child: AbsorbPointer(
                child: CustomTextField(
                  controller: _searchController,
                  hintText: 'Search Resto',
                  prefixIcon: Icon(
                    TablerIcons.search,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: CustomDecorations.contentDecoration(context),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      'All Resto',
                      style: TextStyles.regularHeadlineSmall(context),
                    ),
                  ),
                  Expanded(
                    child: Consumer<RestaurantProvider>(
                      builder: (context, provider, child) {
                        final state = provider.state;

                        if (state is RestaurantLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        if (state is RestaurantError) {
                          return Center(
                            child: BadNetworkWidget(
                              onTap: () {
                                provider.fetchRestaurants();
                              },
                            ),
                          );
                        }

                        if (state is RestaurantSuccess &&
                            (state.data.restaurants?.isEmpty ?? true)) {
                          return Center(
                            child: BadNetworkWidget(
                              onTap: () {
                                provider.fetchRestaurants();
                              },
                            ),
                          );
                        }

                        if (state is RestaurantSuccess) {
                          return ListView.builder(
                            itemCount: state.data.restaurants?.length ?? 0,
                            itemBuilder: (context, index) {
                              final resto = state.data.restaurants![index];

                              return RestoCard(
                                restoId: resto.id ?? '',
                                actionCard: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return DetailRestoScreen(
                                          rate: resto.rating ?? 0.0,
                                          restoName: resto.name ??
                                              'Unknown Restaurant',
                                          id: resto.id ?? '',
                                          imageTag: 'hero-image-${resto.id}',
                                          imageUrl:
                                              ImageNetwork.getRestaurantImage(
                                            resto.pictureId,
                                            resolution: 'medium',
                                          ),
                                        );
                                      },
                                    ),
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
                        }

                        return Center(
                          child: BadNetworkWidget(
                            onTap: () {
                              provider.fetchRestaurants();
                            },
                          ),
                        ); 
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
