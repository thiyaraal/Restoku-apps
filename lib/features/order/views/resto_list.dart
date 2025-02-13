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
import 'package:restoku_app/features/home/views/search_screen.dart';
import 'package:restoku_app/features/home/views/widgets/resto_card.dart';
import 'package:restoku_app/features/order/views/detail_resto.dart';
import 'package:restoku_app/features/profile/services/theme_provider.dart';

class RestoListScreen extends StatefulWidget {
  const RestoListScreen({super.key});

  @override
  State<RestoListScreen> createState() => _RestoListScreenState();
}

class _RestoListScreenState extends State<RestoListScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Container(
         decoration: CustomDecorations.backgroundDecoration(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            AppBarWidget(onPressed: themeProvider.toggleTheme),
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
                    prefixIcon : Icon(      TablerIcons.search,),
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
                  decoration:
                    CustomDecorations.contentDecoration(context), 
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
                          if (provider.isLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (provider.error != null) {
                            return Center(child: Text(provider.error!));
                          } else if (provider.restaurants == null ||
                              provider.restaurants!.restaurants!.isEmpty) {
                            return Center(child: BadNetworkWidget(
                              onTap: () {
                                provider.fetchRestaurants();
                              },
                            ));
                          }

                          return ListView.builder(
                            itemCount:
                                provider.restaurants!.restaurants!.length,
                            itemBuilder: (context, index) {
                              final resto =
                                  provider.restaurants!.restaurants![index];

                              return RestoCard(
                                restoId: resto.id ??
                                    '', 
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
                                          imageTag:
                                              'hero-image-${resto.id}', 
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
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
