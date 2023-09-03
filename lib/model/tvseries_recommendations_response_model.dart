class TvSeriesRecommendationsResponseModel {
  int page = 0;
  List<TVSeriesRecommendationData> results = const [];
  int totalPages = 0;
  int totalResults = 0;

  TvSeriesRecommendationsResponseModel(
      {this.page = 0,
      this.results = const [],
      this.totalPages = 0,
      this.totalResults = 0});

  TvSeriesRecommendationsResponseModel.fromJson(Map<String, dynamic> json) {
    page = json["page"] ?? 0;
    results = (json["results"] as List)
        .map((e) => TVSeriesRecommendationData.fromJson(e))
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

class TVSeriesRecommendationData {
  bool adult = false;
  String? backdropPath;
  int id = 0;
  String? name;
  String? originalLanguage;
  String? originalName;
  String? overview;
  String? posterPath;
  String? mediaType;
  List<int> genreIds = const [];
  double popularity = 0.0;
  String? firstAirDate;
  double voteAverage = 0.0;
  int voteCount = 0;
  List<String> originCountry = const [];

  TVSeriesRecommendationData(
      {this.adult = false,
      this.backdropPath,
      this.id = 0,
      this.name,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.posterPath,
      this.mediaType,
      this.genreIds = const [],
      this.popularity = 0.0,
      this.firstAirDate,
      this.voteAverage = 0.0,
      this.voteCount = 0,
      this.originCountry = const []});

  TVSeriesRecommendationData.fromJson(Map<String, dynamic> json) {
    adult = json["adult"];
    backdropPath = json["backdrop_path"];
    id = json["id"] ?? 0;
    name = json["name"];
    originalLanguage = json["original_language"];
    originalName = json["original_name"];
    overview = json["overview"];
    posterPath = json["poster_path"];
    mediaType = json["media_type"];
    genreIds = List<int>.from(json["genre_ids"]);
    popularity = (json["popularity"] ?? 0.0).toDouble();
    firstAirDate = json["first_air_date"];
    voteAverage = (json["vote_average"] ?? 0.0).toDouble();
    voteCount = json["vote_count"] ?? 0;
    originCountry = List<String>.from(json["origin_country"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["adult"] = adult;
    data["backdrop_path"] = backdropPath;
    data["id"] = id;
    data["name"] = name;
    data["original_language"] = originalLanguage;
    data["original_name"] = originalName;
    data["overview"] = overview;
    data["poster_path"] = posterPath;
    data["media_type"] = mediaType;
    data["genre_ids"] = genreIds;
    data["popularity"] = popularity;
    data["first_air_date"] = firstAirDate;
    data["vote_average"] = voteAverage;
    data["vote_count"] = voteCount;
    data["origin_country"] = originCountry;
    return data;
  }
}
