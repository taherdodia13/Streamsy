class MoviesGenreResponseModel {
  List<Genres> genres = const [];

  MoviesGenreResponseModel({this.genres = const []});

  MoviesGenreResponseModel.fromJson(Map<String, dynamic> json) {
    genres = (json["genres"] as List).map((e) => Genres.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["genres"] = genres.map((e) => e.toJson()).toList();
    return data;
  }
}

class TvSeriesGenresResponseModel {
  List<Genres> genres = const [];

  TvSeriesGenresResponseModel({this.genres = const []});

  TvSeriesGenresResponseModel.fromJson(Map<String, dynamic> json) {
    genres = (json["genres"] as List).map((e) => Genres.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["genres"] = genres.map((e) => e.toJson()).toList();
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
