import 'package:anime_app/model/movies_images_response_model.dart';
import 'package:anime_app/model/movies_similar_response_model.dart';
import 'package:anime_app/services/rest_service.dart';
import 'package:anime_app/services/service_configuration.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:palette_generator/palette_generator.dart';

import '../model/movies_credits_response_model.dart';
import '../model/movies_details_response_model.dart';
import '../model/movies_recommendations_response_model.dart';

class MoviesDetailsViewModel extends ChangeNotifier {
  MoviesDetailResponseModel moviesDetailsData = MoviesDetailResponseModel();
  MoviesCreditResponseModel moviesCreditsData = MoviesCreditResponseModel();
  MoviesRecommendationsResponseModel moviesRecommendationsData =
      MoviesRecommendationsResponseModel();
  MoviesSimilarResponseModel moviesSimilarData = MoviesSimilarResponseModel();
  MoviesImageResponseModel moviesImageData = MoviesImageResponseModel();
  List<Crew> directors = [];
  ScrollController scrollController = ScrollController();
  bool isMovedFromInitialPosition = false;

  var f = NumberFormat("###,###.0#", "en_US");

  PaletteGenerator? palette;
  void oninit(int id) {
    moviesDetails(id);
    moviesCredits(id);
    moviesRecommendations(id);
    moviesSimilars(id);
    moviesImages(id);
    colorGenerator(
        '${ServiceConfigurations.imagePath}/p/w500/${moviesDetailsData.backdropPath}');
  }

  void moviesDetails(int id) async {
    var result = await RestService.moviesDetailsData(id);
    moviesDetailsData = result;
    notifyListeners();
  }

  void checkScroll() {
    if (scrollController.offset >= 170) {
      isMovedFromInitialPosition = true;
    } else {
      isMovedFromInitialPosition = false;
    }
    notifyListeners();
  }

  Color lightenColor(Color color, double factor) {
    int red = (color.red + (255 - color.red) * factor).round();
    int green = (color.green + (255 - color.green) * factor).round();
    int blue = (color.blue + (255 - color.blue) * factor).round();

    return Color.fromRGBO(red, green, blue, 1.0);
  }

  void moviesCredits(int id) async {
    var result = await RestService.moviesCreditData(id);
    moviesCreditsData = result;
    directors = [];
    directors.addAll(
      moviesCreditsData.crew
          .where((element) => element.job!.toLowerCase() == 'director'),
    );
    notifyListeners();
  }

  void moviesRecommendations(int id) async {
    var result = await RestService.moviesRecommendationData(id);
    moviesRecommendationsData = result;
    notifyListeners();
  }

  void moviesSimilars(int id) async {
    var result = await RestService.moviesSimilarData(id);
    moviesSimilarData = result;
    notifyListeners();
  }

  void moviesImages(int id) async {
    var result = await RestService.moviesImagesData(id);
    moviesImageData = result;
    notifyListeners();
  }

  void colorGenerator(String url) async {
    final PaletteGenerator generator = await PaletteGenerator.fromImageProvider(
      NetworkImage(url),
    );
    palette = generator;
    notifyListeners();
  }
}
