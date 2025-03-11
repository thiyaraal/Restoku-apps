import 'dart:io';

import 'package:flutter/material.dart';
import 'package:restoku_app/features/order/models/detail_restaurant_mode.dart';
import 'package:restoku_app/features/order/services/detail_restaurant_service.dart';
import 'package:restoku_app/features/order/view_models/detail_state.dart';

class DetailRestaurantProvider with ChangeNotifier {
  DetailRestaurantState _state = DetailRestaurantLoading();
  DetailRestaurantState get state => _state;

  String _selectedCategory = "foods";
  String get selectedCategory => _selectedCategory;

  DetailRestaurantModel? get detail {
    if (_state is DetailRestaurantSuccess) {
      return (_state as DetailRestaurantSuccess).detail;
    }
    return null;
  }

  String get imageUrl {
    if (_state is DetailRestaurantSuccess) {
      return (_state as DetailRestaurantSuccess).imageUrl ?? "";
    }
    return "";
  }

  void _setState(DetailRestaurantState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> fetchDetail(String id, {String? initialImageUrl}) async {
    _setState(DetailRestaurantLoading());

    try {
      final detail = await DetailRestaurantService.fetchDetailRestaurant(id);

      if (detail?.restaurant == null) {
        _setState(DetailRestaurantError("No restaurant details found."));
      } else {
        _setState(DetailRestaurantSuccess(
          detail!,
          imageUrl: initialImageUrl ?? detail.restaurant?.pictureId,
        ));
      }
    } on SocketException {
      _setState(DetailRestaurantError(
          "Network error. Please check your connection."));
    } catch (e) {
      _setState(DetailRestaurantError(
          "Failed to load restaurant details. Please try again."));
    }
  }

  void setCategory(String category) {
    if (_selectedCategory != category) {
      _selectedCategory = category;
      notifyListeners();
    }
  }

  List<Category> get filteredMenus {
    if (_state is DetailRestaurantSuccess) {
      final detail = (_state as DetailRestaurantSuccess).detail;
      if (detail.restaurant?.menus == null) return [];

      final menus = detail.restaurant!.menus!;
      return _selectedCategory == "foods"
          ? menus.foods ?? []
          : menus.drinks ?? [];
    }
    return [];
  }
}
