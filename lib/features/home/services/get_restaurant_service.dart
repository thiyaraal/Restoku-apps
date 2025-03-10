import 'package:dio/dio.dart';
import 'package:restoku_app/core/helpers/api_documentations.dart';
import 'package:restoku_app/features/home/models/restaurant_model.dart';

class RestaurantServices {
  static final Dio _dio = Dio();

  Future<AllRestaurantModel?> fetchRestaurants() async {
    try {
      final response = await _dio.get(ApiDocumentations.getRestaurants);

      if (response.statusCode == 200) {
        return AllRestaurantModel.fromMap(response.data);
      }
      return null;
    } on DioException {
     
      return null;
    } catch (e) {
      return null;
    }
  }
}
