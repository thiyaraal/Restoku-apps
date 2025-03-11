import 'dart:async';
import 'package:flutter/material.dart';
import 'package:restoku_app/features/home/models/restaurant_model.dart';
import 'package:restoku_app/features/home/services/serach_sevices.dart';
import 'package:restoku_app/features/home/view_models/search_state.dart';


class SearchProvider extends ChangeNotifier {
  final RestaurantService _restaurantService;
  final TextEditingController searchController = TextEditingController();

  SearchState _state = SearchEmpty();
  SearchState get state => _state;

  Timer? _debounce;

  
  SearchProvider() : _restaurantService = RestaurantService() {
    searchController.addListener(_onSearchChanged);
  }

  
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

    _state = SearchLoading();
    notifyListeners();

    try {
      List<Restaurant> allRestaurants =
          await _restaurantService.searchRestaurants(query);
      if (allRestaurants.isEmpty) {
        _state = SearchEmpty();
      } else {
        _state = SearchSuccess(
          allRestaurants.map((resto) => {"restaurant": resto, "menus": []}).toList(),
        );
      }
    } catch (e) {
      _state = SearchError(e.toString());
    }

    notifyListeners();
  }

  void _clearSearchResults() {
    _state = SearchEmpty();
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