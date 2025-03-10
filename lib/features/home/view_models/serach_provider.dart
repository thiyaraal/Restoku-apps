import 'dart:async';
import 'package:flutter/material.dart';
import 'package:restoku_app/features/home/models/restaurant_model.dart';
import 'package:restoku_app/features/home/services/serach_sevices.dart';

class SearchProvider extends ChangeNotifier {
  final RestaurantService _restaurantService;
  final TextEditingController searchController = TextEditingController();

  List<Map<String, dynamic>> _searchResults = [];
  bool _isLoading = false;
  bool _isError = false;
  Timer? _debounce;

  List<Map<String, dynamic>> get searchResults => _searchResults;
  bool get isLoading => _isLoading;
  bool get isError => _isError;

  // Constructor default
  SearchProvider() : _restaurantService = RestaurantService() {
    searchController.addListener(_onSearchChanged);
  }

  // Constructor untuk testing (menggunakan mock)
  SearchProvider.withService(this._restaurantService) {
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
      _searchResults = allRestaurants
          .map((resto) => {"restaurant": resto, "menus": []})
          .toList();
    } catch (e) {
      _isError = true;
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
