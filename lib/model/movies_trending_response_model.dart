class MoviesTrendingResponseModel {
  int page = 0;
  List<TrendingData> results = const [];
  int totalPages = 0;
  int totalResults = 0;

  MoviesTrendingResponseModel(
      {this.page = 0,
      this.results = const [],
      this.totalPages = 0,
      this.totalResults = 0});

  MoviesTrendingResponseModel.fromJson(Map<String, dynamic> json) {
    page = json["page"] ?? 0;
    results =
        (json["results"] as List).map((e) => TrendingData.fromJson(e)).toList();
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

class TrendingData {
  bool adult = false;
  String? backdropPath;
  int id = 0;
  String? title;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? mediaType;
  List<int> genreIds = const [];
  double popularity = 0.0;
  String? releaseDate;
  bool video = false;
  double voteAverage = 0.0;
  int voteCount = 0;

  TrendingData(
      {this.adult = false,
      this.backdropPath,
      this.id = 0,
      this.title,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.mediaType,
      this.genreIds = const [],
      this.popularity = 0.0,
      this.releaseDate,
      this.video = false,
      this.voteAverage = 0.0,
      this.voteCount = 0});

  TrendingData.fromJson(Map<String, dynamic> json) {
    adult = json["adult"];
    backdropPath = json["backdrop_path"];
    id = json["id"] ?? 0;
    title = json["title"];
    originalLanguage = json["original_language"];
    originalTitle = json["original_title"];
    overview = json["overview"];
    posterPath = json["poster_path"];
    mediaType = json["media_type"];
    genreIds = List<int>.from(json["genre_ids"]);
    popularity = (json["popularity"] ?? 0.0).toDouble();
    releaseDate = json["release_date"];
    video = json["video"];
    voteAverage = (json["vote_average"] ?? 0.0).toDouble();
    voteCount = json["vote_count"] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["adult"] = adult;
    data["backdrop_path"] = backdropPath;
    data["id"] = id;
    data["title"] = title;
    data["original_language"] = originalLanguage;
    data["original_title"] = originalTitle;
    data["overview"] = overview;
    data["poster_path"] = posterPath;
    data["media_type"] = mediaType;
    data["genre_ids"] = genreIds;
    data["popularity"] = popularity;
    data["release_date"] = releaseDate;
    data["video"] = video;
    data["vote_average"] = voteAverage;
    data["vote_count"] = voteCount;
    return data;
  }
}
