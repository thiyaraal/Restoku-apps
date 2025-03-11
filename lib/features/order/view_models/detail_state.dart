import 'package:restoku_app/features/order/models/detail_restaurant_mode.dart';

abstract class DetailRestaurantState {}

class DetailRestaurantLoading extends DetailRestaurantState {}

class DetailRestaurantSuccess extends DetailRestaurantState {
  final DetailRestaurantModel detail;
  final String? imageUrl;
  
  DetailRestaurantSuccess(this.detail, {this.imageUrl});
}

class DetailRestaurantError extends DetailRestaurantState {
  final String message;
  
  DetailRestaurantError(this.message);
}
