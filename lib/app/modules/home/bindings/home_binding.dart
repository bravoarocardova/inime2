import 'package:get/get.dart';
import 'package:inime2/app/data/providers/anime_provider.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnimeProvider>(() => AnimeProvider());
    Get.lazyPut<HomeController>(
      () => HomeController(animeProvider: Get.find<AnimeProvider>()),
    );
  }
}
