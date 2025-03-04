import 'package:flutter/material.dart';
import 'package:restoku_app/features/authentication/views/login/login_screen.dart';
import 'package:restoku_app/features/favorite/views/favorite_screen.dart';
import 'package:restoku_app/features/home/views/home_screen.dart';
import 'package:restoku_app/features/home/views/main_page.dart';
import 'package:restoku_app/features/home/views/search_screen.dart';
import 'package:restoku_app/features/order/views/detail_resto.dart';
import 'package:restoku_app/features/order/views/review.dart';

class AppRoutes {
  static const String main = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String detailResto = '/detail_resto';
  static const String search = '/search';
  static const String review = '/review';
  static const String favorite = '/favorite';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.main:
        final args = settings.arguments as Map<String, dynamic>? ?? {};
        final initialIndex = args['initialIndex'] as int? ?? 0;
        return MaterialPageRoute(
          builder: (_) => MainScreen(activeScreen: initialIndex),
        );

      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case detailResto:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => DetailRestoScreen(
            id: args['id'],
            imageTag: args['imageTag'],
            imageUrl: args['imageUrl'],
            restoName: args['restoName'],
            rate: args['rate'],
          ),
        );

      case review:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => ReviewScreen(
            restaurantId: args['restaurantId'],
          ),
        );
      case search:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => SearchScreen(
            query: args['query'],
          ),
        );

      case favorite:
        return MaterialPageRoute(builder: (_) => const FavoriteScreen());

        case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
