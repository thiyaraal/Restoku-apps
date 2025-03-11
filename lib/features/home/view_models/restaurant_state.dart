import 'package:restoku_app/features/home/models/restaurant_model.dart';

abstract class RestaurantState {}

class RestaurantInitial extends RestaurantState {} 

class RestaurantLoading extends RestaurantState {}

class RestaurantSuccess extends RestaurantState {
  final AllRestaurantModel data;
  RestaurantSuccess(this.data);
}

class RestaurantError extends RestaurantState {
  final String message;
  RestaurantError(this.message);
}
