import 'package:firebase_database/firebase_database.dart';

class ArabaRepository {
  var refArabalar = FirebaseDatabase.instance.ref().child("arabalar");

  Future<void> arabaKayit(
    String sanziman,
    String performans,
    String maksimumHiz,
    String make,
    String details,
    String imageUrl,
    String model,
  ) async {
    var bilgi = <String, dynamic>{};

    bilgi["arabaId"] = "";
    bilgi["make"] = make;
    bilgi["details"] = details;
    bilgi["imageUrl"] = imageUrl;
    bilgi["maksimumHiz"] = maksimumHiz;
    bilgi["model"] = model;
    bilgi["performans"] = performans;
    bilgi["sanziman"] = sanziman;
    refArabalar.push().set(bilgi);
  }

  Future<void> arabaGuncelle(
    String arabaId,
    String make,
    String model,
    String sanziman,
    String performans,
    String maksimumHiz,
    String details,
    String imageUrl,
  ) async {
    var bilgi = <String, dynamic>{};

    bilgi["details"] = details;
    bilgi["imageUrl"] = imageUrl;
    bilgi["make"] = make;
    bilgi["maksimumHiz"] = maksimumHiz;
    bilgi["model"] = model;
    bilgi["performans"] = performans;
    bilgi["sanziman"] = sanziman;

    refArabalar.child(arabaId).update(bilgi);
  }

  Future<void> arabaSil(String arabaId) async {
    refArabalar.child(arabaId).remove();
  }
}
