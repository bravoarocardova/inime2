import 'package:get/get.dart';
import 'package:inime2/app/data/models/anime_model.dart';

class DetailController extends GetxController with StateMixin<AnimeModel> {
  @override
  void onInit() {
    detailAnimeData();
    super.onInit();
  }

  detailAnimeData() async {
    await Future.delayed(const Duration(seconds: 1));
    try {
      AnimeModel data = Get.arguments;
      change(data, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
