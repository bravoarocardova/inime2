import 'anime_model.dart';

class DataAnimeModel {
  DataAnimeModel({required this.data});

  List<AnimeModel> data;

  factory DataAnimeModel.fromJson(Map<String, dynamic> json) {
    return DataAnimeModel(
        data: List<AnimeModel>.from(
            json["data"].map((e) => AnimeModel.fromJson(e))));
  }

  Map<String, dynamic> toJson() =>
      {"data": List<AnimeModel>.from(data.map((e) => e.toJson()))};
}
