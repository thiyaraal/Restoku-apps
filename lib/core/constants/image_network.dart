class ImageNetwork {
  

  static const String restoran =
      'https://img.icons8.com/?size=100&id=2BeIdZyy0fFG&format=png&color=000000';

  static const String foods =
      "https://img.icons8.com/?size=100&id=97436&format=png&color=000000";

  static const String drinks =
      "https://img.icons8.com/?size=100&id=ffv63agyX8QD&format=png&color=000000";

  static const String review =
      "https://img.icons8.com/?size=100&id=55097&format=png&color=000000";
  static const String variant =
      "https://img.icons8.com/?size=100&id=13324&format=png&color=000000";
    

  static const String profile =
      "https://img.icons8.com/?size=100&id=11727&format=png&color=FFFFFF";
 
  static const String order =
      "https://img.icons8.com/?size=100&id=24461&format=png&color=FFFFFF";


  static const String password = "https://img.icons8.com/?size=100&id=94&format=png&color=FFFFFF";

  static const String help = "https://img.icons8.com/?size=100&id=646&format=png&color=FFFFFF";

  static const String logout = "https://img.icons8.com/?size=100&id=26217&format=png&color=FFFFFF";

  static const String profileImage = "https://img.freepik.com/free-vector/young-girl-anime-character-poster_603843-2522.jpg?t=st=1739297381~exp=1739300981~hmac=e54cb0207eab7fbdf441610f31ecc327f2080cb687a60421a3472ccca39804f4&w=740";

  static const String provisions = "https://img.icons8.com/?size=100&id=6552&format=png&color=FFFFFF";

  static String getRestaurantImage(String? pictureId,
      {String resolution = 'medium'}) {
    if (pictureId == null || pictureId.isEmpty) {
      return restoran;
    }
    return "https://restaurant-api.dicoding.dev/images/$resolution/$pictureId";
  }
}
