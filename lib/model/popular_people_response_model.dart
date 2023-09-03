class PopularPeopleResponseModel {
  int page = 0;
  List<PopularPeopleData> results = const [];
  int totalPages = 0;
  int totalResults = 0;

  PopularPeopleResponseModel(
      {this.page = 0,
      this.results = const [],
      this.totalPages = 0,
      this.totalResults = 0});

  PopularPeopleResponseModel.fromJson(Map<String, dynamic> json) {
    page = json["page"] ?? 0;
    results = (json["results"] as List)
        .map((e) => PopularPeopleData.fromJson(e))
        .toList();
    totalPages = json["total_pages"] ?? 0;
    totalResults = json["total_results"] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["page"] = page;
    data["results"] = results.map((e) => e.toJson()).toList();
    data["total_pages"] = totalPages;
    data["total_results"] = totalResults;
    return data;
  }
}

class PopularPeopleData {
  bool adult = false;
  int gender = 0;
  int id = 0;
  List<KnownFor> knownFor = const [];
  String? knownForDepartment;
  String? name;
  double popularity = 0.0;
  String? profilePath;

  PopularPeopleData(
      {this.adult = false,
      this.gender = 0,
      this.id = 0,
      this.knownFor = const [],
      this.knownForDepartment,
      this.name,
      this.popularity = 0.0,
      this.profilePath});

  PopularPeopleData.fromJson(Map<String, dynamic> json) {
    adult = json["adult"];
    gender = json["gender"] ?? 0;
    id = json["id"] ?? 0;
    knownFor =
        (json["known_for"] as List).map((e) => KnownFor.fromJson(e)).toList();
    knownForDepartment = json["known_for_department"];
    name = json["name"];
    popularity = (json["popularity"] ?? 0.0).toDouble();
    profilePath = json["profile_path"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["adult"] = adult;
    data["gender"] = gender;
    data["id"] = id;
    data["known_for"] = knownFor.map((e) => e.toJson()).toList();
    data["known_for_department"] = knownForDepartment;
    data["name"] = name;
    data["popularity"] = popularity;
    data["profile_path"] = profilePath;
    return data;
  }
}

class KnownFor {
  bool adult = false;
  String? backdropPath;
  List<int> genreIds = const [];
  int id = 0;
  String? mediaType;
  String? originalLanguage;
  String? originalTitle;
  String? name;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool video = false;
  double voteAverage = 0.0;
  int voteCount = 0;

  KnownFor(
      {this.adult = false,
      this.backdropPath,
      this.genreIds = const [],
      this.id = 0,
      this.mediaType,
      this.originalLanguage,
      this.originalTitle,
      this.name,
      this.overview,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video = false,
      this.voteAverage = 0.0,
      this.voteCount = 0});

  KnownFor.fromJson(Map<String, dynamic> json) {
    adult = json["adult"] ?? false;
    backdropPath = json["backdrop_path"];
    genreIds = List<int>.from(json["genre_ids"]);
    id = json["id"] ?? 0;
    mediaType = json["media_type"];
    originalLanguage = json["original_language"];
    originalTitle = json["original_title"];
    overview = json["overview"];
    posterPath = json["poster_path"];
    releaseDate = json["release_date"];
    title = json["title"];
    name = json["name"];
    video = json["video"] ?? false;
    voteAverage = (json["vote_average"] ?? 0.0).toDouble();
    voteCount = json["vote_count"] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["adult"] = adult;
    data["backdrop_path"] = backdropPath;
    data["genre_ids"] = genreIds;
    data["id"] = id;
    data["media_type"] = mediaType;
    data["original_language"] = originalLanguage;
    data["original_title"] = originalTitle;
    data["overview"] = overview;
    data["poster_path"] = posterPath;
    data["release_date"] = releaseDate;
    data["title"] = title;
    data["name"] = name;
    data["video"] = video;
    data["vote_average"] = voteAverage;
    data["vote_count"] = voteCount;
    return data;
  }
}
