class PeopleCreditsResponseModel {
  List<Cast> cast = const [];
  List<Crew> crew = const [];
  int id = 0;

  PeopleCreditsResponseModel(
      {this.cast = const [], this.crew = const [], this.id = 0});

  PeopleCreditsResponseModel.fromJson(Map<String, dynamic> json) {
    cast = (json["cast"] as List).map((e) => Cast.fromJson(e)).toList();
    crew = (json["crew"] as List).map((e) => Crew.fromJson(e)).toList();
    id = json["id"] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["cast"] = cast.map((e) => e.toJson()).toList();
    data["crew"] = crew.map((e) => e.toJson()).toList();
    data["id"] = id;
    return data;
  }
}

class Crew {
  bool adult = false;
  String? backdropPath;
  List<int> genreIds = const [];
  int id = 0;
  String? originalLanguage;
  String? originalTitle;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  String? name;
  bool video = false;
  double voteAverage = 0.0;
  int voteCount = 0;
  String? creditId;
  String? department;
  String? job;
  String? mediaType;

  Crew(
      {this.adult = false,
      this.backdropPath,
      this.genreIds = const [],
      this.id = 0,
      this.originalLanguage,
      this.originalTitle,
      this.originalName,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.name,
      this.video = false,
      this.voteAverage = 0.0,
      this.voteCount = 0,
      this.creditId,
      this.department,
      this.job,
      this.mediaType});

  Crew.fromJson(Map<String, dynamic> json) {
    adult = json["adult"] ?? false;
    backdropPath = json["backdrop_path"];
    genreIds = List<int>.from(json["genre_ids"]);
    id = json["id"] ?? 0;
    originalLanguage = json["original_language"];
    originalTitle = json["original_title"];
    originalName = json["original_name"];
    overview = json["overview"];
    popularity = json["popularity"];
    posterPath = json["poster_path"];
    releaseDate = json["release_date"];
    title = json["title"];
    name = json["name"];
    video = json["video"] ?? false;
    voteAverage = (json["vote_average"] ?? 0.0).toDouble();
    voteCount = json["vote_count"] ?? 0;
    creditId = json["credit_id"];
    department = json["department"];
    job = json["job"];
    mediaType = json["media_type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["adult"] = adult;
    data["backdrop_path"] = backdropPath;
    data["genre_ids"] = genreIds;
    data["id"] = id;
    data["original_language"] = originalLanguage;
    data["original_title"] = originalTitle;
    data["original_name"] = originalName;
    data["overview"] = overview;
    data["popularity"] = popularity;
    data["poster_path"] = posterPath;
    data["release_date"] = releaseDate;
    data["title"] = title;
    data["name"] = name;
    data["video"] = video;
    data["vote_average"] = voteAverage;
    data["vote_count"] = voteCount;
    data["credit_id"] = creditId;
    data["department"] = department;
    data["job"] = job;
    data["media_type"] = mediaType;
    return data;
  }
}

class Cast {
  bool adult = false;
  String? backdropPath;
  List<int> genreIds = const [];
  int id = 0;
  String? originalLanguage;
  String? originalTitle;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  String? name;
  bool video = false;
  double voteAverage = 0.0;
  int voteCount = 0;
  String? character;
  String? creditId;
  int order = 0;
  String? mediaType;

  Cast(
      {this.adult = false,
      this.backdropPath,
      this.genreIds = const [],
      this.id = 0,
      this.originalLanguage,
      this.originalTitle,
      this.originalName,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.name,
      this.video = false,
      this.voteAverage = 0.0,
      this.voteCount = 0,
      this.character,
      this.creditId,
      this.order = 0,
      this.mediaType});

  Cast.fromJson(Map<String, dynamic> json) {
    adult = json["adult"] ?? false;
    backdropPath = json["backdrop_path"];
    genreIds = List<int>.from(json["genre_ids"]);
    id = json["id"] ?? 0;
    originalLanguage = json["original_language"];
    originalTitle = json["original_title"];
    originalName = json["original_name"];
    overview = json["overview"];
    popularity = json["popularity"];
    posterPath = json["poster_path"];
    releaseDate = json["release_date"];
    title = json["title"];
    name = json["name"];
    video = json["video"] ?? false;
    voteAverage = (json["vote_average"] ?? 0.0).toDouble();
    voteCount = json["vote_count"] ?? 0;
    character = json["character"];
    creditId = json["credit_id"];
    order = json["order"] ?? 0;
    mediaType = json["media_type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["adult"] = adult;
    data["backdrop_path"] = backdropPath;
    data["genre_ids"] = genreIds;
    data["id"] = id;
    data["original_language"] = originalLanguage;
    data["original_title"] = originalTitle;
    data["original_name"] = originalName;
    data["overview"] = overview;
    data["popularity"] = popularity;
    data["poster_path"] = posterPath;
    data["release_date"] = releaseDate;
    data["title"] = title;
    data["name"] = name;
    data["video"] = video;
    data["vote_average"] = voteAverage;
    data["vote_count"] = voteCount;
    data["character"] = character;
    data["credit_id"] = creditId;
    data["order"] = order;
    data["media_type"] = mediaType;
    return data;
  }
}
