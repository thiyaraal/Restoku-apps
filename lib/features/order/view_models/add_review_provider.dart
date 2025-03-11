import 'package:flutter/material.dart';
import 'package:restoku_app/features/order/services/add_review_services.dart';
import 'package:restoku_app/features/order/view_models/review_state.dart';

class AddReviewProvider extends ChangeNotifier {
  final ReviewService _reviewService = ReviewService();

  AddReviewState _state = AddReviewInitial();
  AddReviewState get state => _state;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController reviewController = TextEditingController();

  void _setState(AddReviewState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<bool> postReview(String id) async {
    if (nameController.text.isEmpty || reviewController.text.isEmpty) {
      return false;
    }

    _setState(AddReviewLoading());

    try {
      final reviews = await _reviewService.postReview(
        id,
        nameController.text,
        reviewController.text,
      );

      nameController.clear();
      reviewController.clear();

      _setState(AddReviewSuccess(reviews));
      return true;
    } catch (e) {
      _setState(AddReviewError("Failed to post review. Please try again."));
      return false;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    reviewController.dispose();
    super.dispose();
  }
}
