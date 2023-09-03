import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:palette_generator/palette_generator.dart';

import '../model/anime_details_response_model.dart';
import '../services/rest_service.dart';

class AnimeDetailsViewmodel extends ChangeNotifier {
  AnimeDetailsResponseModel animeDetailsData = AnimeDetailsResponseModel();
  ScrollController scrollController = ScrollController();
  bool isMovedFromInitialPosition = false;
  var f = NumberFormat("###,###.0#", "en_US");

  PaletteGenerator? palette;
  void oninit(String id) {
    animeSeriesDetails(id);
    colorGenerator('${animeDetailsData.cover}');
  }

  void animeSeriesDetails(String id) async {
    var result = await RestService.animeDetails(id);
    animeDetailsData = result;
    notifyListeners();
  }

  String removeHtmlTags(String htmlText) {
    // Use a regular expression to match and remove HTML tags
    return htmlText.replaceAll(RegExp(r'<[^>]*>'), '');
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

  void colorGenerator(String url) async {
    final PaletteGenerator generator = await PaletteGenerator.fromImageProvider(
      NetworkImage(url),
    );
    palette = generator;
    notifyListeners();
  }
}
