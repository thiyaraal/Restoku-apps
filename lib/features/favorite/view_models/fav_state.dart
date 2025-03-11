import 'package:restoku_app/features/favorite/models/fav_model.dart';

abstract class FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {
  final List<FavoriteRestaurant> favorites;
  FavoriteSuccess(this.favorites);
}

class FavoriteError extends FavoriteState {
  final String message;
  FavoriteError(this.message);
}
