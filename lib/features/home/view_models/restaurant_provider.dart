import 'package:flutter/material.dart';
import 'package:restoku_app/features/home/models/restaurant_model.dart';
import 'package:restoku_app/features/home/services/get_restaurant_service.dart';
import 'restaurant_state.dart';

class RestaurantProvider with ChangeNotifier {
  final RestaurantServices _restaurantServices;

  final TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;

  RestaurantState _state = RestaurantInitial(); // Gunakan state awal baru
  RestaurantState get state => _state;

  RestaurantProvider(this._restaurantServices);

  Future<void> fetchRestaurants() async {
    _state = RestaurantLoading();
    notifyListeners();

    try {
      final data = await _restaurantServices.fetchRestaurants();
      if (data?.restaurants == null || data!.restaurants!.isEmpty) {
        _state = RestaurantError("No data available.");
      } else {
        _state = RestaurantSuccess(data);
      }
    } catch (e) {
      _state = RestaurantError("Network error occurred. Please try again.");
    }

    notifyListeners();
  }

  List<Restaurant> get filteredRestaurants {
    if (_state is RestaurantSuccess) {
      final data = (_state as RestaurantSuccess).data;
      return data.restaurants
              ?.where((restaurant) => (restaurant.rating ?? 0) >= 4.7)
              .toList() ??
          [];
    }
    return [];
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}