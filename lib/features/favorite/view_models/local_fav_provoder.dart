import 'package:flutter/material.dart';
import 'package:restoku_app/features/favorite/models/fav_model.dart';

import 'package:restoku_app/features/favorite/services/sqflite_fav_service.dart';

class FavoriteProvider extends ChangeNotifier {
  final SqliteService _service;

  FavoriteProvider(this._service) {
    loadFavorites();
  }

  List<FavoriteRestaurant> _favorites = [];
  List<FavoriteRestaurant> get favorites => _favorites;

  
  Future<void> loadFavorites() async {
    _favorites = await _service.getAllFavorites();
    notifyListeners(); 
  }

  
  Future<void> toggleFavorite(FavoriteRestaurant restaurant) async {
    
    if (restaurant.id!.isEmpty) {
      debugPrint("Invalid restoId: ${restaurant.id}");
      return;
    }

    bool isFav = await _service.isFavorite(restaurant.id!);

    if (isFav) {
      await _service.removeFavorite(restaurant.id!);
      _favorites.removeWhere((item) => item.id == restaurant.id);
    } else {
      await _service.insertFavorite(restaurant);
      _favorites.add(restaurant);
    }

    notifyListeners(); 
  }

  
  bool isRestaurantFavorite(String id) {
    return _favorites.any((restaurant) => restaurant.id == id);
  }
}
