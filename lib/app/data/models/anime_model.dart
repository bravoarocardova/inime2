class AnimeModel {
  AnimeModel({
    this.id,
    this.type,
    this.links,
    this.attributes,
  });

  String? id;
  String? type;
  AnimeLinks? links;
  Attributes? attributes;

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return AnimeModel(
      id: json["id"],
      type: json["type"],
      links: AnimeLinks.fromJson(json["links"]),
      attributes: Attributes.fromJson(json["attributes"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "links": links?.toJson(),
        "attributes": attributes?.toJson(),
      };
}

class AnimeLinks {
  AnimeLinks({
    this.self,
  });

  String? self;

  factory AnimeLinks.fromJson(Map<String, dynamic> json) => AnimeLinks(
        self: json["self"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
      };
}

class Attributes {
  Attributes({
    this.synopsis,
    this.canonicalTitle,
    this.averageRating,
    this.startDate,
    this.endDate,
    this.nextRelease,
    this.ageRating,
    this.ageRatingGuide,
    this.subtype,
    this.status,
    this.posterImage,
    this.coverImage,
  });

  String? synopsis;
  String? canonicalTitle;
  String? averageRating;
  dynamic startDate;
  dynamic endDate;
  dynamic nextRelease;
  String? ageRating;
  String? ageRatingGuide;
  String? subtype;
  String? status;
  PosterImage? posterImage;
  CoverImage? coverImage;

  factory Attributes.fromJson(Map<String, dynamic> json) {
    return Attributes(
      synopsis: json["synopsis"],
      canonicalTitle: json["canonicalTitle"],
      averageRating: json["averageRating"],
      startDate: json["startDate"],
      endDate: json["endDate"],
      nextRelease: json["nextRelease"],
      ageRating: json["ageRating"],
      ageRatingGuide: json["ageRatingGuide"],
      subtype: json["subtype"],
      status: json["status"],
      posterImage: PosterImage.fromJson(json["posterImage"]),
      coverImage: (json["coverImage"] != null)
          ? CoverImage.fromJson(json["coverImage"])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "synopsis": synopsis,
        "canonicalTitle": canonicalTitle,
        "averageRating": averageRating,
        "startDate":
            "${startDate?.year.toString().padLeft(4, '0')}-${startDate?.month.toString().padLeft(2, '0')}-${startDate?.day.toString().padLeft(2, '0')}",
        "endDate": endDate,
        "nextRelease": nextRelease?.toIso8601String(),
        "ageRating": ageRating,
        "ageRatingGuide": ageRatingGuide,
        "subtype": subtype,
        "status": status,
        "posterImage": posterImage?.toJson(),
        "coverImage": coverImage?.toJson(),
      };
}

class CoverImage {
  CoverImage({
    this.tiny,
    this.large,
    this.small,
    this.original,
    this.meta,
  });

  String? tiny;
  String? large;
  String? small;
  String? original;
  Meta? meta;

  factory CoverImage.fromJson(Map<String, dynamic> json) => CoverImage(
        tiny: json["tiny"],
        large: json["large"],
        small: json["small"],
        original: json["original"],
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "tiny": tiny,
        "large": large,
        "small": small,
        "original": original,
        "meta": meta?.toJson(),
      };
}

class Meta {
  Meta({
    this.dimensions,
  });

  Dimensions? dimensions;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        dimensions: Dimensions.fromJson(json["dimensions"]),
      );

  Map<String, dynamic> toJson() => {
        "dimensions": dimensions?.toJson(),
      };
}

class Dimensions {
  Dimensions({
    this.tiny,
    this.large,
    this.small,
    this.medium,
  });

  Large? tiny;
  Large? large;
  Large? small;
  Large? medium;

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        tiny: Large.fromJson(json["tiny"]),
        large: Large.fromJson(json["large"]),
        small: Large.fromJson(json["small"]),
        medium: json["medium"] == null ? null : Large.fromJson(json["medium"]),
      );

  Map<String, dynamic> toJson() => {
        "tiny": tiny!.toJson(),
        "large": large!.toJson(),
        "small": small!.toJson(),
        "medium": medium == null ? null : medium!.toJson(),
      };
}

class Large {
  Large({
    this.width,
    this.height,
  });

  int? width;
  int? height;

  factory Large.fromJson(Map<String, dynamic> json) => Large(
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
      };
}

class PosterImage {
  PosterImage({
    this.tiny,
    this.large,
    this.small,
    this.medium,
    this.original,
    this.meta,
  });

  String? tiny;
  String? large;
  String? small;
  String? medium;
  String? original;
  Meta? meta;

  factory PosterImage.fromJson(Map<String, dynamic> json) => PosterImage(
        tiny: json["tiny"],
        large: json["large"],
        small: json["small"],
        medium: json["medium"],
        original: json["original"],
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "tiny": tiny,
        "large": large,
        "small": small,
        "medium": medium,
        "original": original,
        "meta": meta?.toJson(),
      };
}
