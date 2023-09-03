class TvSeriesImagesResponseModel {
  List<Backdrops> backdrops = const [];
  int id = 0;
  List<Logos> logos = const [];
  List<Posters> posters = const [];

  TvSeriesImagesResponseModel(
      {this.backdrops = const [],
      this.id = 0,
      this.logos = const [],
      this.posters = const []});

  TvSeriesImagesResponseModel.fromJson(Map<String, dynamic> json) {
    backdrops =
        (json["backdrops"] as List).map((e) => Backdrops.fromJson(e)).toList();
    id = json["id"] ?? 0;
    logos = (json["logos"] as List).map((e) => Logos.fromJson(e)).toList();
    posters =
        (json["posters"] as List).map((e) => Posters.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["backdrops"] = backdrops.map((e) => e.toJson()).toList();
    data["id"] = id;
    data["logos"] = logos.map((e) => e.toJson()).toList();
    data["posters"] = posters.map((e) => e.toJson()).toList();
    return data;
  }
}

class Posters {
  double aspectRatio = 0.0;
  int height = 0;
  String? iso6391;
  String? filePath;
  double voteAverage = 0.0;
  int voteCount = 0;
  int width = 0;

  Posters(
      {this.aspectRatio = 0.0,
      this.height = 0,
      this.iso6391,
      this.filePath,
      this.voteAverage = 0.0,
      this.voteCount = 0,
      this.width = 0});

  Posters.fromJson(Map<String, dynamic> json) {
    aspectRatio = (json["aspect_ratio"] ?? 0.0).toDouble();
    height = json["height"] ?? 0;
    iso6391 = json["iso_639_1"];
    filePath = json["file_path"];
    voteAverage = (json["vote_average"] ?? 0.0).toDouble();
    voteCount = json["vote_count"] ?? 0;
    width = json["width"] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["aspect_ratio"] = aspectRatio;
    data["height"] = height;
    data["iso_639_1"] = iso6391;
    data["file_path"] = filePath;
    data["vote_average"] = voteAverage;
    data["vote_count"] = voteCount;
    data["width"] = width;
    return data;
  }
}

class Logos {
  double aspectRatio = 0.0;
  int height = 0;
  String? iso6391;
  String? filePath;
  double voteAverage = 0.0;
  int voteCount = 0;
  int width = 0;

  Logos(
      {this.aspectRatio = 0.0,
      this.height = 0,
      this.iso6391,
      this.filePath,
      this.voteAverage = 0.0,
      this.voteCount = 0,
      this.width = 0});

  Logos.fromJson(Map<String, dynamic> json) {
    aspectRatio = (json["aspect_ratio"] ?? 0.0).toDouble();
    height = json["height"] ?? 0;
    iso6391 = json["iso_639_1"];
    filePath = json["file_path"];
    voteAverage = (json["vote_average"] ?? 0.0).toDouble();
    voteCount = json["vote_count"] ?? 0;
    width = json["width"] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["aspect_ratio"] = aspectRatio;
    data["height"] = height;
    data["iso_639_1"] = iso6391;
    data["file_path"] = filePath;
    data["vote_average"] = voteAverage;
    data["vote_count"] = voteCount;
    data["width"] = width;
    return data;
  }
}

class Backdrops {
  double aspectRatio = 0.0;
  int height = 0;
  dynamic iso6391;
  String? filePath;
  double voteAverage = 0.0;
  int voteCount = 0;
  int width = 0;

  Backdrops(
      {this.aspectRatio = 0.0,
      this.height = 0,
      this.iso6391,
      this.filePath,
      this.voteAverage = 0.0,
      this.voteCount = 0,
      this.width = 0});

  Backdrops.fromJson(Map<String, dynamic> json) {
    aspectRatio = (json["aspect_ratio"] ?? 0.0).toDouble();
    height = json["height"] ?? 0;
    iso6391 = json["iso_639_1"];
    filePath = json["file_path"];
    voteAverage = (json["vote_average"] ?? 0.0).toDouble();
    voteCount = json["vote_count"] ?? 0;
    width = json["width"] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["aspect_ratio"] = aspectRatio;
    data["height"] = height;
    data["iso_639_1"] = iso6391;
    data["file_path"] = filePath;
    data["vote_average"] = voteAverage;
    data["vote_count"] = voteCount;
    data["width"] = width;
    return data;
  }
}
