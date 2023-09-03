import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:palette_generator/palette_generator.dart';

import '../model/tvseries_aggregate_credits_response_model.dart';
import '../model/tvseries_details_response_model.dart';
import '../model/tvseries_images_response_model.dart';
import '../model/tvseries_recommendations_response_model.dart';
import '../model/tvseries_similar_response_model.dart';
import '../services/rest_service.dart';
import '../services/service_configuration.dart';

class TVSeriesViewmodel extends ChangeNotifier {
  TvSeriesDetailsResponseModel tvSeriesDetailsData =
      TvSeriesDetailsResponseModel();
  TvSeriesAggregateCreditsResponseModel tvSeriesAggregateCreditsData =
      TvSeriesAggregateCreditsResponseModel();
  TvSeriesRecommendationsResponseModel tvSeriesRecommendationsData =
      TvSeriesRecommendationsResponseModel();
  TvSeriesSimilarResponseModel tvSeriesSimilarData =
      TvSeriesSimilarResponseModel();
  TvSeriesImagesResponseModel tvSeriesImageData = TvSeriesImagesResponseModel();
  List<Crew> creators = [];
  ScrollController scrollController = ScrollController();
  bool isMovedFromInitialPosition = false;
  var f = NumberFormat("###,###.0#", "en_US");

  PaletteGenerator? palette;
  void oninit(int id) {
    tvSeriesDetails(id);
    tvSeriesCredits(id);
    tvSeriesRecommendations(id);
    tvSeriesSimilars(id);
    tvSeriesImages(id);
    colorGenerator(
        '${ServiceConfigurations.imagePath}/p/w500/${tvSeriesDetailsData.backdropPath}');
  }

  void tvSeriesDetails(int id) async {
    var result = await RestService.tvSeriesDetailsData(id);
    tvSeriesDetailsData = result;
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

  void tvSeriesCredits(int id) async {
    var result = await RestService.tvSeriesAggregateCreditData(id);
    tvSeriesAggregateCreditsData = result;
    creators = [];
    for (int i = 0; i < tvSeriesAggregateCreditsData.crew.length; i++) {
      for (int j = 0;
          j < tvSeriesAggregateCreditsData.crew[i].jobs.length;
          j++) {
        if (tvSeriesAggregateCreditsData.crew[i].jobs[j].job?.toLowerCase() ==
            'director') {
          creators.add(
            tvSeriesAggregateCreditsData.crew[i],
          );
        }
      }
    }
    notifyListeners();
  }

  void tvSeriesRecommendations(int id) async {
    var result = await RestService.tvSeriesRecommendationsData(id);
    tvSeriesRecommendationsData = result;
    notifyListeners();
  }

  void tvSeriesSimilars(int id) async {
    var result = await RestService.tvSeriesSimilarData(id);
    tvSeriesSimilarData = result;
    notifyListeners();
  }

  void tvSeriesImages(int id) async {
    var result = await RestService.tvSeriesImagessData(id);
    tvSeriesImageData = result;
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
