import 'package:carxproje/entity/arabalar.dart';
import 'package:carxproje/repo/arabadao_repository.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<List<Arabalar>> {
  AnasayfaCubit() : super(<Arabalar>[]);

  var arepo = ArabaRepository();
  var refArabalar = FirebaseDatabase.instance.ref().child("arabalar");

  Future<void> arabalarYukle() async {
    refArabalar.onValue.listen((event) {
      var gelenDegerler = event.snapshot.value as Map;

      var liste = <Arabalar>[];

      gelenDegerler.forEach((key, nesne) {
        // Arabalar.fromJson metodunu kullanarak Arabalar nesnesi oluşturun
        var araba = Arabalar.fromJson(key, nesne);
        liste.add(araba);
      });

      emit(liste);
    });
  }

  Future<void> ara(String aramaKelimesi) async {
    if (state.isEmpty) {
      await arabalarYukle();
    }

    var kucukHarfeCevirilmisAramaKelimesi = aramaKelimesi.toLowerCase();

    var filtrelenmisListe = state.where((araba) {
      return araba.make
              .toLowerCase()
              .contains(kucukHarfeCevirilmisAramaKelimesi) ||
          araba.model
              .toLowerCase()
              .contains(kucukHarfeCevirilmisAramaKelimesi) ||
          araba.details
              .toLowerCase()
              .contains(kucukHarfeCevirilmisAramaKelimesi);
    }).toList();

    emit(filtrelenmisListe);
  }

  Future<void> sil(String arabaId) async {
    await arepo.arabaSil(arabaId);
  }
}
