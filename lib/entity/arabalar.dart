class Arabalar {
  String arabaId;
  String make;
  String model;
  String sanziman;
  String performans;
  String maksimumHiz;
  String details;
  String imageUrl;
  Arabalar(
      {required this.arabaId,
      required this.make,
      required this.details,
      required this.imageUrl,
      required this.maksimumHiz,
      required this.model,
      required this.performans,
      required this.sanziman});

  factory Arabalar.fromJson(String key, Map<dynamic, dynamic> json) {
    return Arabalar(
      arabaId: key,
      make: json["make"] as String,
      details: json["details"] as String,
      imageUrl: json["imageUrl"] as String,
      maksimumHiz: json["maksimumHiz"] as String,
      model: json["model"] as String,
      performans: json["performans"] as String,
      sanziman: json["sanziman"] as String,
    );
  }
}
