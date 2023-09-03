class PopularTvShowsResponseModel {
  int page = 0;
  List<PopularTVShowsData> results = const [];
  int totalPages = 0;
  int totalResults = 0;

  PopularTvShowsResponseModel(
      {this.page = 0,
      this.results = const [],
      this.totalPages = 0,
      this.totalResults = 0});

  PopularTvShowsResponseModel.fromJson(Map<String, dynamic> json) {
    page = json["page"] ?? 0; 
    results =
        (json["results"] as List).map((e) => PopularTVShowsData.fromJson(e)).toList();
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

class PopularTVShowsData {
  String? backdropPath;
  String? firstAirDate;
  List<int> genreIds = const [];
  int id = 0;
  String? name;
  List<String> originCountry = const [];
  String? originalLanguage;
  String? originalName;
  String? overview;
  double popularity = 0.0;
  String? posterPath;
  double voteAverage = 0.0;
  int voteCount = 0;

  PopularTVShowsData(
      {this.backdropPath,
      this.firstAirDate,
      this.genreIds = const [],
      this.id = 0,
      this.name,
      this.originCountry = const [],
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.popularity = 0.0,
      this.posterPath,
      this.voteAverage = 0.0,
      this.voteCount = 0});

  PopularTVShowsData.fromJson(Map<String, dynamic> json) {
    backdropPath = json["backdrop_path"];
    firstAirDate = json["first_air_date"];
    genreIds = List<int>.from(json["genre_ids"]);
    id = json["id"] ?? 0;
    name = json["name"];
    originCountry = List<String>.from(json["origin_country"]);
    originalLanguage = json["original_language"];
    originalName = json["original_name"];
    overview = json["overview"];
    popularity = (json["popularity"] ?? 0.0).toDouble();
    posterPath = json["poster_path"];
    voteAverage = (json["vote_average"] ?? 0.0).toDouble();
    voteCount = json["vote_count"] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["backdrop_path"] = backdropPath;
    data["first_air_date"] = firstAirDate;
    data["genre_ids"] = genreIds;
    data["id"] = id;
    data["name"] = name;
    data["origin_country"] = originCountry;
    data["original_language"] = originalLanguage;
    data["original_name"] = originalName;
    data["overview"] = overview;
    data["popularity"] = popularity;
    data["poster_path"] = posterPath;
    data["vote_average"] = voteAverage;
    data["vote_count"] = voteCount;
    return data;
  }
}
