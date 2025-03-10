import 'package:flutter/material.dart';
import 'package:restoku_app/features/home/models/restaurant_model.dart';
import 'package:restoku_app/features/home/services/get_restaurant_service.dart';

class RestaurantProvider with ChangeNotifier {
  final RestaurantServices _restaurantServices;

  TextEditingController get searchController => _searchController;
  final TextEditingController _searchController = TextEditingController();

  AllRestaurantModel? _restaurants;
  bool _isLoading = false;
  String? _error;

  AllRestaurantModel? get restaurants => _restaurants;
  bool get isLoading => _isLoading;
  String? get error => _error;

  RestaurantProvider(this._restaurantServices);

  Future<void> fetchRestaurants() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _restaurants = await _restaurantServices.fetchRestaurants();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  List<Restaurant> get filteredRestaurants {
    if (_restaurants == null || _restaurants!.restaurants == null) {
      return [];
    }
    return _restaurants!.restaurants!
        .where((restaurant) => (restaurant.rating ?? 0) >= 4.7)
        .toList();
  }
}
