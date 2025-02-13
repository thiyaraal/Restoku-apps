import 'package:dio/dio.dart';
import 'package:restoku_app/core/helpers/api_documentations.dart';

class ReviewService {
  final Dio _dio = Dio();

  Future<List<Map<String, dynamic>>> postReview(
      String id, String name, String review) async {
    try {
      final response = await _dio.post(
        ApiDocumentations.addReview,
        data: {
          "id": id,
          "name": name,
          "review": review,
        },
        options: Options(headers: {
          "Content-Type": "application/json",
        }),
      );

   

      
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = response.data;
        if (responseData['error'] == false) {
          return List<Map<String, dynamic>>.from(
              responseData['customerReviews']);
        } else {
          throw Exception("Server returned error: ${responseData['message']}");
        }
      } else {
        throw Exception(
            "Failed to post review. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
