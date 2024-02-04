import 'package:carxproje/repo/arabadao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArabaGuncelleCubit extends Cubit<void> {
  ArabaGuncelleCubit() : super(0);

  var arepo = ArabaRepository();

  Future<void> guncelle(
    String arabaId,
    String make,
    String model,
    String sanziman,
    String performans,
    String maksimumHiz,
    String details,
    String imageUrl,
  ) async {
    await arepo.arabaGuncelle(arabaId, make, model, sanziman, performans,
        maksimumHiz, details, imageUrl);
  }
}
