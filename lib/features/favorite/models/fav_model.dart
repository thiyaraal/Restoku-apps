class FavoriteRestaurant {
  final String? id;
  final String name;
  final String city;
  final String imageUrl;
  final double rating;

  FavoriteRestaurant({
    this.id,
    required this.name,
    required this.city,
    required this.imageUrl,
    required this.rating,
  });

  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'city': city,
      'imageUrl': imageUrl,
      'rating': rating,
    };
  }

  
  factory FavoriteRestaurant.fromJson(Map<String, dynamic> json) {
    return FavoriteRestaurant(
      id: json['id'] as String?,
      name: json['name'] as String,
      city: json['city'] as String,
      imageUrl: json['imageUrl'] as String,
      rating: (json['rating'] as num).toDouble(),
    );
  }
}
