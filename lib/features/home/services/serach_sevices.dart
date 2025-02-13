import 'package:dio/dio.dart';
import 'package:restoku_app/core/helpers/api_documentations.dart';
import 'package:restoku_app/features/home/models/restaurant_model.dart';

class RestaurantService {
  final Dio _dio = Dio();

  Future<List<Restaurant>> searchRestaurants(String query) async {
    try {
      final response =
          await _dio.get(ApiDocumentations.searchRestaurant(query));

      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        final AllRestaurantModel restaurantData =
            AllRestaurantModel.fromMap(response.data);

        if (restaurantData.error == false) {
          return restaurantData.restaurants ?? [];
        }
      }
      return [];
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }
}
