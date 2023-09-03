import 'package:anime_app/configurations/app_configurations.dart';
import 'package:anime_app/services/rest_service.dart';
import 'package:flutter/material.dart';

import '../model/genre_response_model.dart';
import '../view/dashboard.dart';
import '../view/discover.dart';

class MainPageViewModel extends ChangeNotifier {
  int selectedIndex = 0;
  final tabs = [
    const Dashboard(),
    const Discover(),
    const Center(
      child: Text(
        "Add Items",
        style: TextStyle(color: AppConfiguration.headingColor),
      ),
    ),
  ];

  void onTabChange(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void oninit() {
    getMoviesGenreList();
    getTvSeriesGenreList();
  }

  void getMoviesGenreList() async {
    MoviesGenreResponseModel result = await RestService.moviesGenresList();
    AppConfiguration.moviesGenreList = result.genres;
  }

  void getTvSeriesGenreList() async {
    TvSeriesGenresResponseModel result = await RestService.tvseriesGenresList();
    AppConfiguration.tvSeriesGenreList = result.genres;
  }
}
