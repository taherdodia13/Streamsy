class TvSeriesDetailsResponseModel {
  bool adult = false;
  String? backdropPath;
  List<CreatedBy> createdBy = const [];
  List<int> episodeRunTime = const [];
  String? firstAirDate;
  List<Genres> genres = const [];
  String? homepage;
  int id = 0;
  bool inProduction = false;
  List<String> languages = const [];
  String? lastAirDate;
  LastEpisodeToAir? lastEpisodeToAir;
  String? name;
  dynamic nextEpisodeToAir;
  List<Networks> networks = const [];
  int numberOfEpisodes = 0;
  int numberOfSeasons = 0;
  List<String> originCountry = const [];
  String? originalLanguage;
  String? originalName;
  String? overview;
  double popularity = 0.0;
  String? posterPath;
  List<ProductionCompanies> productionCompanies = const [];
  List<ProductionCountries> productionCountries = const [];
  List<Seasons> seasons = const [];
  List<SpokenLanguages> spokenLanguages = const [];
  String? status;
  String? tagline;
  String? type;
  double voteAverage = 0.0;
  int voteCount = 0;

  TvSeriesDetailsResponseModel(
      {this.adult = false,
      this.backdropPath,
      this.createdBy = const [],
      this.episodeRunTime = const [],
      this.firstAirDate,
      this.genres = const [],
      this.homepage,
      this.id = 0,
      this.inProduction = false,
      this.languages = const [],
      this.lastAirDate,
      this.lastEpisodeToAir,
      this.name,
      this.nextEpisodeToAir,
      this.networks = const [],
      this.numberOfEpisodes = 0,
      this.numberOfSeasons = 0,
      this.originCountry = const [],
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.popularity = 0.0,
      this.posterPath,
      this.productionCompanies = const [],
      this.productionCountries = const [],
      this.seasons = const [],
      this.spokenLanguages = const [],
      this.status,
      this.tagline,
      this.type,
      this.voteAverage = 0.0,
      this.voteCount = 0});

  TvSeriesDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    adult = json["adult"];
    backdropPath = json["backdrop_path"];
    createdBy =
        (json["created_by"] as List).map((e) => CreatedBy.fromJson(e)).toList();
    episodeRunTime = List<int>.from(json["episode_run_time"]);
    firstAirDate = json["first_air_date"];
    genres = (json["genres"] as List).map((e) => Genres.fromJson(e)).toList();
    homepage = json["homepage"];
    id = json["id"] ?? 0;
    inProduction = json["in_production"];
    languages = List<String>.from(json["languages"]);
    lastAirDate = json["last_air_date"];
    lastEpisodeToAir = json["last_episode_to_air"] == null
        ? null
        : LastEpisodeToAir.fromJson(json["last_episode_to_air"]);
    name = json["name"];
    nextEpisodeToAir = json["next_episode_to_air"];
    networks =
        (json["networks"] as List).map((e) => Networks.fromJson(e)).toList();
    numberOfEpisodes = json["number_of_episodes"] ?? 0;
    numberOfSeasons = json["number_of_seasons"] ?? 0;
    originCountry = List<String>.from(json["origin_country"]);
    originalLanguage = json["original_language"];
    originalName = json["original_name"];
    overview = json["overview"];
    popularity = (json["popularity"] ?? 0.0).toDouble();
    posterPath = json["poster_path"];
    productionCompanies = (json["production_companies"] as List)
        .map((e) => ProductionCompanies.fromJson(e))
        .toList();
    productionCountries = (json["production_countries"] as List)
        .map((e) => ProductionCountries.fromJson(e))
        .toList();
    seasons =
        (json["seasons"] as List).map((e) => Seasons.fromJson(e)).toList();
    spokenLanguages = (json["spoken_languages"] as List)
        .map((e) => SpokenLanguages.fromJson(e))
        .toList();
    status = json["status"];
    tagline = json["tagline"];
    type = json["type"];
    voteAverage = (json["vote_average"] ?? 0.0).toDouble();
    voteCount = json["vote_count"] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["adult"] = adult;
    data["backdrop_path"] = backdropPath;
    data["created_by"] = createdBy.map((e) => e.toJson()).toList();
    data["episode_run_time"] = episodeRunTime;
    data["first_air_date"] = firstAirDate;
    data["genres"] = genres.map((e) => e.toJson()).toList();
    data["homepage"] = homepage;
    data["id"] = id;
    data["in_production"] = inProduction;
    data["languages"] = languages;
    data["last_air_date"] = lastAirDate;
    if (lastEpisodeToAir != null) {
      data["last_episode_to_air"] = lastEpisodeToAir?.toJson();
    }
    data["name"] = name;
    data["next_episode_to_air"] = nextEpisodeToAir;
    data["networks"] = networks.map((e) => e.toJson()).toList();
    data["number_of_episodes"] = numberOfEpisodes;
    data["number_of_seasons"] = numberOfSeasons;
    data["origin_country"] = originCountry;
    data["original_language"] = originalLanguage;
    data["original_name"] = originalName;
    data["overview"] = overview;
    data["popularity"] = popularity;
    data["poster_path"] = posterPath;
    data["production_companies"] =
        productionCompanies.map((e) => e.toJson()).toList();
    data["production_countries"] =
        productionCountries.map((e) => e.toJson()).toList();
    data["seasons"] = seasons.map((e) => e.toJson()).toList();
    data["spoken_languages"] = spokenLanguages.map((e) => e.toJson()).toList();
    data["status"] = status;
    data["tagline"] = tagline;
    data["type"] = type;
    data["vote_average"] = voteAverage;
    data["vote_count"] = voteCount;
    return data;
  }
}

class SpokenLanguages {
  String? englishName;
  String? iso6391;
  String? name;

  SpokenLanguages({this.englishName, this.iso6391, this.name});

  SpokenLanguages.fromJson(Map<String, dynamic> json) {
    englishName = json["english_name"];
    iso6391 = json["iso_639_1"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["english_name"] = englishName;
    data["iso_639_1"] = iso6391;
    data["name"] = name;
    return data;
  }
}

class Seasons {
  dynamic airDate;
  int episodeCount = 0;
  int id = 0;
  String? name;
  String? overview;
  String? posterPath;
  int seasonNumber = 0;
  double voteAverage = 0.0;

  Seasons(
      {this.airDate,
      this.episodeCount = 0,
      this.id = 0,
      this.name,
      this.overview,
      this.posterPath,
      this.seasonNumber = 0,
      this.voteAverage = 0.0});

  Seasons.fromJson(Map<String, dynamic> json) {
    airDate = json["air_date"];
    episodeCount = json["episode_count"] ?? 0;
    id = json["id"] ?? 0;
    name = json["name"];
    overview = json["overview"];
    posterPath = json["poster_path"];
    seasonNumber = json["season_number"] ?? 0;
    voteAverage = (json["vote_average"] ?? 0.0).toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["air_date"] = airDate;
    data["episode_count"] = episodeCount;
    data["id"] = id;
    data["name"] = name;
    data["overview"] = overview;
    data["poster_path"] = posterPath;
    data["season_number"] = seasonNumber;
    data["vote_average"] = voteAverage;
    return data;
  }
}

class ProductionCountries {
  String? iso31661;
  String? name;

  ProductionCountries({this.iso31661, this.name});

  ProductionCountries.fromJson(Map<String, dynamic> json) {
    iso31661 = json["iso_3166_1"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["iso_3166_1"] = iso31661;
    data["name"] = name;
    return data;
  }
}

class ProductionCompanies {
  int id = 0;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompanies(
      {this.id = 0, this.logoPath, this.name, this.originCountry});

  ProductionCompanies.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? 0;
    logoPath = json["logo_path"];
    name = json["name"];
    originCountry = json["origin_country"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["logo_path"] = logoPath;
    data["name"] = name;
    data["origin_country"] = originCountry;
    return data;
  }
}

class Networks {
  int id = 0;
  String? logoPath;
  String? name;
  String? originCountry;

  Networks({this.id = 0, this.logoPath, this.name, this.originCountry});

  Networks.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? 0;
    logoPath = json["logo_path"];
    name = json["name"];
    originCountry = json["origin_country"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["logo_path"] = logoPath;
    data["name"] = name;
    data["origin_country"] = originCountry;
    return data;
  }
}

class LastEpisodeToAir {
  int id = 0;
  String? name;
  String? overview;
  double voteAverage = 0.0;
  int voteCount = 0;
  String? airDate;
  int episodeNumber = 0;
  String? episodeType;
  String? productionCode;
  dynamic runtime;
  int seasonNumber = 0;
  int showId = 0;
  String? stillPath;

  LastEpisodeToAir(
      {this.id = 0,
      this.name,
      this.overview,
      this.voteAverage = 0.0,
      this.voteCount = 0,
      this.airDate,
      this.episodeNumber = 0,
      this.episodeType,
      this.productionCode,
      this.runtime,
      this.seasonNumber = 0,
      this.showId = 0,
      this.stillPath});

  LastEpisodeToAir.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? 0;
    name = json["name"];
    overview = json["overview"];
    voteAverage = (json["vote_average"] ?? 0.0).toDouble();
    voteCount = json["vote_count"] ?? 0;
    airDate = json["air_date"];
    episodeNumber = json["episode_number"] ?? 0;
    episodeType = json["episode_type"];
    productionCode = json["production_code"];
    runtime = json["runtime"];
    seasonNumber = json["season_number"] ?? 0;
    showId = json["show_id"] ?? 0;
    stillPath = json["still_path"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["overview"] = overview;
    data["vote_average"] = voteAverage;
    data["vote_count"] = voteCount;
    data["air_date"] = airDate;
    data["episode_number"] = episodeNumber;
    data["episode_type"] = episodeType;
    data["production_code"] = productionCode;
    data["runtime"] = runtime;
    data["season_number"] = seasonNumber;
    data["show_id"] = showId;
    data["still_path"] = stillPath;
    return data;
  }
}

class Genres {
  int id = 0;
  String? name;

  Genres({this.id = 0, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? 0;
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    return data;
  }
}

class CreatedBy {
  int id = 0;
  String? creditId;
  String? name;
  int gender = 0;
  String? profilePath;

  CreatedBy(
      {this.id = 0,
      this.creditId,
      this.name,
      this.gender = 0,
      this.profilePath});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? 0;
    creditId = json["credit_id"];
    name = json["name"];
    gender = json["gender"] ?? 0;
    profilePath = json["profile_path"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["credit_id"] = creditId;
    data["name"] = name;
    data["gender"] = gender;
    data["profile_path"] = profilePath;
    return data;
  }
}
