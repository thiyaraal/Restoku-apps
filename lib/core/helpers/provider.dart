import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:restoku_app/features/favorite/services/sqflite_fav_service.dart';
import 'package:restoku_app/features/favorite/view_models/local_fav_provoder.dart';
import 'package:restoku_app/features/home/view_models/restaurant_provider.dart';
import 'package:restoku_app/features/home/view_models/serach_provider.dart';
import 'package:restoku_app/features/order/view_models/add_review_provider.dart';
import 'package:restoku_app/features/order/view_models/detail_restaurant_provider.dart';
import 'package:restoku_app/features/profile/services/theme_provider.dart';

class AppProviders {
  static List<SingleChildWidget> getProviders() {
    return [
      ChangeNotifierProvider<RestaurantProvider>(
        create: (_) => RestaurantProvider(),
      ),
      ChangeNotifierProvider<DetailRestaurantProvider>(
        create: (_) => DetailRestaurantProvider(),
      ),
      ChangeNotifierProvider<AddReviewProvider>(
        create: (_) => AddReviewProvider(),
      ),
      ChangeNotifierProvider<SearchProvider>(
        create: (_) => SearchProvider(),
      ),
      ChangeNotifierProvider<ThemeProvider>(
        create: (_) => ThemeProvider(),
      ),
      ////FavoriteProvider
      ChangeNotifierProvider<FavoriteProvider>(
        create: (_) => FavoriteProvider(
          SqliteService(),
        ),
      ),
    ];
  }
}
