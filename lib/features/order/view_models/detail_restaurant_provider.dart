import 'package:flutter/material.dart';
import 'package:restoku_app/features/order/models/detail_restaurant_mode.dart';
import 'package:restoku_app/features/order/services/detail_restaurant_service.dart';

class DetailRestaurantProvider with ChangeNotifier {
  DetailRestaurantModel? _detail;
  bool _isLoading = false;
  String? _error;
  String _selectedCategory = "foods";

  String? imageUrl;

  DetailRestaurantModel? get detail => _detail;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String get selectedCategory => _selectedCategory;
  String get image => imageUrl ?? "";

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> fetchDetail(String id, {String? initialImageUrl}) async {
    _setLoading(true);
    _error = null;

    try {
      _detail = await DetailRestaurantService.fetchDetailRestaurant(id);

      imageUrl = initialImageUrl ?? _detail?.restaurant?.pictureId;
    } catch (e) {
      _error = e.toString();
    }

    _setLoading(false);
  }

  void setCategory(String category) {
    if (_selectedCategory != category) {
      _selectedCategory = category;
      notifyListeners();
    }
  }

  List<Category> get filteredMenus {
    if (_detail?.restaurant?.menus == null) return [];

    final menus = _detail!.restaurant!.menus!;
    return _selectedCategory == "foods"
        ? menus.foods ?? []
        : menus.drinks ?? [];
  }
}
