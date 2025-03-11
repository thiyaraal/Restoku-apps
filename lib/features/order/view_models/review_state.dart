abstract class AddReviewState {}

class AddReviewInitial extends AddReviewState {}

class AddReviewLoading extends AddReviewState {}

class AddReviewSuccess extends AddReviewState {
  final List<Map<String, dynamic>> reviews;
  AddReviewSuccess(this.reviews);
}

class AddReviewError extends AddReviewState {
  final String message;
  AddReviewError(this.message);
}
