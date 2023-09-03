import 'package:anime_app/model/celeb_credits_response_model.dart';
import 'package:anime_app/services/service_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../configurations/app_configurations.dart';

class CreditsPage extends StatefulWidget {
  final List<Cast> moviesCastList;
  final List<Cast> seriesCastList;
  final List<Crew> moviesCrewList;
  final List<Crew> seriesCrewList;
  const CreditsPage({
    super.key,
    required this.moviesCastList,
    required this.seriesCastList,
    required this.moviesCrewList,
    required this.seriesCrewList,
  });

  @override
  State<CreditsPage> createState() => _CreditsPageState();
}

class _CreditsPageState extends State<CreditsPage> {
  @override
  Widget build(BuildContext context) {
    var celebMoviesCastData = widget.moviesCastList;
    var celebSeriesCastData = widget.seriesCastList;
    var celebMovieCrewsData = widget.moviesCrewList;
    var celebSeriesCrewData = widget.seriesCrewList;
    return Container(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (celebMoviesCastData.isNotEmpty)
              ListView.builder(
                itemCount: celebMoviesCastData.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(
                        0xff18181b,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FadeInImage(
                            width: 100.w,
                            height: 160.h,
                            image: NetworkImage(
                                ('${ServiceConfigurations.imagePath}/p/w500/${celebMoviesCastData[index].posterPath ?? ''}')),
                            placeholder: const AssetImage('assets/gallery.png'),
                            fadeInDuration: const Duration(milliseconds: 300),
                            fadeOutDuration: const Duration(milliseconds: 100),
                            fit: BoxFit.cover,
                            imageErrorBuilder: (BuildContext context,
                                Object error, StackTrace? stackTrace) {
                              return Image.asset(
                                'assets/gallery.png', // Display placeholder when an error occurs
                                width: 100.w,
                                height: 160.h,
                                fit: BoxFit.contain,
                              );
                            },
                            placeholderFit: BoxFit.contain,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                celebMoviesCastData[index].title ??
                                    celebMoviesCastData[index].originalTitle ??
                                    celebMoviesCastData[index].name ??
                                    celebMoviesCastData[index].originalName ??
                                    'No Title Found',
                                style: TextStyle(
                                    color: AppConfiguration.headingColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.sp),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              if (celebMoviesCastData[index]
                                  .genreIds
                                  .isNotEmpty)
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff3f3f46),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    AppConfiguration.moviesGenreList
                                            .firstWhere((e) =>
                                                e.id ==
                                                celebMoviesCastData[index]
                                                    .genreIds[0])
                                            .name ??
                                        '',
                                    style: TextStyle(
                                        color: AppConfiguration.headingColor,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                celebMoviesCastData[index].overview ?? '',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: AppConfiguration.headingColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ).pOnly(left: 10, top: 10, bottom: 5, right: 10),
                        )
                      ],
                    ),
                  );
                },
              ),
            if (celebSeriesCastData.isNotEmpty)
              ListView.builder(
                itemCount: celebSeriesCastData.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(
                        0xff18181b,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FadeInImage(
                            width: 100.w,
                            height: 160.h,
                            image: NetworkImage(
                                ('${ServiceConfigurations.imagePath}/p/w500/${celebSeriesCastData[index].posterPath ?? ''}')),
                            placeholder: const AssetImage('assets/gallery.png'),
                            fadeInDuration: const Duration(milliseconds: 300),
                            fadeOutDuration: const Duration(milliseconds: 100),
                            fit: BoxFit.cover,
                            imageErrorBuilder: (BuildContext context,
                                Object error, StackTrace? stackTrace) {
                              return Image.asset(
                                'assets/gallery.png', // Display placeholder when an error occurs
                                width: 100.w,
                                height: 160.h,
                                fit: BoxFit.contain,
                              );
                            },
                            placeholderFit: BoxFit.contain,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                celebSeriesCastData[index].title ??
                                    celebSeriesCastData[index].originalTitle ??
                                    celebSeriesCastData[index].name ??
                                    celebSeriesCastData[index].originalName ??
                                    'No Title Found',
                                style: TextStyle(
                                    color: AppConfiguration.headingColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.sp),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              if (celebSeriesCastData[index]
                                  .genreIds
                                  .isNotEmpty)
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff3f3f46),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    AppConfiguration.tvSeriesGenreList
                                            .firstWhere((e) =>
                                                e.id ==
                                                celebSeriesCastData[index]
                                                    .genreIds[0])
                                            .name ??
                                        '',
                                    style: TextStyle(
                                        color: AppConfiguration.headingColor,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                celebSeriesCastData[index].overview ?? '',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: AppConfiguration.headingColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ).pOnly(top: 10, bottom: 5, left: 10, right: 10),
                        )
                      ],
                    ),
                  );
                },
              ),
            if (celebMovieCrewsData.isNotEmpty)
              ListView.builder(
                itemCount: celebMovieCrewsData.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(
                        0xff18181b,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FadeInImage(
                            width: 100.w,
                            height: 160.h,
                            image: NetworkImage(
                                ('${ServiceConfigurations.imagePath}/p/w500/${celebMovieCrewsData[index].posterPath ?? ''}')),
                            placeholder: const AssetImage('assets/gallery.png'),
                            fadeInDuration: const Duration(milliseconds: 300),
                            fadeOutDuration: const Duration(milliseconds: 100),
                            fit: BoxFit.cover,
                            imageErrorBuilder: (BuildContext context,
                                Object error, StackTrace? stackTrace) {
                              return Image.asset(
                                'assets/gallery.png', // Display placeholder when an error occurs
                                width: 100.w,
                                height: 160.h,
                                fit: BoxFit.contain,
                              );
                            },
                            placeholderFit: BoxFit.contain,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                celebMovieCrewsData[index].title ??
                                    celebMovieCrewsData[index].originalTitle ??
                                    celebMovieCrewsData[index].name ??
                                    celebMovieCrewsData[index].originalName ??
                                    'No Title Found',
                                style: TextStyle(
                                    color: AppConfiguration.headingColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.sp),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              if (celebMovieCrewsData[index]
                                  .genreIds
                                  .isNotEmpty)
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff3f3f46),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    AppConfiguration.moviesGenreList
                                            .firstWhere((e) =>
                                                e.id ==
                                                celebMovieCrewsData[index]
                                                    .genreIds[0])
                                            .name ??
                                        '',
                                    style: TextStyle(
                                        color: AppConfiguration.headingColor,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                celebMovieCrewsData[index].overview ?? '',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: AppConfiguration.headingColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ).pOnly(top: 10, bottom: 5, left: 10, right: 10),
                        )
                      ],
                    ),
                  );
                },
              ),
            if (celebSeriesCrewData.isNotEmpty)
              ListView.builder(
                itemCount: celebSeriesCrewData.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(
                        0xff18181b,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FadeInImage(
                            width: 100.w,
                            height: 160.h,
                            image: NetworkImage(
                                ('${ServiceConfigurations.imagePath}/p/w500/${celebSeriesCrewData[index].posterPath ?? ''}')),
                            placeholder: const AssetImage('assets/gallery.png'),
                            fadeInDuration: const Duration(milliseconds: 300),
                            fadeOutDuration: const Duration(milliseconds: 100),
                            fit: BoxFit.cover,
                            imageErrorBuilder: (BuildContext context,
                                Object error, StackTrace? stackTrace) {
                              return Image.asset(
                                'assets/gallery.png', // Display placeholder when an error occurs
                                width: 100.w,
                                height: 160.h,
                                fit: BoxFit.contain,
                              );
                            },
                            placeholderFit: BoxFit.contain,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                celebSeriesCrewData[index].title ??
                                    celebSeriesCrewData[index].originalTitle ??
                                    celebSeriesCrewData[index].name ??
                                    celebSeriesCrewData[index].originalName ??
                                    'No Title Found',
                                style: TextStyle(
                                    color: AppConfiguration.headingColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.sp),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              if (celebSeriesCrewData[index]
                                  .genreIds
                                  .isNotEmpty)
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff3f3f46),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    AppConfiguration.tvSeriesGenreList
                                            .firstWhere((e) =>
                                                e.id ==
                                                celebSeriesCrewData[index]
                                                    .genreIds[0])
                                            .name ??
                                        '',
                                    style: TextStyle(
                                        color: AppConfiguration.headingColor,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                celebSeriesCrewData[index].overview ?? '',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: AppConfiguration.headingColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ).pOnly(top: 10, bottom: 5, left: 10, right: 10),
                        )
                      ],
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
