
import 'package:flutter/material.dart';
import 'package:restoku_app/features/favorite/models/fav_model.dart';
import 'package:restoku_app/features/favorite/services/sqflite_fav_service.dart';
import 'package:restoku_app/features/favorite/view_models/fav_state.dart';

class FavoriteProvider with ChangeNotifier {
  final SqliteService _service;

  FavoriteState _state = FavoriteLoading();
  FavoriteState get state => _state;

  FavoriteProvider(this._service) {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    _state = FavoriteLoading();
    notifyListeners();

    try {
      final favorites = await _service.getAllFavorites();
      _state = FavoriteSuccess(favorites);
    } catch (e) {
      _state = FavoriteError("Failed to load favorites. Please try again.");
    }

    notifyListeners();
  }

  Future<void> toggleFavorite(FavoriteRestaurant restaurant) async {
    if (restaurant.id?.isEmpty ?? true) {
      debugPrint("Invalid restoId: ${restaurant.id}");
      return;
    }

    try {
      if (_state is FavoriteSuccess) {
        List<FavoriteRestaurant> currentFavorites =
            List.from((state as FavoriteSuccess).favorites);
        bool isFav = await _service.isFavorite(restaurant.id!);

        if (isFav) {
          await _service.removeFavorite(restaurant.id!);
          currentFavorites.removeWhere((item) => item.id == restaurant.id);
        } else {
          await _service.insertFavorite(restaurant);
          currentFavorites.add(restaurant);
        }

        _state = FavoriteSuccess(currentFavorites);
      }
    } catch (e) {
      _state = FavoriteError("Failed to update favorite: $e");
    }

    notifyListeners();
  }

  bool isRestaurantFavorite(String id) {
    if (_state is FavoriteSuccess) {
      return (state as FavoriteSuccess)
          .favorites
          .any((restaurant) => restaurant.id == id);
    }
    return false;
  }
}
