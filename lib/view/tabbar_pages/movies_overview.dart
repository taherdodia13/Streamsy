import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../configurations/app_configurations.dart';
import '../../services/service_configuration.dart';
import '../../viewmodel/movies_details_viewmodel.dart';
import '../movies_details_page.dart';
import '../widgets/heading_widget.dart';

class MoviesOverViewPage extends StatefulWidget {
  final MoviesDetailsViewModel viewmodel;
  const MoviesOverViewPage({super.key, required this.viewmodel});

  @override
  State<MoviesOverViewPage> createState() => _MoviesOverViewPageState();
}

class _MoviesOverViewPageState extends State<MoviesOverViewPage> {
  @override
  Widget build(BuildContext context) {
    var movieData = widget.viewmodel.moviesDetailsData;
    return SingleChildScrollView(
      child: Container(
        color: AppConfiguration.primaryColor,
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 10,
                left: 20,
                right: 10,
              ),
              decoration: BoxDecoration(
                color: AppConfiguration.cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      Text(
                        'Original Title',
                        style: TextStyle(
                            color: AppConfiguration.headingColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
                      ).pOnly(bottom: 14),
                      Text(
                        movieData.originalTitle ?? movieData.title ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        style: TextStyle(
                            color: AppConfiguration.headingColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400),
                      ).pOnly(bottom: 14),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(
                        'Status',
                        style: TextStyle(
                            color: AppConfiguration.headingColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        movieData.status ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        style: TextStyle(
                            color: AppConfiguration.headingColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400),
                      ).pOnly(bottom: 14),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(
                        'Production Companies',
                        style: TextStyle(
                            color: AppConfiguration.headingColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      ListView.builder(
                        itemCount: movieData.productionCompanies.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Text(
                            movieData.productionCompanies[index].name ?? '',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400),
                          );
                        },
                      ).pOnly(bottom: 14),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(
                        'Original Language',
                        style: TextStyle(
                            color: AppConfiguration.headingColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
                      ).pOnly(bottom: 14),
                      Text(
                        movieData.originalLanguage ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        style: TextStyle(
                            color: AppConfiguration.headingColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400),
                      ).pOnly(bottom: 14),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(
                        'Budget',
                        style: TextStyle(
                            color: AppConfiguration.headingColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '\$ ${widget.viewmodel.f.format(movieData.budget)}0',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        style: TextStyle(
                            color: AppConfiguration.headingColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400),
                      ).pOnly(bottom: 14),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(
                        'Revenue',
                        style: TextStyle(
                            color: AppConfiguration.headingColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '\$ ${widget.viewmodel.f.format(movieData.revenue)}0',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        style: TextStyle(
                            color: AppConfiguration.headingColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400),
                      ).pOnly(bottom: 14),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 10,
                left: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                color: AppConfiguration.cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    movieData.overview ?? '',
                    style: TextStyle(
                        color: AppConfiguration.headingColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400),
                  ).pOnly(bottom: 14),
                  Table(
                    children: [
                      TableRow(
                        children: [
                          Text(
                            'Director',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700),
                          ).pOnly(bottom: 14),
                          ListView.builder(
                            itemCount: widget.viewmodel.directors.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return Text(
                                widget.viewmodel.directors[index]
                                        .originalName ??
                                    widget.viewmodel.directors[index].name ??
                                    '',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    height: 1.5),
                              );
                            },
                          ).pOnly(bottom: 14),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text(
                            'Production Countries',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700),
                          ).pOnly(bottom: 14),
                          ListView.builder(
                            itemCount: movieData.productionCountries.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return Text(
                                movieData.productionCountries[index].name ?? '',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    height: 1.5),
                              );
                            },
                          ).pOnly(bottom: 14),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text(
                            'Spoken\nLanguage',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700),
                          ).pOnly(bottom: 14),
                          ListView.builder(
                            itemCount: movieData.spokenLanguages.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return Text(
                                movieData.spokenLanguages[index].englishName ??
                                    movieData.spokenLanguages[index].name ??
                                    '',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    height: 1.5),
                              );
                            },
                          ).pOnly(bottom: 14),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            const HeadingWidget(
              heading: 'Cast',
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 340.h,
              child: ListView.builder(
                itemCount: widget.viewmodel.moviesCreditsData.cast.length,
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    width: 180.w,
                    decoration: const BoxDecoration(
                      color: AppConfiguration.cardColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    height: 310.h,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: FadeInImage(
                            width: 180.w,
                            height: 230.h,
                            imageErrorBuilder: (BuildContext context,
                                Object error, StackTrace? stackTrace) {
                              return Image.asset(
                                'assets/gallery.png', // Display placeholder when an error occurs
                                width: 100.w,
                                height: 160.h,
                                fit: BoxFit.contain,
                              );
                            },
                            image: NetworkImage(
                                '${ServiceConfigurations.imagePath}/p/w185/${widget.viewmodel.moviesCreditsData.cast[index].profilePath ?? ''}'),
                            placeholder: const AssetImage('assets/gallery.png'),
                            fadeInDuration: const Duration(milliseconds: 300),
                            fadeOutDuration: const Duration(milliseconds: 100),
                            fit: BoxFit.cover,
                            placeholderFit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 180.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.viewmodel.moviesCreditsData.cast[index]
                                        .name ??
                                    widget.viewmodel.moviesCreditsData
                                        .cast[index].originalName ??
                                    '',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ).pOnly(bottom: 5),
                              Text(
                                widget.viewmodel.moviesCreditsData.cast[index]
                                        .character ??
                                    '',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ).pOnly(bottom: 5),
                            ],
                          ).p(10),
                        ),
                      ],
                    ),
                  ).onTap(() {
                    Navigator.push(
                      context,
                      MoviesDetailsPage(
                        movieId:
                            widget.viewmodel.moviesCreditsData.cast[index].id,
                      ).cupertinoRoute(),
                    );
                  }).pSymmetric(h: 10);
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const HeadingWidget(
              heading: 'Recommendations',
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 320.h,
              child: ListView.builder(
                itemCount:
                    widget.viewmodel.moviesRecommendationsData.results.length,
                padding: const EdgeInsets.only(left: 10, right: 10),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    width: 180.w,
                    decoration: const BoxDecoration(
                      color: AppConfiguration.cardColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    height: 310.h,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: FadeInImage(
                            width: 180.w,
                            imageErrorBuilder: (BuildContext context,
                                Object error, StackTrace? stackTrace) {
                              return Image.asset(
                                'assets/gallery.png', // Display placeholder when an error occurs
                                width: 100.w,
                                height: 160.h,
                                fit: BoxFit.contain,
                              );
                            },
                            height: 230.h,
                            image: NetworkImage(
                                '${ServiceConfigurations.imagePath}/p/w500/${widget.viewmodel.moviesRecommendationsData.results[index].posterPath ?? ''}'),
                            placeholder: const AssetImage('assets/gallery.png'),
                            fadeInDuration: const Duration(milliseconds: 300),
                            fadeOutDuration: const Duration(milliseconds: 100),
                            fit: BoxFit.cover,
                            placeholderFit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 180.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.viewmodel.moviesRecommendationsData
                                        .results[index].title ??
                                    widget.viewmodel.moviesRecommendationsData
                                        .results[index].originalTitle ??
                                    '',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ).pOnly(bottom: 5),
                            ],
                          ).p(10),
                        ),
                      ],
                    ),
                  ).onTap(() {
                    // Navigator.push(
                    //   context,
                    //   MoviesDetailsPage(
                    //     movieId: widget.viewmodel
                    //         .moviesRecommendationsData
                    //         .results[index]
                    //         .id,
                    //   ).cupertinoRoute(),
                    // );
                  }).pSymmetric(h: 10);
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const HeadingWidget(
              heading: 'Similars',
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 320.h,
              child: ListView.builder(
                itemCount: widget.viewmodel.moviesSimilarData.results.length,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    width: 180.w,
                    decoration: const BoxDecoration(
                      color: AppConfiguration.cardColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    height: 310.h,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: FadeInImage(
                            width: 180.w,
                            height: 230.h,
                            imageErrorBuilder: (BuildContext context,
                                Object error, StackTrace? stackTrace) {
                              return Image.asset(
                                'assets/gallery.png', // Display placeholder when an error occurs
                                width: 100.w,
                                height: 160.h,
                                fit: BoxFit.contain,
                              );
                            },
                            image: NetworkImage(
                                '${ServiceConfigurations.imagePath}/p/w500/${widget.viewmodel.moviesSimilarData.results[index].posterPath ?? ''}'),
                            placeholder: const AssetImage('assets/gallery.png'),
                            fadeInDuration: const Duration(milliseconds: 300),
                            fadeOutDuration: const Duration(milliseconds: 100),
                            placeholderFit: BoxFit.contain,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 180.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.viewmodel.moviesSimilarData
                                        .results[index].title ??
                                    widget.viewmodel.moviesSimilarData
                                        .results[index].originalTitle ??
                                    '',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ).pOnly(bottom: 5),
                            ],
                          ).p(10),
                        ),
                      ],
                    ),
                  ).onTap(() {
                    // Navigator.push(
                    //   context,
                    //   MoviesDetailsPage(
                    //     movieId: viewmodel
                    //         .moviesSimilarData
                    //         .results[index]
                    //         .id,
                    //   ).cupertinoRoute(),
                    // );
                  }).pSymmetric(h: 10);
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
