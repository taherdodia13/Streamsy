import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../configurations/app_configurations.dart';
import '../../model/tvseries_details_response_model.dart';
import '../../services/service_configuration.dart';
import '../../viewmodel/tvseries_viewmodel.dart';

class TVSeriesOverViewPage extends StatefulWidget {
  final TVSeriesViewmodel viewmodel;
  final TvSeriesDetailsResponseModel data;
  const TVSeriesOverViewPage(
      {super.key, required this.viewmodel, required this.data});

  @override
  State<TVSeriesOverViewPage> createState() => _TVSeriesOverViewPageState();
}

class _TVSeriesOverViewPageState extends State<TVSeriesOverViewPage> {
  @override
  Widget build(BuildContext context) {
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
                        'Status',
                        style: TextStyle(
                            color: AppConfiguration.headingColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
                      ).pOnly(bottom: 14),
                      Text(
                        widget.data.status ?? '',
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
                        'Network',
                        style: TextStyle(
                            color: AppConfiguration.headingColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
                      ).pOnly(bottom: 14),
                      ListView.builder(
                        itemCount: widget.data.networks.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Text(
                            widget.data.networks[index].name ?? '',
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
                        widget.data.originalLanguage ?? '',
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
                        'Type',
                        style: TextStyle(
                            color: AppConfiguration.headingColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
                      ).pOnly(bottom: 14),
                      Text(
                        '${widget.data.type}',
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
                    widget.data.overview ?? '',
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
                            'Creators',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700),
                          ).pOnly(bottom: 14),
                          ListView.builder(
                            itemCount: widget.viewmodel.creators.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return Text(
                                widget.viewmodel.creators[index].originalName ??
                                    widget.viewmodel.creators[index].name ??
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
                            'Production Companies',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700),
                          ).pOnly(bottom: 14),
                          ListView.builder(
                            itemCount: widget.data.productionCompanies.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return Text(
                                widget.data.productionCompanies[index].name ??
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
                            itemCount: widget.data.productionCountries.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return Text(
                                widget.data.productionCountries[index].name ??
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
                            'Spoken\nLanguage',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700),
                          ).pOnly(bottom: 14),
                          ListView.builder(
                            itemCount: widget.data.spokenLanguages.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return Text(
                                widget.data.spokenLanguages[index]
                                        .englishName ??
                                    widget.data.spokenLanguages[index].name ??
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
            Text(
              'Cast',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: AppConfiguration.headingColor,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  height: 1.5),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 310.h,
              child: ListView.builder(
                itemCount:
                    widget.viewmodel.tvSeriesAggregateCreditsData.cast.length,
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
                    height: 300.h,
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
                                '${ServiceConfigurations.imagePath}/p/w185/${widget.viewmodel.tvSeriesAggregateCreditsData.cast[index].profilePath ?? ''}'),
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
                          child: Text(
                            widget.viewmodel.tvSeriesAggregateCreditsData
                                    .cast[index].name ??
                                widget.viewmodel.tvSeriesAggregateCreditsData
                                    .cast[index].originalName ??
                                '',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ).p(10),
                        ),
                      ],
                    ),
                  ).onTap(() {
                    // Navigator.push(
                    // context,
                    // MoviesDetailsPage(
                    //   movieId: widget.viewmodel
                    //       .tvSeriesAggregateCreditsData
                    //       .cast[index]
                    //       .id,
                    // ).cupertinoRoute(),
                    // );
                  }).pSymmetric(h: 10);
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Seasons',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: AppConfiguration.headingColor,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  height: 1.5),
            ).pOnly(
              left: 20,
              bottom: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 320.h,
              child: ListView.builder(
                itemCount: widget.viewmodel.tvSeriesDetailsData.seasons.length,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(left: 10, right: 10),
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
                                '${ServiceConfigurations.imagePath}/p/w500/${widget.viewmodel.tvSeriesDetailsData.seasons[index].posterPath ?? ''}'),
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
                                widget.viewmodel.tvSeriesDetailsData
                                        .seasons[index].name ??
                                    widget.viewmodel.tvSeriesRecommendationsData
                                        .results[index].originalName ??
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
                    // MoviesDetailsPage(
                    //   movieId: widget.viewmodel
                    //       .tvSeriesAggregateCreditsData
                    //       .cast[index]
                    //       .id,
                    // ).cupertinoRoute(),
                    // );
                  }).pSymmetric(h: 10);
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Recommendations',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: AppConfiguration.headingColor,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  height: 1.5),
            ).pOnly(
              left: 20,
              bottom: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 320.h,
              child: ListView.builder(
                itemCount:
                    widget.viewmodel.tvSeriesRecommendationsData.results.length,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(left: 10, right: 10),
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
                                '${ServiceConfigurations.imagePath}/p/w500/${widget.viewmodel.tvSeriesRecommendationsData.results[index].posterPath ?? ''}'),
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
                                widget.viewmodel.tvSeriesRecommendationsData
                                        .results[index].name ??
                                    widget.viewmodel.tvSeriesRecommendationsData
                                        .results[index].originalName ??
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
                    // MoviesDetailsPage(
                    //   movieId: widget.viewmodel
                    //       .tvSeriesAggregateCreditsData
                    //       .cast[index]
                    //       .id,
                    // ).cupertinoRoute(),
                    // );
                  }).pSymmetric(h: 10);
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Similars',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: AppConfiguration.headingColor,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  height: 1.5),
            ).pOnly(
              left: 20,
              bottom: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 320.h,
              child: ListView.builder(
                itemCount: widget.viewmodel.tvSeriesSimilarData.results.length,
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
                                '${ServiceConfigurations.imagePath}/p/w500/${widget.viewmodel.tvSeriesSimilarData.results[index].posterPath ?? ''}'),
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
                                widget.viewmodel.tvSeriesSimilarData
                                        .results[index].name ??
                                    widget.viewmodel.tvSeriesSimilarData
                                        .results[index].originalName ??
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
                    //         .tvSeriesAggregateCreditsData
                    //         .cast[index]
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
