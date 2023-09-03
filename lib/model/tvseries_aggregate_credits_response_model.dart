class TvSeriesAggregateCreditsResponseModel {
  List<Cast> cast = const [];
  List<Crew> crew = const [];
  int id = 0;

  TvSeriesAggregateCreditsResponseModel(
      {this.cast = const [], this.crew = const [], this.id = 0});

  TvSeriesAggregateCreditsResponseModel.fromJson(Map<String, dynamic> json) {
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
  int gender = 0;
  int id = 0;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double popularity = 0.0;
  String? profilePath;
  List<Jobs> jobs = const [];
  String? department;
  int totalEpisodeCount = 0;

  Crew(
      {this.adult = false,
      this.gender = 0,
      this.id = 0,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity = 0.0,
      this.profilePath,
      this.jobs = const [],
      this.department,
      this.totalEpisodeCount = 0});

  Crew.fromJson(Map<String, dynamic> json) {
    adult = json["adult"];
    gender = json["gender"] ?? 0;
    id = json["id"] ?? 0;
    knownForDepartment = json["known_for_department"];
    name = json["name"];
    originalName = json["original_name"];
    popularity = (json["popularity"] ?? 0.0).toDouble();
    profilePath = json["profile_path"];
    jobs = (json["jobs"] as List).map((e) => Jobs.fromJson(e)).toList();
    department = json["department"];
    totalEpisodeCount = json["total_episode_count"] ?? 0;
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
    data["jobs"] = jobs.map((e) => e.toJson()).toList();
    data["department"] = department;
    data["total_episode_count"] = totalEpisodeCount;
    return data;
  }
}

class Jobs {
  String? creditId;
  String? job;
  int episodeCount = 0;

  Jobs({this.creditId, this.job, this.episodeCount = 0});

  Jobs.fromJson(Map<String, dynamic> json) {
    creditId = json["credit_id"];
    job = json["job"];
    episodeCount = json["episode_count"] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["credit_id"] = creditId;
    data["job"] = job;
    data["episode_count"] = episodeCount;
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
  List<Roles> roles = const [];
  int totalEpisodeCount = 0;
  int order = 0;

  Cast(
      {this.adult = false,
      this.gender = 0,
      this.id = 0,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity = 0.0,
      this.profilePath,
      this.roles = const [],
      this.totalEpisodeCount = 0,
      this.order = 0});

  Cast.fromJson(Map<String, dynamic> json) {
    adult = json["adult"];
    gender = json["gender"] ?? 0;
    id = json["id"] ?? 0;
    knownForDepartment = json["known_for_department"];
    name = json["name"];
    originalName = json["original_name"];
    popularity = (json["popularity"] ?? 0.0).toDouble();
    profilePath = json["profile_path"];
    roles = (json["roles"] as List).map((e) => Roles.fromJson(e)).toList();
    totalEpisodeCount = json["total_episode_count"] ?? 0;
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
    data["roles"] = roles.map((e) => e.toJson()).toList();
    data["total_episode_count"] = totalEpisodeCount;
    data["order"] = order;
    return data;
  }
}

class Roles {
  String? creditId;
  String? character;
  int episodeCount = 0;

  Roles({this.creditId, this.character, this.episodeCount = 0});

  Roles.fromJson(Map<String, dynamic> json) {
    creditId = json["credit_id"];
    character = json["character"];
    episodeCount = json["episode_count"] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["credit_id"] = creditId;
    data["character"] = character;
    data["episode_count"] = episodeCount;
    return data;
  }
}
