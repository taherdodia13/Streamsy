import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/genre_response_model.dart';

class AppConfiguration {
  static const Color primaryColor = Color(0xff000000);
  static const Color headingColor = Color(0xffFFFFFF);
  static const Color cardColor = Color(0xff18181b);
  static const Color seeAllColor = Color(0xff2196f3);
  static BuildContext? context;
  static TextStyle drawerList = TextStyle(
      color: AppConfiguration.headingColor,
      fontSize: 18.sp,
      fontWeight: FontWeight.w400);
  static List<Genres> moviesGenreList = [];
  static List<Genres> tvSeriesGenreList = [];
}
