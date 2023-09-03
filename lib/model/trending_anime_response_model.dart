class TrendingResponseModel {
  int currentPage = 0;
  bool hasNextPage = false;
  List<TrendingAnimeDataModel> results = const [];

  TrendingResponseModel({
    this.currentPage = 0,
    this.hasNextPage = false,
    this.results = const [],
  });

  TrendingResponseModel.fromJson(Map<String, dynamic> json) {
    currentPage = json["currentPage"];
    hasNextPage = json["hasNextPage"];
    results = json["results"] == null
        ? []
        : (json["results"] as List)
            .map((e) => TrendingAnimeDataModel.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["currentPage"] = currentPage;
    data["hasNextPage"] = hasNextPage;
    data["results"] = results.map((e) => e.toJson()).toList();
    return data;
  }
}

class TrendingAnimeDataModel {
  String? id;
  int malId = 0;
  Title? title;
  String? image;
  Trailer? trailer;
  String? description;
  String? status;
  String? cover;
  int rating = 0;
  int releaseDate = 0;
  String? color;
  List<String> genres = const [];
  int totalEpisodes = 0;
  int duration = 0;
  String? type;

  TrendingAnimeDataModel(
      {this.id,
      this.malId = 0,
      this.title,
      this.image,
      this.trailer,
      this.description,
      this.status,
      this.cover,
      this.rating = 0,
      this.releaseDate = 0,
      this.color,
      this.genres = const [],
      this.totalEpisodes = 0,
      this.duration = 0,
      this.type});

  TrendingAnimeDataModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    malId = json["malId"];
    title = json["title"] == null ? null : Title.fromJson(json["title"]);
    image = json["image"];
    trailer =
        json["trailer"] == null ? null : Trailer.fromJson(json["trailer"]);
    description = json["description"];
    status = json["status"];
    cover = json["cover"];
    rating = json["rating"];
    releaseDate = json["releaseDate"];
    color = json["color"];
    genres = json["genres"] == null ? [] : List<String>.from(json["genres"]);
    totalEpisodes = json["totalEpisodes"];
    duration = json["duration"];
    type = json["type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["malId"] = malId;
    if (title != null) {
      data["title"] = title?.toJson();
    }
    data["image"] = image;
    if (trailer != null) {
      data["trailer"] = trailer?.toJson();
    }
    data["description"] = description;
    data["status"] = status;
    data["cover"] = cover;
    data["rating"] = rating;
    data["releaseDate"] = releaseDate;
    data["color"] = color;
    data["genres"] = genres;
    data["totalEpisodes"] = totalEpisodes;
    data["duration"] = duration;
    data["type"] = type;
    return data;
  }
}

class Trailer {
  Trailer();

  Trailer.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    return data;
  }
}

class Title {
  String? romaji;
  String? english;
  String? native;
  String? userPreferred;

  Title({this.romaji, this.english, this.native, this.userPreferred});

  Title.fromJson(Map<String, dynamic> json) {
    romaji = json["romaji"];
    english = json["english"];
    native = json["native"];
    userPreferred = json["userPreferred"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["romaji"] = romaji;
    data["english"] = english;
    data["native"] = native;
    data["userPreferred"] = userPreferred;
    return data;
  }
}
