import 'dart:async';
import 'package:flutter/material.dart';
import 'package:restoku_app/features/home/models/restaurant_model.dart';
import 'package:restoku_app/features/home/services/serach_sevices.dart';
import 'package:restoku_app/features/order/models/detail_restaurant_mode.dart';
import 'package:restoku_app/features/order/services/detail_restaurant_service.dart';
import 'dart:developer';

class SearchProvider extends ChangeNotifier {
  final RestaurantService _restaurantService = RestaurantService();
  final TextEditingController searchController = TextEditingController();

  List<Map<String, dynamic>> _searchResults = [];
  bool _isLoading = false;
  bool _isError = false;
  Timer? _debounce;

  List<Map<String, dynamic>> get searchResults => _searchResults;
  bool get isLoading => _isLoading;
  bool get isError => _isError;

  SearchProvider() {
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    String query = searchController.text.trim();

    if (query.isEmpty) {
      _clearSearchResults();
      return;
    }

    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 800), () {
      searchRestaurants(query);
    });
  }

  Future<void> searchRestaurants(String query) async {
    if (query.isEmpty) return;

    _isLoading = true;
    _isError = false;
    notifyListeners();

    try {
      List<Restaurant> allRestaurants =
          await _restaurantService.searchRestaurants(query);
      List<Map<String, dynamic>> newSearchResults = [];

      for (var resto in allRestaurants) {
        List<String> matchedMenus = [];

        try {
          var restoDetailResponse =
              await DetailRestaurantService.fetchDetailRestaurant(
            resto.id.toString(),
          );

          if (restoDetailResponse != null &&
              restoDetailResponse.restaurant != null) {
            RestaurantMenu restoDetail = restoDetailResponse.restaurant!;
            if (restoDetail.menus != null) {
              matchedMenus = restoDetail.menus!.foods!
                  .map((food) => food.name ?? "Unknown Menu")
                  .whereType<String>()
                  .where((name) =>
                      name.toLowerCase().contains(query.toLowerCase()))
                  .toList();
            }
          }
        } catch (e) {
          log("Error saat mengambil detail restoran: $e");
        }

        newSearchResults.add({
          "restaurant": resto,
          "menus": matchedMenus,
        });
      }

      _searchResults = newSearchResults;
    } catch (e) {
      _isError = true;
      log("Error saat mencari restoran: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void _clearSearchResults() {
    _searchResults = [];
    notifyListeners();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }
}
