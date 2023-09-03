class PeopleInfoResponseModel {
  bool adult = false;
  List<String> alsoKnownAs = const [];
  String? biography;
  String? birthday;
  dynamic deathday;
  int gender = 0;
  dynamic homepage;
  int id = 0;
  String? imdbId;
  String? knownForDepartment;
  String? name;
  String? placeOfBirth;
  double popularity = 0.0;
  String? profilePath;

  PeopleInfoResponseModel(
      {this.adult = false,
      this.alsoKnownAs = const [],
      this.biography,
      this.birthday,
      this.deathday,
      this.gender = 0,
      this.homepage,
      this.id = 0,
      this.imdbId,
      this.knownForDepartment,
      this.name,
      this.placeOfBirth,
      this.popularity = 0.0,
      this.profilePath});

  PeopleInfoResponseModel.fromJson(Map<String, dynamic> json) {
    adult = json["adult"] ?? false;
    alsoKnownAs = List<String>.from(json["also_known_as"]);
    biography = json["biography"];
    birthday = json["birthday"];
    deathday = json["deathday"];
    gender = json["gender"] ?? 0;
    homepage = json["homepage"];
    id = json["id"] ?? 0;
    imdbId = json["imdb_id"];
    knownForDepartment = json["known_for_department"];
    name = json["name"];
    placeOfBirth = json["place_of_birth"];
    popularity = (json["popularity"] ?? 0.0).toDouble();
    profilePath = json["profile_path"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["adult"] = adult;
    data["also_known_as"] = alsoKnownAs;
    data["biography"] = biography;
    data["birthday"] = birthday;
    data["deathday"] = deathday;
    data["gender"] = gender;
    data["homepage"] = homepage;
    data["id"] = id;
    data["imdb_id"] = imdbId;
    data["known_for_department"] = knownForDepartment;
    data["name"] = name;
    data["place_of_birth"] = placeOfBirth;
    data["popularity"] = popularity;
    data["profile_path"] = profilePath;
    return data;
  }
}
