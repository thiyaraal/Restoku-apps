import 'package:dio/dio.dart';
import 'package:restoku_app/core/helpers/api_documentations.dart';
import 'package:restoku_app/features/order/models/detail_restaurant_mode.dart';

class DetailRestaurantService {
  static final Dio _dio = Dio();

  static Future<DetailRestaurantModel?> fetchDetailRestaurant(String id) async {
    try {
      final response = await _dio.get(ApiDocumentations.getDetailRestaurant(id));

      if (response.statusCode == 200) {
        return DetailRestaurantModel.fromMap(response.data);
      } 
    return null;
    } on DioException {

      return null;
    } catch (e) {

      return null;
    }
}
}
