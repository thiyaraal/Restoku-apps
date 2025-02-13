import 'dart:convert';



AllRestaurantModel allRestaurantModelFromMap(String str) =>
    AllRestaurantModel.fromMap(json.decode(str));

String allRestaurantModelToMap(AllRestaurantModel data) =>
    json.encode(data.toMap());

class AllRestaurantModel {
  bool? error;
  String? message;
  int? count;
  List<Restaurant>? restaurants;

  AllRestaurantModel({
    this.error,
    this.message,
    this.count,
    this.restaurants,
  });

  factory AllRestaurantModel.fromMap(Map<String, dynamic> json) =>
      AllRestaurantModel(
        error: json["error"],
        message: json["message"],
        count: json["count"],
        restaurants: json["restaurants"] == null
            ? []
            : List<Restaurant>.from(
                json["restaurants"]!.map((x) => Restaurant.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "error": error,
        "message": message,
        "count": count,
        "restaurants": restaurants == null
            ? []
            : List<dynamic>.from(restaurants!.map((x) => x.toMap())),
      };
}

class Restaurant {
  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  double? rating;

  Restaurant({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
  });

  factory Restaurant.fromMap(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
      };
}
