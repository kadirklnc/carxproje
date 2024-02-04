import 'package:carxproje/repo/arabadao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArabaKayitCubit extends Cubit<void> {
  ArabaKayitCubit() : super(0);

  var arepo = ArabaRepository();

  Future<void> kayit(
    String model,
    String sanziman,
    String performans,
    String maksimumhiz,
    String make,
    String details,
    String imageurl,
  ) async {
    await arepo.arabaKayit(
      model,
      sanziman,
      performans,
      maksimumhiz,
      make,
      details,
      imageurl,
    );
  }
}
