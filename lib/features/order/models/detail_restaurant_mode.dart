



import 'dart:convert';

DetailRestaurantModel detailRestaurantFromMap(String str) => DetailRestaurantModel.fromMap(json.decode(str));

String detailRestaurantToMap(DetailRestaurantModel data) => json.encode(data.toMap());

class DetailRestaurantModel {
    bool? error;
    String? message;
    RestaurantMenu? restaurant;

    DetailRestaurantModel({
        this.error,
        this.message,
        this.restaurant,
    });

    factory DetailRestaurantModel.fromMap(Map<String, dynamic> json) => DetailRestaurantModel(
        error: json["error"],
        message: json["message"],
        restaurant: json["restaurant"] == null ? null : RestaurantMenu.fromMap(json["restaurant"]),
    );

    Map<String, dynamic> toMap() => {
        "error": error,
        "message": message,
        "restaurant": restaurant?.toMap(),
    };
}

class RestaurantMenu {
    String? id;
    String? name;
    String? description;
    String? city;
    String? address;
    String? pictureId;
    List<Category>? categories;
    Menus? menus;
    double? rating;
    List<CustomerReview>? customerReviews;

    RestaurantMenu({
        this.id,
        this.name,
        this.description,
        this.city,
        this.address,
        this.pictureId,
        this.categories,
        this.menus,
        this.rating,
        this.customerReviews,
    });

    factory RestaurantMenu.fromMap(Map<String, dynamic> json) => RestaurantMenu(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        city: json["city"],
        address: json["address"],
        pictureId: json["pictureId"],
        categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromMap(x))),
        menus: json["menus"] == null ? null : Menus.fromMap(json["menus"]),
        rating: json["rating"]?.toDouble(),
        customerReviews: json["customerReviews"] == null ? [] : List<CustomerReview>.from(json["customerReviews"]!.map((x) => CustomerReview.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "city": city,
        "address": address,
        "pictureId": pictureId,
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toMap())),
        "menus": menus?.toMap(),
        "rating": rating,
        "customerReviews": customerReviews == null ? [] : List<dynamic>.from(customerReviews!.map((x) => x.toMap())),
    };
}

class Category {
    String? name;

    Category({
        this.name,
    });

    factory Category.fromMap(Map<String, dynamic> json) => Category(
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
    };
}

class CustomerReview {
    String? name;
    String? review;
    String? date;

    CustomerReview({
        this.name,
        this.review,
        this.date,
    });

    factory CustomerReview.fromMap(Map<String, dynamic> json) => CustomerReview(
        name: json["name"],
        review: json["review"],
        date: json["date"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "review": review,
        "date": date,
    };
}

class Menus {
    List<Category>? foods;
    List<Category>? drinks;

    Menus({
        this.foods,
        this.drinks,
    });

    factory Menus.fromMap(Map<String, dynamic> json) => Menus(
        foods: json["foods"] == null ? [] : List<Category>.from(json["foods"]!.map((x) => Category.fromMap(x))),
        drinks: json["drinks"] == null ? [] : List<Category>.from(json["drinks"]!.map((x) => Category.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "foods": foods == null ? [] : List<dynamic>.from(foods!.map((x) => x.toMap())),
        "drinks": drinks == null ? [] : List<dynamic>.from(drinks!.map((x) => x.toMap())),
    };
}
