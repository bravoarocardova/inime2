import 'dart:convert';

import 'package:get/get.dart';
import '../../../data/models/data_anime_model.dart';
import '../../../data/providers/anime_provider.dart';

class HomeController extends GetxController with StateMixin<DataAnimeModel> {
  final AnimeProvider animeProvider;

  HomeController({required this.animeProvider});

  @override
  void onInit() {
    getAnimeTrending();
    super.onInit();
  }

  void getAnimeTrending() async {
    try {
      final value = await animeProvider.getAnimeTrending();
      Map<String, dynamic> res = jsonDecode(value.body);
      DataAnimeModel data = DataAnimeModel.fromJson(res);
      change(data, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
