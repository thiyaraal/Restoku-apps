// ignore_for_file: empty_catches

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:restoku_app/features/home/models/restaurant_model.dart';
import 'package:restoku_app/features/home/services/serach_sevices.dart';
import 'package:restoku_app/features/order/models/detail_restaurant_mode.dart';
import 'package:restoku_app/features/order/services/detail_restaurant_service.dart';

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
    if (searchController.text.isEmpty) return;

    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 800), () {
      searchRestaurants(searchController.text);
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
      _searchResults = [];

      for (var resto in allRestaurants) {
        List<String> matchedMenus = [];

        try {
          RestaurantMenu? restoDetail =
              (await DetailRestaurantService.fetchDetailRestaurant(
            resto.id.toString(),
          ))!
                  .restaurant;

          if (restoDetail != null && restoDetail.menus != null) {
            matchedMenus = restoDetail.menus!.foods!
                .map((food) => food.name ?? "Unknown Menu")
                .whereType<String>()
                .where(
                    (name) => name.toLowerCase().contains(query.toLowerCase()))
                .toList();
          }
        } catch (e) {
        }

        _searchResults.add({
          "restaurant": resto,
          "menus": matchedMenus,
        });
      }
    } catch (e) {
      _isError = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }
}
