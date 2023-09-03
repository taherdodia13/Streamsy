import 'package:anime_app/model/popular_movies_response_model.dart';
import 'package:anime_app/model/recent_anime_response_model.dart';
import 'package:anime_app/services/rest_service.dart';
import 'package:flutter/material.dart';

import '../model/movies_trending_response_model.dart';
import '../model/popular_anime_response_model.dart';
import '../model/popular_people_response_model.dart';
import '../model/popular_tvshows_response_model.dart';

class DashboardViewModel extends ChangeNotifier {
  // List<PopularDataModel> popularDataList = [];
  List<RecentDataModel> recentDataList = [];
  List<PopularMoviesData> popularMovieList = [];
  List<PopularTVShowsData> popularTVShowsList = [];
  List<PopularPeopleData> popularPeopleList = [];
  List<TrendingData> moviesTrendingList = [];
  int currentIndex = 0;
  List<AnimeDetails> animePopularDataList = [];

  void oninit() {
    getRecentData();
    getMoviesData();
    getPeoplesData();
    getTVShowsData();
    // getPopularData();
    // getYouMightLike();
    getMoviesTrendingData();
    getAnimePopularData();
  }

  void getMoviesData() async {
    popularMovieList.clear();
    var result = await RestService.popularMovies();
    for (int i = 0; i < result.results.length; i++) {
      popularMovieList.add(result.results[i]);
    }
    notifyListeners();
  }

  void getMoviesTrendingData() async {
    moviesTrendingList.clear();
    var result = await RestService.moviesTrendingData();
    for (int i = 0; i < result.results.length; i++) {
      moviesTrendingList.add(result.results[i]);
    }
    notifyListeners();
  }

  void getTVShowsData() async {
    popularTVShowsList.clear();
    var result = await RestService.popularTVShows();
    for (int i = 0; i < result.results.length; i++) {
      popularTVShowsList.add(result.results[i]);
    }
    notifyListeners();
  }

  void getPeoplesData() async {
    popularPeopleList.clear();
    var result = await RestService.popularPeoples();
    for (int i = 0; i < result.results.length; i++) {
      popularPeopleList.add(result.results[i]);
    }
    notifyListeners();
  }

  // void getPopularData() async {
  //   popularDataList.clear();
  //   var result = await RestService.popularAnime();
  //   for (int i = 0; i < result.results.length; i++) {
  //     popularDataList.add(result.results[i]);
  //   }
  //   notifyListeners();
  // }

  void getRecentData() async {
    recentDataList.clear();
    var result = await RestService.recentAnime();
    for (int i = 0; i < result.results.length; i++) {
      recentDataList.add(result.results[i]);
    }
    notifyListeners();
  }

  // void getYouMightLike() async {
  //   var result = await RestService.youMigthLike();
  //   youMigthLike = result;
  //   notifyListeners();
  // }

  void getAnimePopularData() async {
    var result = await RestService.animePopular();
    animePopularDataList = result.results;
    notifyListeners();
  }
}
