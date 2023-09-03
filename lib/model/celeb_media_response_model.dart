class CelebsMediaResponseModel {
  int id = 0;
  List<Profiles> profiles = const [];

  CelebsMediaResponseModel({this.id = 0, this.profiles = const []});

  CelebsMediaResponseModel.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? 0;
    profiles =
        (json["profiles"] as List).map((e) => Profiles.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["profiles"] = profiles.map((e) => e.toJson()).toList();
    return data;
  }
}

class Profiles {
  double aspectRatio = 0.0;
  int height = 0;
  dynamic iso6391;
  String? filePath;
  double voteAverage = 0.0;
  int voteCount = 0;
  int width = 0;

  Profiles(
      {this.aspectRatio = 0.0,
      this.height = 0,
      this.iso6391,
      this.filePath,
      this.voteAverage = 0.0,
      this.voteCount = 0,
      this.width = 0});

  Profiles.fromJson(Map<String, dynamic> json) {
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
