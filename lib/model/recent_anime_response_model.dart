class RecentResponseModel {
  int currentPage = 0;
  bool hasNextPage = false;
  int totalPages = 0;
  int totalResults = 0;
  List<RecentDataModel> results = const [];

  RecentResponseModel({
    this.currentPage = 0,
    this.hasNextPage = false,
    this.totalPages = 0,
    this.totalResults = 0,
    this.results = const [],
  });

  RecentResponseModel.fromJson(Map<String, dynamic> json) {
    currentPage = json["currentPage"];
    hasNextPage = json["hasNextPage"];
    totalPages = json["totalPages"];
    totalResults = json["totalResults"];
    results = json["results"] == null
        ? []
        : (json["results"] as List)
            .map((e) => RecentDataModel.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["currentPage"] = currentPage;
    data["hasNextPage"] = hasNextPage;
    data["totalPages"] = totalPages;
    data["totalResults"] = totalResults;
    data["results"] = results.map((e) => e.toJson()).toList();
    return data;
  }
}

class RecentDataModel {
  String? id;
  int malId = 0;
  Title? title;
  String? image;
  int rating = 0;
  String? color;
  String? episodeId;
  String? episodeTitle;
  int episodeNumber = 0;
  List<String> genres = const [];
  String? type;

  RecentDataModel(
      {this.id,
      this.malId = 0,
      this.title,
      this.image,
      this.rating = 0,
      this.color,
      this.episodeId,
      this.episodeTitle,
      this.episodeNumber = 0,
      this.genres = const [],
      this.type});

  RecentDataModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    malId = json["malId"];
    title = json["title"] == null ? null : Title.fromJson(json["title"]);
    image = json["image"];
    rating = json["rating"] ?? 0;
    color = json["color"];
    episodeId = json["episodeId"];
    episodeTitle = json["episodeTitle"];
    episodeNumber = json["episodeNumber"];
    genres = json["genres"] == null ? [] : List<String>.from(json["genres"]);
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
    data["rating"] = rating;
    data["color"] = color;
    data["episodeId"] = episodeId;
    data["episodeTitle"] = episodeTitle;
    data["episodeNumber"] = episodeNumber;
    data["genres"] = genres;
    data["type"] = type;
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
