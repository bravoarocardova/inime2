import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:inime2/widgets/loading.dart';

import '../../../data/models/data_anime_model.dart';
import '../../../data/providers/anime_provider.dart';

class SearchController extends GetxController with StateMixin<DataAnimeModel> {
  final AnimeProvider animeProvider;

  SearchController({required this.animeProvider});

  final searchTextController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    // getAnimeByName('anime');
    searchTextController.value.addListener(() =>
        (searchTextController.value.text != '')
            ? getAnimeByName(searchTextController.value.text)
            : const Loading());
  }

  @override
  void onClose() {
    searchTextController.value.dispose();
    super.onClose();
  }

  void getAnimeByName(String q) async {
    change(null, status: RxStatus.loading());
    try {
      final value = await animeProvider.getAnimeSearching(q);
      Map<String, dynamic> res = jsonDecode(value.body);
      if (res['data'].isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        DataAnimeModel data = DataAnimeModel.fromJson(res);
        change(data, status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
