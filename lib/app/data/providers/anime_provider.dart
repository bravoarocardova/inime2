import 'package:get/get_connect/http/src/response/response.dart';
import 'package:inime2/app/data/base_provider.dart';

abstract class IAnimeProvider {
  Future<Response> getAnimeTrending();
  Future<Response> getAnimeSearching(String q);
}

class AnimeProvider extends BaseProvider implements IAnimeProvider {
  @override
  Future<Response> getAnimeTrending() => get("/trending/anime");

  @override
  Future<Response> getAnimeSearching(String q) => get("/anime?filter[text]=$q");
}
