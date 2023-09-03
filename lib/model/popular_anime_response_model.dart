class AnimePopularResponseModel {
  int currentPage = 0;
  bool hasNextPage = false;
  List<AnimeDetails> results = const [];

  AnimePopularResponseModel(
      {this.currentPage = 0,
      this.hasNextPage = false,
      this.results = const []});

  AnimePopularResponseModel.fromJson(Map<String, dynamic> json) {
    currentPage = json["currentPage"];
    hasNextPage = json["hasNextPage"];
    results =
        (json["results"] as List).map((e) => AnimeDetails.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["currentPage"] = currentPage;
    data["hasNextPage"] = hasNextPage;
    data["results"] = results.map((e) => e.toJson()).toList();
    return data;
  }
}

class AnimeDetails {
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

  AnimeDetails(
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

  AnimeDetails.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    malId = json["malId"] ?? 0;
    title = json["title"] == null ? null : Title.fromJson(json["title"]);
    image = json["image"];
    trailer =
        json["trailer"] == null ? null : Trailer.fromJson(json["trailer"]);
    description = json["description"];
    status = json["status"];
    cover = json["cover"];
    rating = json["rating"] ?? 0;
    releaseDate = json["releaseDate"] ?? 0;
    color = json["color"];
    genres = List<String>.from(json["genres"]);
    totalEpisodes = json["totalEpisodes"] ?? 0;
    duration = json["duration"] ?? 0;
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
  String? id;
  String? site;
  String? thumbnail;

  Trailer({this.id, this.site, this.thumbnail});

  Trailer.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    site = json["site"];
    thumbnail = json["thumbnail"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["site"] = site;
    data["thumbnail"] = thumbnail;
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
