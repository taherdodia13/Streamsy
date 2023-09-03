class PopularMovieResponseModel {
  int page = 0;
  List<PopularMoviesData> results = const [];
  int totalPages = 0;
  int totalResults = 0;

  PopularMovieResponseModel(
      {this.page = 0,
      this.results = const [],
      this.totalPages = 0,
      this.totalResults = 0});

  PopularMovieResponseModel.fromJson(Map<String, dynamic> json) {
    page = json["page"] ?? 0;
    results = (json["results"] as List)
        .map((e) => PopularMoviesData.fromJson(e))
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

class PopularMoviesData {
  bool adult = false;
  String? backdropPath;
  List<int> genreIds = const [];
  int id = 0;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double popularity = 0.0;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool video = false;
  double voteAverage = 0.0;
  int voteCount = 0;

  PopularMoviesData(
      {this.adult = false,
      this.backdropPath,
      this.genreIds = const [],
      this.id = 0,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity = 0.0,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video = false,
      this.voteAverage = 0.0,
      this.voteCount = 0});

  PopularMoviesData.fromJson(Map<String, dynamic> json) {
    adult = json["adult"];
    backdropPath = json["backdrop_path"];
    genreIds = List<int>.from(json["genre_ids"]);
    id = json["id"] ?? 0;
    originalLanguage = json["original_language"];
    originalTitle = json["original_title"];
    overview = json["overview"];
    popularity = (json["popularity"] ?? 0.0).toDouble();
    posterPath = json["poster_path"];
    releaseDate = json["release_date"];
    title = json["title"];
    video = json["video"];
    voteAverage = (json["vote_average"] ?? 0.0).toDouble();
    voteCount = json["vote_count"] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["adult"] = adult;
    data["backdrop_path"] = backdropPath;
    data["genre_ids"] = genreIds;
    data["id"] = id;
    data["original_language"] = originalLanguage;
    data["original_title"] = originalTitle;
    data["overview"] = overview;
    data["popularity"] = popularity;
    data["poster_path"] = posterPath;
    data["release_date"] = releaseDate;
    data["title"] = title;
    data["video"] = video;
    data["vote_average"] = voteAverage;
    data["vote_count"] = voteCount;
    return data;
  }
}
