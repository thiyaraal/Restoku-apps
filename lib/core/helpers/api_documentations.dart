class ApiDocumentations {
  static const String baseUrl = 'https://restaurant-api.dicoding.dev';
  static const String getRestaurants = '$baseUrl/list';
  static String getDetailRestaurant(String id) => '$baseUrl/detail/$id';
  static const String addReview = '$baseUrl/review';
  static String searchRestaurant(String query) => '$baseUrl/search?q=$query';
}
