class MoviesDetailResponseModel {
  bool adult = false;
  String? backdropPath;
  dynamic belongsToCollection;
  int budget = 0;
  List<Genres> genres = const [];
  String? homepage;
  int id = 0;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double popularity = 0.0;
  String? posterPath;
  List<ProductionCompanies> productionCompanies = const [];
  List<ProductionCountries> productionCountries = const [];
  String? releaseDate;
  int revenue = 0;
  int runtime = 0;
  List<SpokenLanguages> spokenLanguages = const [];
  String? status;
  String? tagline;
  String? title;
  bool video = false;
  double voteAverage = 0.0;
  int voteCount = 0;

  MoviesDetailResponseModel(
      {this.adult = false,
      this.backdropPath,
      this.belongsToCollection,
      this.budget = 0,
      this.genres = const [],
      this.homepage,
      this.id = 0,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity = 0.0,
      this.posterPath,
      this.productionCompanies = const [],
      this.productionCountries = const [],
      this.releaseDate,
      this.revenue = 0,
      this.runtime = 0,
      this.spokenLanguages = const [],
      this.status,
      this.tagline,
      this.title,
      this.video = false,
      this.voteAverage = 0.0,
      this.voteCount = 0});

  MoviesDetailResponseModel.fromJson(Map<String, dynamic> json) {
    adult = json["adult"] ?? false;
    backdropPath = json["backdrop_path"];
    belongsToCollection = json["belongs_to_collection"];
    budget = json["budget"] ?? 0;
    genres = (json["genres"] as List).map((e) => Genres.fromJson(e)).toList();
    homepage = json["homepage"];
    id = json["id"] ?? 0;
    imdbId = json["imdb_id"];
    originalLanguage = json["original_language"];
    originalTitle = json["original_title"];
    overview = json["overview"];
    popularity = (json["popularity"] ?? 0.0).toDouble();
    posterPath = json["poster_path"];
    productionCompanies = (json["production_companies"] as List)
        .map((e) => ProductionCompanies.fromJson(e))
        .toList();
    productionCountries = (json["production_countries"] as List)
        .map((e) => ProductionCountries.fromJson(e))
        .toList();
    releaseDate = json["release_date"];
    revenue = json["revenue"] ?? 0;
    runtime = json["runtime"] ?? 0;
    spokenLanguages = (json["spoken_languages"] as List)
        .map((e) => SpokenLanguages.fromJson(e))
        .toList();
    status = json["status"];
    tagline = json["tagline"];
    title = json["title"];
    video = json["video"] ?? false;
    voteAverage = (json["vote_average"] ?? 0.0).toDouble();
    voteCount = json["vote_count"] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["adult"] = adult;
    data["backdrop_path"] = backdropPath;
    data["belongs_to_collection"] = belongsToCollection;
    data["budget"] = budget;

    data["genres"] = genres.map((e) => e.toJson()).toList();

    data["homepage"] = homepage;
    data["id"] = id;
    data["imdb_id"] = imdbId;
    data["original_language"] = originalLanguage;
    data["original_title"] = originalTitle;
    data["overview"] = overview;
    data["popularity"] = popularity;
    data["poster_path"] = posterPath;

    data["production_companies"] =
        productionCompanies.map((e) => e.toJson()).toList();

    data["production_countries"] =
        productionCountries.map((e) => e.toJson()).toList();

    data["release_date"] = releaseDate;
    data["revenue"] = revenue;
    data["runtime"] = runtime;

    data["spoken_languages"] = spokenLanguages.map((e) => e.toJson()).toList();

    data["status"] = status;
    data["tagline"] = tagline;
    data["title"] = title;
    data["video"] = video;
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
  dynamic logoPath;
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
