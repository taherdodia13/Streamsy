class YouMigthLikeResponseModel {
  String? id;
  Title? title;
  int malId = 0;
  List<dynamic> synonyms = const [];
  bool isLicensed = false;
  bool isAdult = false;
  String? countryOfOrigin;
  Trailer? trailer;
  String? image;
  int popularity = 0;
  String? color;
  String? cover;
  String? description;
  String? status;
  int releaseDate = 0;
  StartDate? startDate;
  EndDate? endDate;
  int totalEpisodes = 0;
  int currentEpisode = 0;
  dynamic rating;
  int duration = 0;
  List<String> genres = const [];
  dynamic season;
  List<dynamic> studios = const [];
  String? subOrDub;
  String? type;
  List<Recommendations> recommendations = const [];
  List<dynamic> characters = const [];
  List<dynamic> relations = const [];
  List<dynamic> episodes = const [];

  YouMigthLikeResponseModel({
    this.id,
    this.title,
    this.malId = 0,
    this.synonyms = const [],
    this.isLicensed = false,
    this.isAdult = false,
    this.countryOfOrigin,
    this.trailer,
    this.image,
    this.popularity = 0,
    this.color,
    this.cover,
    this.description,
    this.status,
    this.releaseDate = 0,
    this.startDate,
    this.endDate,
    this.totalEpisodes = 0,
    this.currentEpisode = 0,
    this.rating,
    this.duration = 0,
    this.genres = const [],
    this.season,
    this.studios = const [],
    this.subOrDub,
    this.type,
    this.recommendations = const [],
    this.characters = const [],
    this.relations = const [],
    this.episodes = const [],
  });

  YouMigthLikeResponseModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"] == null ? null : Title.fromJson(json["title"]);
    malId = json["malId"] ?? 0;
    synonyms = json["synonyms"] ?? [];
    isLicensed = json["isLicensed"];
    isAdult = json["isAdult"];
    countryOfOrigin = json["countryOfOrigin"];
    trailer =
        json["trailer"] == null ? null : Trailer.fromJson(json["trailer"]);
    image = json["image"];
    popularity = json["popularity"] ?? 0;
    color = json["color"];
    cover = json["cover"];
    description = json["description"];
    status = json["status"];
    releaseDate = json["releaseDate"] ?? 0;
    startDate = json["startDate"] == null
        ? null
        : StartDate.fromJson(json["startDate"]);
    endDate =
        json["endDate"] == null ? null : EndDate.fromJson(json["endDate"]);
    totalEpisodes = json["totalEpisodes"] ?? 0;
    currentEpisode = json["currentEpisode"] ?? 0;
    rating = json["rating"] ?? 0;
    duration = json["duration"] ?? 0;
    genres = json["genres"] == null ? [] : List<String>.from(json["genres"]);
    season = json["season"];
    studios = json["studios"] ?? [];
    subOrDub = json["subOrDub"];
    type = json["type"];
    recommendations = json["recommendations"] == null
        ? []
        : (json["recommendations"] as List)
            .map((e) => Recommendations.fromJson(e))
            .toList();
    characters = json["characters"] ?? [];
    relations = json["relations"] ?? [];
    episodes = json["episodes"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    if (title != null) {
      data["title"] = title?.toJson();
    }
    data["malId"] = malId;
    data["synonyms"] = synonyms;
    data["isLicensed"] = isLicensed;
    data["isAdult"] = isAdult;
    data["countryOfOrigin"] = countryOfOrigin;
    if (trailer != null) {
      data["trailer"] = trailer?.toJson();
    }
    data["image"] = image;
    data["popularity"] = popularity;
    data["color"] = color;
    data["cover"] = cover;
    data["description"] = description;
    data["status"] = status;
    data["releaseDate"] = releaseDate;
    if (startDate != null) {
      data["startDate"] = startDate?.toJson();
    }
    if (endDate != null) {
      data["endDate"] = endDate?.toJson();
    }
    data["totalEpisodes"] = totalEpisodes;
    data["currentEpisode"] = currentEpisode;
    data["rating"] = rating;
    data["duration"] = duration;
    data["genres"] = genres;
    data["season"] = season;
    data["studios"] = studios;
    data["subOrDub"] = subOrDub;
    data["type"] = type;
    data["recommendations"] = recommendations.map((e) => e.toJson()).toList();
    data["characters"] = characters;
    data["relations"] = relations;
    data["episodes"] = episodes;
    return data;
  }
}

class Recommendations {
  int id = 0;
  int malId = 0;
  Title1? title;
  String? status;
  int episodes = 0;
  String? image;
  String? cover;
  int rating = 0;
  String? type;

  Recommendations(
      {this.id = 0,
      this.malId = 0,
      this.title,
      this.status,
      this.episodes = 0,
      this.image,
      this.cover,
      this.rating = 0,
      this.type});

  Recommendations.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    malId = json["malId"] ?? 0;
    title = json["title"] == null ? null : Title1.fromJson(json["title"]);
    status = json["status"];
    episodes = json["episodes"] ?? 0;
    image = json["image"];
    cover = json["cover"];
    rating = json["rating"] ?? 0;
    type = json["type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["malId"] = malId;
    if (title != null) {
      data["title"] = title?.toJson();
    }
    data["status"] = status;
    data["episodes"] = episodes;
    data["image"] = image;
    data["cover"] = cover;
    data["rating"] = rating;
    data["type"] = type;
    return data;
  }
}

class Title1 {
  String? romaji;
  dynamic english;
  String? native;
  String? userPreferred;

  Title1({this.romaji, this.english, this.native, this.userPreferred});

  Title1.fromJson(Map<String, dynamic> json) {
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

class EndDate {
  dynamic year;
  dynamic month;
  dynamic day;

  EndDate({this.year, this.month, this.day});

  EndDate.fromJson(Map<String, dynamic> json) {
    year = json["year"];
    month = json["month"];
    day = json["day"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["year"] = year;
    data["month"] = month;
    data["day"] = day;
    return data;
  }
}

class StartDate {
  int year = 0;
  int month = 0;
  int day = 0;

  StartDate({
    this.year = 0,
    this.month = 0,
    this.day = 0,
  });

  StartDate.fromJson(Map<String, dynamic> json) {
    year = json["year"] ?? 0;
    month = json["month"] ?? 0;
    day = json["day"] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["year"] = year;
    data["month"] = month;
    data["day"] = day;
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
  dynamic english;
  String? native;

  Title({this.romaji, this.english, this.native});

  Title.fromJson(Map<String, dynamic> json) {
    romaji = json["romaji"];
    english = json["english"];
    native = json["native"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["romaji"] = romaji;
    data["english"] = english;
    data["native"] = native;
    return data;
  }
}
