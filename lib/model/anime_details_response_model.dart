class AnimeDetailsResponseModel {
  String? id;
  Title? title;
  int malId = 0;
  List<String> synonyms = const [];
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
  double rating = 0;
  int duration = 0;
  List<String> genres = const [];
  String? season;
  List<String> studios = const [];
  String? subOrDub;
  String? type;
  List<Recommendations> recommendations = const [];
  List<Characters> characters = const [];
  List<Relations> relations = const [];
  Mappings? mappings;
  List<Episodes> episodes = const [];

  AnimeDetailsResponseModel(
      {this.id,
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
      this.rating = 0.0,
      this.duration = 0,
      this.genres = const [],
      this.season,
      this.studios = const [],
      this.subOrDub,
      this.type,
      this.recommendations = const [],
      this.characters = const [],
      this.relations = const [],
      this.mappings,
      this.episodes = const []});

  AnimeDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"] == null ? null : Title.fromJson(json["title"]);
    malId = json["malId"] ?? 0;
    synonyms = List<String>.from(json["synonyms"]);
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
    rating = (json["rating"] ?? 0.0).toDouble();
    duration = json["duration"] ?? 0;
    genres = List<String>.from(json["genres"]);
    season = json["season"];
    studios = List<String>.from(json["studios"]);
    subOrDub = json["subOrDub"];
    type = json["type"];
    recommendations = (json["recommendations"] as List)
        .map((e) => Recommendations.fromJson(e))
        .toList();
    characters = (json["characters"] as List)
        .map((e) => Characters.fromJson(e))
        .toList();
    relations =
        (json["relations"] as List).map((e) => Relations.fromJson(e)).toList();
    mappings =
        json["mappings"] == null ? null : Mappings.fromJson(json["mappings"]);
    episodes =
        (json["episodes"] as List).map((e) => Episodes.fromJson(e)).toList();
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
    data["characters"] = characters.map((e) => e.toJson()).toList();
    data["relations"] = relations.map((e) => e.toJson()).toList();
    if (mappings != null) {
      data["mappings"] = mappings?.toJson();
    }
    data["episodes"] = episodes.map((e) => e.toJson()).toList();
    return data;
  }
}

class Episodes {
  String? id;
  String? title;
  String? description;
  int number = 0;
  String? image;
  String? airDate;

  Episodes(
      {this.id,
      this.title,
      this.description,
      this.number = 0,
      this.image,
      this.airDate});

  Episodes.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    description = json["description"];
    number = json["number"] ?? 0;
    image = json["image"];
    airDate = json["airDate"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["title"] = title;
    data["description"] = description;
    data["number"] = number;
    data["image"] = image;
    data["airDate"] = airDate;
    return data;
  }
}

class Mappings {
  int mal = 0;
  int anidb = 0;
  int kitsu = 0;
  int anilist = 0;
  int thetvdb = 0;
  int anisearch = 0;
  int livechart = 0;
  String? notifyMoe;
  String? animePlanet;

  Mappings(
      {this.mal = 0,
      this.anidb = 0,
      this.kitsu = 0,
      this.anilist = 0,
      this.thetvdb = 0,
      this.anisearch = 0,
      this.livechart = 0,
      this.notifyMoe,
      this.animePlanet});

  Mappings.fromJson(Map<String, dynamic> json) {
    mal = json["mal"] ?? 0;
    anidb = json["anidb"] ?? 0;
    kitsu = json["kitsu"] ?? 0;
    anilist = json["anilist"] ?? 0;
    thetvdb = json["thetvdb"] ?? 0;
    anisearch = json["anisearch"] ?? 0;
    livechart = json["livechart"] ?? 0;
    notifyMoe = json["notify.moe"];
    animePlanet = json["anime-planet"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["mal"] = mal;
    data["anidb"] = anidb;
    data["kitsu"] = kitsu;
    data["anilist"] = anilist;
    data["thetvdb"] = thetvdb;
    data["anisearch"] = anisearch;
    data["livechart"] = livechart;
    data["notify.moe"] = notifyMoe;
    data["anime-planet"] = animePlanet;
    return data;
  }
}

class Relations {
  int id = 0;
  String? relationType;
  int malId = 0;
  Title2? title;
  String? status;
  dynamic episodes;
  String? image;
  String? color;
  String? type;
  String? cover;
  double rating = 0;

  Relations(
      {this.id = 0,
      this.relationType,
      this.malId = 0,
      this.title,
      this.status,
      this.episodes,
      this.image,
      this.color,
      this.type,
      this.cover,
      this.rating = 0.0});

  Relations.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? 0;
    relationType = json["relationType"];
    malId = json["malId"] ?? 0;
    title = json["title"] == null ? null : Title2.fromJson(json["title"]);
    status = json["status"];
    episodes = json["episodes"];
    image = json["image"];
    color = json["color"];
    type = json["type"];
    cover = json["cover"];
    rating = (json["rating"] ?? 0.0).toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["relationType"] = relationType;
    data["malId"] = malId;
    if (title != null) {
      data["title"] = title?.toJson();
    }
    data["status"] = status;
    data["episodes"] = episodes;
    data["image"] = image;
    data["color"] = color;
    data["type"] = type;
    data["cover"] = cover;
    data["rating"] = rating;
    return data;
  }
}

class Title2 {
  String? romaji;
  String? english;
  String? native;
  String? userPreferred;

  Title2({this.romaji, this.english, this.native, this.userPreferred});

  Title2.fromJson(Map<String, dynamic> json) {
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

class Characters {
  int id = 0;
  String? role;
  Name? name;
  String? image;
  List<VoiceActors> voiceActors = const [];

  Characters(
      {this.id = 0,
      this.role,
      this.name,
      this.image,
      this.voiceActors = const []});

  Characters.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? 0;
    role = json["role"];
    name = json["name"] == null ? null : Name.fromJson(json["name"]);
    image = json["image"];
    voiceActors = (json["voiceActors"] as List)
        .map((e) => VoiceActors.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["role"] = role;
    if (name != null) {
      data["name"] = name?.toJson();
    }
    data["image"] = image;
    data["voiceActors"] = voiceActors.map((e) => e.toJson()).toList();
    return data;
  }
}

class VoiceActors {
  int id = 0;
  String? language;
  Name1? name;
  String? image;

  VoiceActors({this.id = 0, this.language, this.name, this.image});

  VoiceActors.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? 0;
    language = json["language"];
    name = json["name"] == null ? null : Name1.fromJson(json["name"]);
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["language"] = language;
    if (name != null) {
      data["name"] = name?.toJson();
    }
    data["image"] = image;
    return data;
  }
}

class Name1 {
  String? first;
  String? last;
  String? full;
  String? native;
  String? userPreferred;

  Name1({this.first, this.last, this.full, this.native, this.userPreferred});

  Name1.fromJson(Map<String, dynamic> json) {
    first = json["first"];
    last = json["last"];
    full = json["full"];
    native = json["native"];
    userPreferred = json["userPreferred"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["first"] = first;
    data["last"] = last;
    data["full"] = full;
    data["native"] = native;
    data["userPreferred"] = userPreferred;
    return data;
  }
}

class Name {
  String? first;
  String? last;
  String? full;
  String? native;
  String? userPreferred;

  Name({this.first, this.last, this.full, this.native, this.userPreferred});

  Name.fromJson(Map<String, dynamic> json) {
    first = json["first"];
    last = json["last"];
    full = json["full"];
    native = json["native"];
    userPreferred = json["userPreferred"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["first"] = first;
    data["last"] = last;
    data["full"] = full;
    data["native"] = native;
    data["userPreferred"] = userPreferred;
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
  double rating = 0;
  String? type;

  Recommendations(
      {this.id = 0,
      this.malId = 0,
      this.title,
      this.status,
      this.episodes = 0,
      this.image,
      this.cover,
      this.rating = 0.0,
      this.type});

  Recommendations.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? 0;
    malId = json["malId"] ?? 0;
    title = json["title"] == null ? null : Title1.fromJson(json["title"]);
    status = json["status"];
    episodes = json["episodes"] ?? 0;
    image = json["image"];
    cover = json["cover"];
    rating = (json["rating"] ?? 0.0).toDouble();
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
  String? english;
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
  int year = 0;
  int month = 0;
  int day = 0;

  EndDate({this.year = 0, this.month = 0, this.day = 0});

  EndDate.fromJson(Map<String, dynamic> json) {
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

class StartDate {
  int year = 0;
  int month = 0;
  int day = 0;

  StartDate({this.year = 0, this.month = 0, this.day = 0});

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
  String? english;
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
