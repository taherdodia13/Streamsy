import 'package:anime_app/model/celeb_credits_response_model.dart';
import 'package:flutter/material.dart';

import '../model/celeb_media_response_model.dart';
import '../model/people_info_response_model.dart';
import '../services/rest_service.dart';

class PeopleInfoViewModel extends ChangeNotifier {
  late PeopleInfoResponseModel celebData;
  late List<Cast> moviesCastCredit;
  late List<Cast> seriesCastCredit;
  late List<Crew> moviesCrewCredit;
  late List<Crew> seriesCrewCredit;
  late List<Profiles> mediaList;

  void oninit(int id) {
    getCelebData(id);
    getCelebMoviesCreditsData(id);
    getCelebSeriesCreditsData(id);
    getCelebMediaData(id);
    // getCelebCreditsData(id);
    // getMoviesDetailsData();
  }

  void getCelebData(int id) async {
    var result = await RestService.celebData(id);
    celebData = result;
    notifyListeners();
  }

  // void getCelebCreditsData(int id) async {
  //   var result = await RestService.celebCreditData(id);
  //   moviesCastCredit = result.cast;
  //   seriesCastCredit = result.crew;
  //   notifyListeners();
  // }

  void getCelebSeriesCreditsData(int id) async {
    var result = await RestService.celebTVseriesCreditData(id);
    seriesCastCredit = result.cast;
    seriesCrewCredit = result.crew;
    notifyListeners();
  }

  void getCelebMoviesCreditsData(int id) async {
    var result = await RestService.celebMoviesCreditData(id);
    moviesCastCredit = result.cast;
    moviesCrewCredit = result.crew;
    notifyListeners();
  }

  void getCelebMediaData(int id) async {
    var result = await RestService.peoplesMediaData(id);
    mediaList = result.profiles;
    notifyListeners();
  }
}
