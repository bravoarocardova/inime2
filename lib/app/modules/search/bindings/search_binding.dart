import 'package:get/get.dart';
import 'package:inime2/app/data/providers/anime_provider.dart';

import '../controllers/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnimeProvider>(() => AnimeProvider());
    Get.lazyPut<SearchController>(
      () => SearchController(animeProvider: Get.find<AnimeProvider>()),
    );
  }
}
