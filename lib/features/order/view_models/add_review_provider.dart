import 'package:flutter/material.dart';
import 'package:restoku_app/features/order/services/add_review_services.dart';

class AddReviewProvider extends ChangeNotifier {
  final ReviewService _reviewService = ReviewService();
  List<Map<String, dynamic>> _reviews = [];
  bool _isLoading = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController reviewController = TextEditingController();

  List<Map<String, dynamic>> get reviews => _reviews;
  bool get isLoading => _isLoading;

  Future<bool> postReview(String id) async {
    if (nameController.text.isEmpty || reviewController.text.isEmpty) {
      return false; 
    }

    _isLoading = true;
    notifyListeners();

    try {
      _reviews = await _reviewService.postReview(
        id,
        nameController.text,
        reviewController.text,
      );

      nameController.clear();
      reviewController.clear();

      return true; 
    } catch (e) {

      return false; 
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    reviewController.dispose();
    super.dispose();
  }
}
