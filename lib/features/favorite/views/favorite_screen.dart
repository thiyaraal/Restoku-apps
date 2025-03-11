import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restoku_app/core/helpers/app_routes.dart';
import 'package:restoku_app/core/widgets/custom/app_bar.dart';
import 'package:restoku_app/core/widgets/custom/theme_widget.dart';
import 'package:restoku_app/core/widgets/empty_content/empety_widget.dart';
import 'package:restoku_app/features/favorite/view_models/fav_state.dart';
import 'package:restoku_app/features/favorite/view_models/local_fav_provoder.dart';
import 'package:restoku_app/features/home/views/widgets/resto_card.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<FavoriteProvider>(context, listen: false).loadFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: CustomDecorations.backgroundDecoration(context),
      child: Column(
        children: [
          const SizedBox(
            height: 48,
          ),
          AppBarWidget(
            title: 'Favorite Restaurants',
            fontSize: 24,
          ),
          const SizedBox(
            height: 20,
          ),
          Consumer<FavoriteProvider>(
            builder: (context, provider, child) {
              final state = provider.state;

              if (state is FavoriteLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is FavoriteError) {
                return Center(child: BadNetworkWidget());
              } else if (state is FavoriteSuccess && state.favorites.isEmpty) {
                return const Center(
                  child: Text(
                    "No favorite restaurants yet",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                );
              } else if (state is FavoriteSuccess) {
                return Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: CustomDecorations.contentDecoration(context),
                    padding: const EdgeInsets.all(4.0),
                    child: ListView.builder(
                      itemCount: state.favorites.length,
                      itemBuilder: (context, index) {
                        final resto = state.favorites[index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5),
                          child: RestoCard(
                            restoId: resto.id ?? '',
                            actionCard: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.detailResto,
                                arguments: {
                                  'id': resto.id ?? '',
                                  'imageTag': 'hero-image-${resto.id}',
                                  'imageUrl': resto.imageUrl,
                                  'restoName': resto.name,
                                  'rate': resto.rating,
                                },
                              );
                            },
                            restoAddress: resto.city,
                            restoImage: resto.imageUrl,
                            restoName: resto.name,
                            restoRate: resto.rating.toString(),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }

              return const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
