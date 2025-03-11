import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';
import 'package:restoku_app/core/constants/image_network.dart';
import 'package:restoku_app/core/helpers/app_routes.dart';
import 'package:restoku_app/core/widgets/custom/theme_widget.dart';
import 'package:restoku_app/core/widgets/empty_content/serach_empty.dart';
import 'package:restoku_app/core/widgets/ftext_field/custom_text_field.dart';
import 'package:restoku_app/features/home/models/restaurant_model.dart';
import 'package:restoku_app/features/home/view_models/search_state.dart';
import 'package:restoku_app/features/home/view_models/serach_provider.dart';
import 'package:restoku_app/features/home/views/widgets/list_serach.dart';

class SearchScreen extends StatelessWidget {
  final String query;

  const SearchScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final provider = SearchProvider();
        provider.searchController.text = query;
        provider.searchRestaurants(query);
        return provider;
      },
      child: Scaffold(
        body: Container(
          decoration: CustomDecorations.backgroundDecoration(context),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Consumer<SearchProvider>(
                    builder: (context, provider, _) {
                      return CustomTextField(
                        controller: provider.searchController,
                        hintText: 'menu, restaurant name, or variant',
                        prefixIcon: Icon(
                          TablerIcons.search,
                        ),
                        onChanged: (value) {
                          provider.searchRestaurants(value);
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Consumer<SearchProvider>(
                    builder: (context, provider, _) {
                      final state = provider.state;

                      if (state is SearchLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is SearchError) {
                        return const Center(child: Text("Failed to load data"));
                      } else if (state is SearchEmpty) {
                        return Center(child: SeacrhEmptyWidget());
                      } else if (state is SearchSuccess) {
                        return ListView.builder(
                          itemCount: state.searchResults.length,
                          itemBuilder: (context, index) {
                            final result = state.searchResults[index];
                            final Restaurant resto = result["restaurant"];
                            final List<String> menus =
                                List<String>.from(result["menus"]);

                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: RestaurantListTile(
                                name: resto.name ?? "Unknown Restaurant",
                                city: resto.city ?? "Unknown City",
                                menus: menus,
                                isLastItem:
                                    index == state.searchResults.length - 1,
                                onTap: () {
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
                              ),
                            );
                          },
                        );
                      }

                      return const SizedBox(); 
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
