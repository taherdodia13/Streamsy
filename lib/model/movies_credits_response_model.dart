class MoviesCreditResponseModel {
  int id = 0;
  List<Cast> cast = const [];
  List<Crew> crew = const [];

  MoviesCreditResponseModel(
      {this.id = 0, this.cast = const [], this.crew = const []});

  MoviesCreditResponseModel.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? 0;
    cast = (json["cast"] as List).map((e) => Cast.fromJson(e)).toList();
    crew = (json["crew"] as List).map((e) => Crew.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["cast"] = cast.map((e) => e.toJson()).toList();
    data["crew"] = crew.map((e) => e.toJson()).toList();
    return data;
  }
}

class Crew {
  bool adult = false;
  int gender = 0;
  int id = 0;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double popularity = 0.0;
  String? profilePath;
  String? creditId;
  String? department;
  String? job;

  Crew(
      {this.adult = false,
      this.gender = 0,
      this.id = 0,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity = 0.0,
      this.profilePath,
      this.creditId,
      this.department,
      this.job});

  Crew.fromJson(Map<String, dynamic> json) {
    adult = json["adult"];
    gender = json["gender"];
    id = json["id"];
    knownForDepartment = json["known_for_department"];
    name = json["name"];
    originalName = json["original_name"];
    popularity = (json["popularity"] ?? 0.0).toDouble();
    profilePath = json["profile_path"];
    creditId = json["credit_id"];
    department = json["department"];
    job = json["job"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["adult"] = adult;
    data["gender"] = gender;
    data["id"] = id;
    data["known_for_department"] = knownForDepartment;
    data["name"] = name;
    data["original_name"] = originalName;
    data["popularity"] = popularity;
    data["profile_path"] = profilePath;
    data["credit_id"] = creditId;
    data["department"] = department;
    data["job"] = job;
    return data;
  }
}

class Cast {
  bool adult = false;
  int gender = 0;
  int id = 0;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double popularity = 0.0;
  String? profilePath;
  int castId = 0;
  String? character;
  String? creditId;
  int order = 0;

  Cast({
    this.adult = false,
    this.gender = 0,
    this.id = 0,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity = 0.0,
    this.profilePath,
    this.castId = 0,
    this.character,
    this.creditId,
    this.order = 0,
  });

  Cast.fromJson(Map<String, dynamic> json) {
    adult = json["adult"] ?? false;
    gender = json["gender"] ?? 0;
    id = json["id"] ?? 0;
    knownForDepartment = json["known_for_department"];
    name = json["name"];
    originalName = json["original_name"];
    popularity = (json["popularity"] ?? 0.0).toDouble();
    profilePath = json["profile_path"];
    castId = json["cast_id"] ?? 0;
    character = json["character"];
    creditId = json["credit_id"];
    order = json["order"] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["adult"] = adult;
    data["gender"] = gender;
    data["id"] = id;
    data["known_for_department"] = knownForDepartment;
    data["name"] = name;
    data["original_name"] = originalName;
    data["popularity"] = popularity;
    data["profile_path"] = profilePath;
    data["cast_id"] = castId;
    data["character"] = character;
    data["credit_id"] = creditId;
    data["order"] = order;
    return data;
  }
}
