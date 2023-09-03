import 'package:anime_app/services/service_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../configurations/app_configurations.dart';
import '../viewmodel/movies_details_viewmodel.dart';

class MoviesDetailsPage extends StatefulWidget {
  final int movieId;
  const MoviesDetailsPage({super.key, required this.movieId});

  MoviesDetailsViewModel viewmodel() =>
      GetIt.instance.get<MoviesDetailsViewModel>();

  @override
  State<MoviesDetailsPage> createState() => _MoviesDetailsPageState();
}

class _MoviesDetailsPageState extends State<MoviesDetailsPage> {
  @override
  void initState() {
    widget.viewmodel().oninit(widget.movieId);
    widget.viewmodel().scrollController.addListener(() {
      widget.viewmodel().checkScroll();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MoviesDetailsViewModel>.value(
      value: widget.viewmodel(),
      child: Consumer<MoviesDetailsViewModel>(
          builder: (context, viewmodel, child) {
        var movieData = viewmodel.moviesDetailsData;
        return SafeArea(
          child: Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
                preferredSize: Size(double.infinity,
                    viewmodel.isMovedFromInitialPosition ? 70 : 50),
                child: viewmodel.isMovedFromInitialPosition
                    ? AppBar(
                        backgroundColor: viewmodel
                                .palette?.darkVibrantColor?.color
                                .withOpacity(0.99) ??
                            AppConfiguration.primaryColor,
                        elevation: 0.0,
                        leadingWidth: 50.w,
                        title: Text(
                          viewmodel.moviesDetailsData.title ?? '',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppConfiguration.headingColor,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ).pOnly(top: 10),
                        leading: Icon(
                          Icons.arrow_back_ios,
                          size: 24.sp,
                          color: AppConfiguration.headingColor,
                        ).pOnly(top: 10).onTap(
                          () {
                            Navigator.pop(context);
                          },
                        ),
                        actions: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.share,
                              size: 26.sp,
                              color: AppConfiguration.headingColor,
                            ),
                          ).pOnly(top: 10),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      )
                    : AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                        leadingWidth: 50.w,
                        leading: Icon(
                          Icons.arrow_back_ios,
                          size: 24.sp,
                          color: AppConfiguration.headingColor,
                        ).onTap(
                          () {
                            Navigator.pop(context);
                          },
                        ),
                        actions: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.share,
                              size: 26.sp,
                              color: AppConfiguration.headingColor,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      )),
            body: Container(
              decoration: const BoxDecoration(
                color: AppConfiguration.primaryColor,
              ),
              child: Stack(
                children: [
                  FadeInImage(
                    image: NetworkImage(
                        '${ServiceConfigurations.imagePath}/p/w500/${movieData.backdropPath}'),
                    placeholder: const AssetImage('assets/gallery.png'),
                    fadeInDuration: const Duration(milliseconds: 300),
                    fadeOutDuration: const Duration(milliseconds: 100),
                    fit: BoxFit.cover,
                    imageErrorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      return Image.asset(
                        'assets/gallery.png', // Display placeholder when an error occurs
                        width: 100.w,
                        height: 160.h,
                        fit: BoxFit.contain,
                      );
                    },
                    placeholderFit: BoxFit.contain,
                  ),
                  NestedScrollView(
                    controller: viewmodel.scrollController,
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return [
                        SliverToBoxAdapter(
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Container(
                                    height: 560.h,
                                    alignment: Alignment.topCenter,
                                    foregroundDecoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.transparent,
                                          viewmodel.palette?.darkMutedColor
                                                  ?.color
                                                  .withOpacity(0.9) ??
                                              viewmodel.palette
                                                  ?.darkVibrantColor?.color
                                                  .withOpacity(0.9) ??
                                              Colors.grey.shade500,
                                          viewmodel
                                                  .palette?.darkMutedColor?.color ??
                                              viewmodel.palette
                                                  ?.darkVibrantColor?.color ??
                                              Colors.grey.shade500,
                                          viewmodel
                                                  .palette?.darkMutedColor?.color ??
                                              viewmodel.palette
                                                  ?.darkVibrantColor?.color ??
                                              Colors.grey.shade500,
                                          viewmodel
                                                  .palette?.darkMutedColor?.color ??
                                              viewmodel.palette
                                                  ?.darkVibrantColor?.color ??
                                              Colors.grey.shade500,
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        stops: const [0.2, 0.3, 0.7, 0.85, 1],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: FadeInImage(
                                              width: 130.w,
                                              height: 180.h,
                                              imageErrorBuilder:
                                                  (BuildContext context,
                                                      Object error,
                                                      StackTrace? stackTrace) {
                                                return Image.asset(
                                                  'assets/gallery.png', // Display placeholder when an error occurs
                                                  width: 100.w,
                                                  height: 160.h,
                                                  fit: BoxFit.contain,
                                                );
                                              },
                                              image: NetworkImage(
                                                  '${ServiceConfigurations.imagePath}/p/w500/${movieData.posterPath}'),
                                              placeholder: const AssetImage(
                                                  'assets/gallery.png'),
                                              fadeInDuration: const Duration(
                                                  milliseconds: 300),
                                              fadeOutDuration: const Duration(
                                                  milliseconds: 100),
                                              fit: BoxFit.cover,
                                              placeholderFit: BoxFit.contain,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${movieData.title}',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 3,
                                                  style: TextStyle(
                                                      fontSize: 26.sp,
                                                      height: 1.4,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: AppConfiguration.headingColor),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  '${movieData.tagline}',
                                                  style: TextStyle(
                                                      color: AppConfiguration.headingColor,
                                                      fontSize: 18.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ).pOnly(left: 20, right: 10),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      // Wrap(
                                      //   spacing: 15,
                                      //   runSpacing: 15,
                                      //   children: [
                                      //     Container(
                                      //       decoration: BoxDecoration(
                                      //         color: Colors.grey.shade400,
                                      //         borderRadius:
                                      //             BorderRadius.circular(10),
                                      //       ),
                                      //       padding: const EdgeInsets.all(10),
                                      //       height: 50,
                                      //       child: Text(
                                      //         'TMDB : ${movieData.voteAverage.toStringAsFixed(1)}',
                                      //         style: TextStyle(
                                      //             color: AppConfiguration.headingColor,
                                      //             fontWeight: FontWeight.w400,
                                      //             fontSize: 20.sp),
                                      //       ),
                                      //     ),
                                      //     Container(
                                      //       decoration: BoxDecoration(
                                      //         color: Colors.grey.shade400,
                                      //         borderRadius:
                                      //             BorderRadius.circular(10),
                                      //       ),
                                      //       padding: const EdgeInsets.all(10),
                                      //       height: 50,
                                      //       child: Text(
                                      //         'IMDB : ${movieData.voteAverage.toStringAsFixed(1)}',
                                      //         style: TextStyle(
                                      //             color: AppConfiguration.headingColor,
                                      //             fontWeight: FontWeight.w400,
                                      //             fontSize: 20.sp),
                                      //       ),
                                      //     ),
                                      //     Container(
                                      //       decoration: BoxDecoration(
                                      //         color: Colors.grey.shade400,
                                      //         borderRadius:
                                      //             BorderRadius.circular(10),
                                      //       ),
                                      //       padding: const EdgeInsets.all(10),
                                      //       height: 50,
                                      //       child: Text(
                                      //         'Runtime : ${movieData.runtime} minutes',
                                      //         style: TextStyle(
                                      //             color: AppConfiguration.headingColor,
                                      //             fontWeight: FontWeight.w400,
                                      //             fontSize: 20.sp),
                                      //       ),
                                      //     ),
                                      //     Container(
                                      //       decoration: BoxDecoration(
                                      //         color: Colors.grey.shade400,
                                      //         borderRadius:
                                      //             BorderRadius.circular(10),
                                      //       ),
                                      //       padding: const EdgeInsets.all(10),
                                      //       height: 50,
                                      //       child: Text(
                                      //         'Release Date : ${movieData.releaseDate}',
                                      //         style: TextStyle(
                                      //             color: AppConfiguration.headingColor,
                                      //             fontWeight: FontWeight.w400,
                                      //             fontSize: 20.sp),
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Wrap(
                                        spacing: 20,
                                        runSpacing: 10,
                                        children: List.generate(
                                          movieData.genres.length,
                                          (index) {
                                            return Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: viewmodel.lightenColor(
                                                  viewmodel
                                                          .palette
                                                          ?.darkVibrantColor
                                                          ?.color ??
                                                      AppConfiguration
                                                          .primaryColor,
                                                  0.2,
                                                ),
                                              ),
                                              child: Text(
                                                '${movieData.genres[index].name}',
                                                style: TextStyle(
                                                    color: AppConfiguration.headingColor,
                                                    fontSize: 18.sp,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            );
                                          },
                                        ),
                                      ).pOnly(left: 20, right: 20),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: viewmodel.lightenColor(
                                                viewmodel
                                                        .palette
                                                        ?.darkVibrantColor
                                                        ?.color ??
                                                    AppConfiguration
                                                        .primaryColor,
                                                0.1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: RichText(
                                              text: TextSpan(
                                                style: TextStyle(
                                                  color: AppConfiguration.headingColor,
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                children: [
                                                  const WidgetSpan(
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                        left: 2,
                                                        right: 2,
                                                        bottom: 1,
                                                      ),
                                                      child: Icon(
                                                        Icons.star,
                                                        color: AppConfiguration.headingColor,
                                                        size: 25,
                                                      ),
                                                    ),
                                                  ),
                                                  const TextSpan(
                                                      text: 'Ratings: '),
                                                  TextSpan(
                                                      text:
                                                          '${movieData.voteAverage} '),
                                                ],
                                              ),
                                            ).p(10),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          MaterialButton(
                                            onPressed: () {},
                                            color: viewmodel.lightenColor(
                                              viewmodel
                                                      .palette
                                                      ?.darkVibrantColor
                                                      ?.color ??
                                                  AppConfiguration.primaryColor,
                                              0.1,
                                            ),
                                            padding: const EdgeInsets.all(10),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            height: 30.h,
                                            child: Text(
                                              'Watch Trailer',
                                              style: TextStyle(
                                                color: AppConfiguration.headingColor,
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ).pOnly(
                                        left: 20,
                                        right: 20,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      MaterialButton(
                                        onPressed: () {},
                                        color: AppConfiguration.seeAllColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        height: 50.h,
                                        minWidth:
                                            MediaQuery.of(context).size.width,
                                        child: Text(
                                          'Watch Now',
                                          style: TextStyle(
                                            color: AppConfiguration.headingColor,
                                            fontSize: 24.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ).pOnly(left: 20, right: 20),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ];
                    },
                    body: Column(
                      children: [
                        Expanded(
                          child: DefaultTabController(
                            length: 7,
                            child: Column(
                              children: [
                                Container(
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        viewmodel
                                                .palette?.darkVibrantColor?.color ??
                                            viewmodel.palette?.dominantColor
                                                ?.color ??
                                            Colors.grey.shade500,
                                        AppConfiguration.primaryColor,
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                  child: TabBar(
                                    isScrollable: true,
                                    physics: const BouncingScrollPhysics(),
                                    tabs: const [
                                      Tab(text: 'Overview'),
                                      Tab(text: 'Cast'),
                                      Tab(text: 'Crew'),
                                      Tab(text: 'Videos'),
                                      Tab(text: 'Photos'),
                                      Tab(text: 'Recommendations'),
                                      Tab(text: 'Similar'),
                                    ],
                                    indicatorColor: AppConfiguration.headingColor,
                                    labelColor: AppConfiguration.headingColor,
                                    unselectedLabelColor: AppConfiguration.headingColor,
                                    labelStyle: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    unselectedLabelStyle: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      SingleChildScrollView(
                                        child: Container(
                                          color: AppConfiguration.primaryColor,
                                          padding: const EdgeInsets.only(
                                            top: 20,
                                            bottom: 10,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 10),
                                                padding: const EdgeInsets.only(
                                                  top: 20,
                                                  bottom: 10,
                                                  left: 20,
                                                  right: 10,
                                                ),
                                                decoration: BoxDecoration(
                                                  color:
                                                       AppConfiguration.cardColor,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Table(
                                                  children: [
                                                    TableRow(
                                                      children: [
                                                        Text(
                                                          'Original Title',
                                                          style: TextStyle(
                                                              color:
                                                                  AppConfiguration.headingColor,
                                                              fontSize: 20.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ).pOnly(bottom: 14),
                                                        Text(
                                                          movieData
                                                                  .originalTitle ??
                                                              movieData.title ??
                                                              '',
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 5,
                                                          style: TextStyle(
                                                              color:
                                                                  AppConfiguration.headingColor,
                                                              fontSize: 18.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ).pOnly(bottom: 14),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        Text(
                                                          'Status',
                                                          style: TextStyle(
                                                              color:
                                                                  AppConfiguration.headingColor,
                                                              fontSize: 20.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        Text(
                                                          movieData.status ??
                                                              '',
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 5,
                                                          style: TextStyle(
                                                              color:
                                                                  AppConfiguration.headingColor,
                                                              fontSize: 18.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ).pOnly(bottom: 14),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        Text(
                                                          'Production Companies',
                                                          style: TextStyle(
                                                              color:
                                                                  AppConfiguration.headingColor,
                                                              fontSize: 20.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        ListView.builder(
                                                          itemCount: movieData
                                                              .productionCompanies
                                                              .length,
                                                          shrinkWrap: true,
                                                          padding:
                                                              EdgeInsets.zero,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Text(
                                                              movieData
                                                                      .productionCompanies[
                                                                          index]
                                                                      .name ??
                                                                  '',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 5,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      18.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
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
                                                              color:
                                                                  AppConfiguration.headingColor,
                                                              fontSize: 20.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ).pOnly(bottom: 14),
                                                        Text(
                                                          movieData
                                                                  .originalLanguage ??
                                                              '',
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 5,
                                                          style: TextStyle(
                                                              color:
                                                                  AppConfiguration.headingColor,
                                                              fontSize: 18.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ).pOnly(bottom: 14),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        Text(
                                                          'Budget',
                                                          style: TextStyle(
                                                              color:
                                                                  AppConfiguration.headingColor,
                                                              fontSize: 20.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        Text(
                                                          '\$ ${viewmodel.f.format(movieData.budget)}0',
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 5,
                                                          style: TextStyle(
                                                              color:
                                                                  AppConfiguration.headingColor,
                                                              fontSize: 18.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ).pOnly(bottom: 14),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: [
                                                        Text(
                                                          'Revenue',
                                                          style: TextStyle(
                                                              color:
                                                                  AppConfiguration.headingColor,
                                                              fontSize: 20.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        Text(
                                                          '\$ ${viewmodel.f.format(movieData.revenue)}0',
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 5,
                                                          style: TextStyle(
                                                              color:
                                                                  AppConfiguration.headingColor,
                                                              fontSize: 18.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ).pOnly(bottom: 14),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 10),
                                                padding: const EdgeInsets.only(
                                                  top: 20,
                                                  bottom: 10,
                                                  left: 20,
                                                  right: 20,
                                                ),
                                                decoration: BoxDecoration(
                                                  color:
                                                       AppConfiguration.cardColor,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      movieData.overview ?? '',
                                                      style: TextStyle(
                                                          color: AppConfiguration.headingColor,
                                                          fontSize: 18.sp,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ).pOnly(bottom: 14),
                                                    Table(
                                                      children: [
                                                        TableRow(
                                                          children: [
                                                            Text(
                                                              'Director',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      20.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                            ).pOnly(bottom: 14),
                                                            ListView.builder(
                                                              itemCount:
                                                                  viewmodel
                                                                      .directors
                                                                      .length,
                                                              shrinkWrap: true,
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              itemBuilder:
                                                                  (context,
                                                                      index) {
                                                                return Text(
                                                                  viewmodel
                                                                          .directors[
                                                                              index]
                                                                          .originalName ??
                                                                      viewmodel
                                                                          .directors[
                                                                              index]
                                                                          .name ??
                                                                      '',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          20.sp,
                                                                      height:
                                                                          1.5),
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
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      20.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                            ).pOnly(bottom: 14),
                                                            ListView.builder(
                                                              itemCount: movieData
                                                                  .productionCountries
                                                                  .length,
                                                              shrinkWrap: true,
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              itemBuilder:
                                                                  (context,
                                                                      index) {
                                                                return Text(
                                                                  movieData
                                                                          .productionCountries[
                                                                              index]
                                                                          .name ??
                                                                      '',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          20.sp,
                                                                      height:
                                                                          1.5),
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
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      20.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                            ).pOnly(bottom: 14),
                                                            ListView.builder(
                                                              itemCount: movieData
                                                                  .spokenLanguages
                                                                  .length,
                                                              shrinkWrap: true,
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              itemBuilder:
                                                                  (context,
                                                                      index) {
                                                                return Text(
                                                                  movieData
                                                                          .spokenLanguages[
                                                                              index]
                                                                          .englishName ??
                                                                      movieData
                                                                          .spokenLanguages[
                                                                              index]
                                                                          .name ??
                                                                      '',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          20.sp,
                                                                      height:
                                                                          1.5),
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
                                              Text(
                                                'Cast',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: AppConfiguration.headingColor,
                                                    fontSize: 26.sp,
                                                    fontWeight: FontWeight.bold,
                                                    height: 1.5),
                                              ).pOnly(
                                                left: 20,
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              SizedBox(
                                                height: 340.h,
                                                child: ListView.builder(
                                                  itemCount: viewmodel
                                                      .moviesCreditsData
                                                      .cast
                                                      .length,
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                  ),
                                                  physics:
                                                      const BouncingScrollPhysics(),
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Container(
                                                      width: 180.w,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color:
                                                            AppConfiguration.cardColor,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(15),
                                                        ),
                                                      ),
                                                      height: 310.h,
                                                      child: Column(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            child: FadeInImage(
                                                              width: 180.w,
                                                              height: 230.h,
                                                              imageErrorBuilder:
                                                                  (BuildContext
                                                                          context,
                                                                      Object
                                                                          error,
                                                                      StackTrace?
                                                                          stackTrace) {
                                                                return Image
                                                                    .asset(
                                                                  'assets/gallery.png', // Display placeholder when an error occurs
                                                                  width: 100.w,
                                                                  height: 160.h,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                );
                                                              },
                                                              image: NetworkImage(
                                                                  '${ServiceConfigurations.imagePath}/p/w185/${viewmodel.moviesCreditsData.cast[index].profilePath ?? ''}'),
                                                              placeholder:
                                                                  const AssetImage(
                                                                      'assets/gallery.png'),
                                                              fadeInDuration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          300),
                                                              fadeOutDuration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          100),
                                                              fit: BoxFit.cover,
                                                              placeholderFit:
                                                                  BoxFit
                                                                      .contain,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          SizedBox(
                                                            width: 180.w,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  viewmodel
                                                                          .moviesCreditsData
                                                                          .cast[
                                                                              index]
                                                                          .name ??
                                                                      viewmodel
                                                                          .moviesCreditsData
                                                                          .cast[
                                                                              index]
                                                                          .originalName ??
                                                                      '',
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  maxLines: 2,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ).pOnly(
                                                                    bottom: 5),
                                                                Text(
                                                                  viewmodel
                                                                          .moviesCreditsData
                                                                          .cast[
                                                                              index]
                                                                          .character ??
                                                                      '',
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  maxLines: 2,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white54,
                                                                    fontSize:
                                                                        20.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ).pOnly(
                                                                    bottom: 5),
                                                              ],
                                                            ).p(10),
                                                          ),
                                                        ],
                                                      ),
                                                    ).onTap(() {
                                                      Navigator.push(
                                                        context,
                                                        MoviesDetailsPage(
                                                          movieId: viewmodel
                                                              .moviesCreditsData
                                                              .cast[index]
                                                              .id,
                                                        ).cupertinoRoute(),
                                                      );
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
                                                  itemCount: viewmodel
                                                      .moviesRecommendationsData
                                                      .results
                                                      .length,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  physics:
                                                      const BouncingScrollPhysics(),
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Container(
                                                      width: 180.w,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color:
                                                            AppConfiguration.cardColor,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(15),
                                                        ),
                                                      ),
                                                      height: 310.h,
                                                      child: Column(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            child: FadeInImage(
                                                              width: 180.w,
                                                              imageErrorBuilder:
                                                                  (BuildContext
                                                                          context,
                                                                      Object
                                                                          error,
                                                                      StackTrace?
                                                                          stackTrace) {
                                                                return Image
                                                                    .asset(
                                                                  'assets/gallery.png', // Display placeholder when an error occurs
                                                                  width: 100.w,
                                                                  height: 160.h,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                );
                                                              },
                                                              height: 230.h,
                                                              image: NetworkImage(
                                                                  '${ServiceConfigurations.imagePath}/p/w500/${viewmodel.moviesRecommendationsData.results[index].posterPath ?? ''}'),
                                                              placeholder:
                                                                  const AssetImage(
                                                                      'assets/gallery.png'),
                                                              fadeInDuration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          300),
                                                              fadeOutDuration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          100),
                                                              fit: BoxFit.cover,
                                                              placeholderFit:
                                                                  BoxFit
                                                                      .contain,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          SizedBox(
                                                            width: 180.w,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  viewmodel
                                                                          .moviesRecommendationsData
                                                                          .results[
                                                                              index]
                                                                          .title ??
                                                                      viewmodel
                                                                          .moviesRecommendationsData
                                                                          .results[
                                                                              index]
                                                                          .originalTitle ??
                                                                      '',
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  maxLines: 2,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ).pOnly(
                                                                    bottom: 5),
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
                                                  itemCount: viewmodel
                                                      .moviesSimilarData
                                                      .results
                                                      .length,
                                                  physics:
                                                      const BouncingScrollPhysics(),
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                  ),
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Container(
                                                      width: 180.w,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color:
                                                            AppConfiguration.cardColor,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(15),
                                                        ),
                                                      ),
                                                      height: 310.h,
                                                      child: Column(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            child: FadeInImage(
                                                              width: 180.w,
                                                              height: 230.h,
                                                              imageErrorBuilder:
                                                                  (BuildContext
                                                                          context,
                                                                      Object
                                                                          error,
                                                                      StackTrace?
                                                                          stackTrace) {
                                                                return Image
                                                                    .asset(
                                                                  'assets/gallery.png', // Display placeholder when an error occurs
                                                                  width: 100.w,
                                                                  height: 160.h,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                );
                                                              },
                                                              image: NetworkImage(
                                                                  '${ServiceConfigurations.imagePath}/p/w500/${viewmodel.moviesSimilarData.results[index].posterPath ?? ''}'),
                                                              placeholder:
                                                                  const AssetImage(
                                                                      'assets/gallery.png'),
                                                              fadeInDuration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          300),
                                                              fadeOutDuration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          100),
                                                              placeholderFit:
                                                                  BoxFit
                                                                      .contain,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          SizedBox(
                                                            width: 180.w,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  viewmodel
                                                                          .moviesSimilarData
                                                                          .results[
                                                                              index]
                                                                          .title ??
                                                                      viewmodel
                                                                          .moviesSimilarData
                                                                          .results[
                                                                              index]
                                                                          .originalTitle ??
                                                                      '',
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  maxLines: 2,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ).pOnly(
                                                                    bottom: 5),
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
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                            color:
                                                AppConfiguration.primaryColor),
                                        child: SingleChildScrollView(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          child: GridView.builder(
                                            shrinkWrap: true,
                                            padding: EdgeInsets.zero,
                                            scrollDirection: Axis.vertical,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount:
                                                  2, // You can adjust this value according to your design
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 20,
                                              childAspectRatio: 0.51,
                                            ),
                                            itemCount: viewmodel
                                                .moviesCreditsData.cast.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                width: 160.w,
                                                height: 320.h,
                                                decoration: const BoxDecoration(
                                                  color: AppConfiguration.cardColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(15),
                                                  ),
                                                ),
                                                child: Column(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      child: FadeInImage(
                                                        width: 180.w,
                                                        imageErrorBuilder:
                                                            (BuildContext
                                                                    context,
                                                                Object error,
                                                                StackTrace?
                                                                    stackTrace) {
                                                          return Image.asset(
                                                            'assets/gallery.png', // Display placeholder when an error occurs
                                                            width: 100.w,
                                                            height: 160.h,
                                                            fit: BoxFit.contain,
                                                          );
                                                        },
                                                        height: 230.h,
                                                        image: NetworkImage(
                                                          '${ServiceConfigurations.imagePath}/p/w185/${viewmodel.moviesCreditsData.cast[index].profilePath ?? ''}',
                                                        ),
                                                        placeholder:
                                                            const AssetImage(
                                                                'assets/gallery.png'),
                                                        fadeInDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    300),
                                                        fadeOutDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        placeholderFit:
                                                            BoxFit.contain,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    SizedBox(
                                                      width: 180.w,
                                                      child: Text(
                                                        viewmodel
                                                                .moviesCreditsData
                                                                .cast[index]
                                                                .name ??
                                                            viewmodel
                                                                .moviesCreditsData
                                                                .cast[index]
                                                                .originalName ??
                                                            '',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 3,
                                                        style: TextStyle(
                                                          color: AppConfiguration.headingColor,
                                                          fontSize: 20.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ).pOnly(
                                                        bottom: 5,
                                                        left: 10,
                                                        right: 10,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ).onTap(
                                                () {
                                                  Navigator.push(
                                                    context,
                                                    MoviesDetailsPage(
                                                      movieId: viewmodel
                                                          .moviesCreditsData
                                                          .cast[index]
                                                          .id,
                                                    ).cupertinoRoute(),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                            color:
                                                AppConfiguration.primaryColor),
                                        child: SingleChildScrollView(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          child: GridView.builder(
                                            shrinkWrap: true,
                                            padding: EdgeInsets.zero,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount:
                                                  2, // Number of columns in the grid
                                              crossAxisSpacing:
                                                  10.0, // Spacing between columns
                                              mainAxisSpacing:
                                                  20.0, // Spacing between rows
                                              childAspectRatio: 0.52,
                                            ),
                                            itemCount: viewmodel
                                                .moviesCreditsData.crew.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                width: 160.w,
                                                decoration: const BoxDecoration(
                                                  color: AppConfiguration.cardColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(15),
                                                  ),
                                                ),
                                                child: Column(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      child: FadeInImage(
                                                        width: 180.w,
                                                        height: 230.h,
                                                        imageErrorBuilder:
                                                            (BuildContext
                                                                    context,
                                                                Object error,
                                                                StackTrace?
                                                                    stackTrace) {
                                                          return Image.asset(
                                                            'assets/gallery.png', // Display placeholder when an error occurs
                                                            width: 100.w,
                                                            height: 160.h,
                                                            fit: BoxFit.contain,
                                                          );
                                                        },
                                                        image: NetworkImage(
                                                            '${ServiceConfigurations.imagePath}/p/w185/${viewmodel.moviesCreditsData.crew[index].profilePath ?? ''}'),
                                                        placeholder:
                                                            const AssetImage(
                                                                'assets/gallery.png'),
                                                        fadeInDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    300),
                                                        fadeOutDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        placeholderFit:
                                                            BoxFit.contain,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    SizedBox(
                                                      width: 180.w,
                                                      child: Text(
                                                        viewmodel
                                                                .moviesCreditsData
                                                                .crew[index]
                                                                .name ??
                                                            viewmodel
                                                                .moviesCreditsData
                                                                .crew[index]
                                                                .originalName ??
                                                            '',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 3,
                                                        style: TextStyle(
                                                          color: AppConfiguration.headingColor,
                                                          fontSize: 20.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ).p(10),
                                                    ),
                                                  ],
                                                ).onTap(() {
                                                  Navigator.push(
                                                    context,
                                                    MoviesDetailsPage(
                                                      movieId: viewmodel
                                                          .moviesCreditsData
                                                          .crew[index]
                                                          .id,
                                                    ).cupertinoRoute(),
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          'Dummy Page',
                                          style: TextStyle(
                                              color: AppConfiguration.headingColor,
                                              fontSize: 22.sp),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                            color:
                                                AppConfiguration.primaryColor),
                                        child: SingleChildScrollView(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          child: Column(
                                            children: [
                                              Text(
                                                'BackDrops',
                                                style: TextStyle(
                                                  color: AppConfiguration.headingColor,
                                                  fontSize: 24.sp,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              GridView.builder(
                                                shrinkWrap: true,
                                                padding: EdgeInsets.zero,
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  childAspectRatio: 1.2,
                                                  crossAxisSpacing: 10,
                                                  mainAxisSpacing: 10,
                                                ),
                                                itemCount: viewmodel
                                                    .moviesImageData
                                                    .backdrops
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: AppConfiguration.cardColor,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(15),
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      child: FadeInImage(
                                                        imageErrorBuilder:
                                                            (BuildContext
                                                                    context,
                                                                Object error,
                                                                StackTrace?
                                                                    stackTrace) {
                                                          return Image.asset(
                                                            'assets/gallery.png', // Display placeholder when an error occurs
                                                            width: 100.w,
                                                            height: 160.h,
                                                            fit: BoxFit.contain,
                                                          );
                                                        },
                                                        image: NetworkImage(
                                                            '${ServiceConfigurations.imagePath}/p/w185/${viewmodel.moviesImageData.backdrops[index].filePath ?? ''}'),
                                                        placeholder:
                                                            const AssetImage(
                                                                'assets/gallery.png'),
                                                        fadeInDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    300),
                                                        fadeOutDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        placeholderFit:
                                                            BoxFit.contain,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                'Logos',
                                                style: TextStyle(
                                                  color: AppConfiguration.headingColor,
                                                  fontSize: 24.sp,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              GridView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                padding: EdgeInsets.zero,
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 10,
                                                  mainAxisSpacing: 20,
                                                  childAspectRatio: 1.1,
                                                ),
                                                itemCount: viewmodel
                                                    .moviesImageData
                                                    .logos
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: AppConfiguration.cardColor,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(15),
                                                      ),
                                                    ),
                                                    child: FadeInImage(
                                                      width: 160.w,
                                                      height: 160.h,
                                                      imageErrorBuilder:
                                                          (BuildContext context,
                                                              Object error,
                                                              StackTrace?
                                                                  stackTrace) {
                                                        return Image.asset(
                                                          'assets/gallery.png', // Display placeholder when an error occurs
                                                          width: 100.w,
                                                          height: 160.h,
                                                          fit: BoxFit.contain,
                                                        );
                                                      },
                                                      image: NetworkImage(
                                                          '${ServiceConfigurations.imagePath}/p/w185/${viewmodel.moviesImageData.logos[index].filePath ?? ''}'),
                                                      placeholder: const AssetImage(
                                                          'assets/gallery.png'),
                                                      fadeInDuration:
                                                          const Duration(
                                                              milliseconds:
                                                                  300),
                                                      fadeOutDuration:
                                                          const Duration(
                                                              milliseconds:
                                                                  100),
                                                      placeholderFit:
                                                          BoxFit.contain,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  );
                                                },
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                'Posters',
                                                style: TextStyle(
                                                  color: AppConfiguration.headingColor,
                                                  fontSize: 26.sp,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              GridView.builder(
                                                shrinkWrap: true,
                                                padding: EdgeInsets.zero,
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 10,
                                                  mainAxisSpacing: 20,
                                                  childAspectRatio: 0.7,
                                                ),
                                                itemCount: viewmodel
                                                    .moviesImageData
                                                    .posters
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: AppConfiguration.cardColor,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(15),
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        15,
                                                      ),
                                                      child: FadeInImage(
                                                        width: 160.w,
                                                        height: 160.h,
                                                        imageErrorBuilder:
                                                            (BuildContext
                                                                    context,
                                                                Object error,
                                                                StackTrace?
                                                                    stackTrace) {
                                                          return Image.asset(
                                                            'assets/gallery.png', // Display placeholder when an error occurs
                                                            width: 100.w,
                                                            height: 160.h,
                                                            fit: BoxFit.contain,
                                                          );
                                                        },
                                                        image: NetworkImage(
                                                            '${ServiceConfigurations.imagePath}/p/w185/${viewmodel.moviesImageData.posters[index].filePath ?? ''}'),
                                                        placeholder:
                                                            const AssetImage(
                                                                'assets/gallery.png'),
                                                        fadeInDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    300),
                                                        fadeOutDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        placeholderFit:
                                                            BoxFit.contain,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                            color:
                                                AppConfiguration.primaryColor),
                                        child: SingleChildScrollView(
                                            physics:
                                                const BouncingScrollPhysics(),
                                            child: GridView.builder(
                                              shrinkWrap: true,
                                              padding: EdgeInsets.zero,
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount:
                                                    2, // Maximum width for each item
                                                crossAxisSpacing:
                                                    10, // Spacing between columns
                                                mainAxisSpacing:
                                                    20, // Spacing between rows
                                                childAspectRatio:
                                                    0.51, // Aspect ratio (1.0 for square items)
                                              ),
                                              itemCount: viewmodel
                                                  .moviesRecommendationsData
                                                  .results
                                                  .length,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  width: 160.w,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: AppConfiguration.cardColor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(15),
                                                    ),
                                                  ),
                                                  height: 310.h,
                                                  child: Column(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        child: FadeInImage(
                                                          width: 180.w,
                                                          height: 230.h,
                                                          imageErrorBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  Object error,
                                                                  StackTrace?
                                                                      stackTrace) {
                                                            return Image.asset(
                                                              'assets/gallery.png', // Display placeholder when an error occurs
                                                              width: 100.w,
                                                              height: 160.h,
                                                              fit: BoxFit
                                                                  .contain,
                                                            );
                                                          },
                                                          image: NetworkImage(
                                                              '${ServiceConfigurations.imagePath}/p/w500/${viewmodel.moviesRecommendationsData.results[index].posterPath ?? ''}'),
                                                          placeholder:
                                                              const AssetImage(
                                                                  'assets/gallery.png'),
                                                          fadeInDuration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      300),
                                                          fadeOutDuration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      100),
                                                          fit: BoxFit.cover,
                                                          placeholderFit:
                                                              BoxFit.contain,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      SizedBox(
                                                        width: 180.w,
                                                        child: Text(
                                                          viewmodel
                                                                  .moviesRecommendationsData
                                                                  .results[
                                                                      index]
                                                                  .title ??
                                                              viewmodel
                                                                  .moviesRecommendationsData
                                                                  .results[
                                                                      index]
                                                                  .originalTitle ??
                                                              '',
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 3,
                                                          style: TextStyle(
                                                            color: AppConfiguration.headingColor,
                                                            fontSize: 20.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        )
                                                            .pOnly(bottom: 5)
                                                            .p(10),
                                                      ),
                                                    ],
                                                  ).onTap(
                                                    () {
                                                      Navigator.push(
                                                        context,
                                                        MoviesDetailsPage(
                                                          movieId: viewmodel
                                                              .moviesCreditsData
                                                              .cast[index]
                                                              .id,
                                                        ).cupertinoRoute(),
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                            )),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                            color:
                                                AppConfiguration.primaryColor),
                                        child: SingleChildScrollView(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          child: GridView.builder(
                                            shrinkWrap: true,
                                            padding: EdgeInsets.zero,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount:
                                                  2, // Maximum width for each item
                                              crossAxisSpacing:
                                                  10, // Spacing between columns
                                              mainAxisSpacing:
                                                  20, // Spacing between rows
                                              childAspectRatio:
                                                  0.51, // Aspect ratio (1.0 for square items)
                                            ),
                                            itemCount: viewmodel
                                                .moviesSimilarData
                                                .results
                                                .length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                width: 160.w,
                                                decoration: const BoxDecoration(
                                                  color: AppConfiguration.cardColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(15),
                                                  ),
                                                ),
                                                height: 310.h,
                                                child: Column(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      child: FadeInImage(
                                                        width: 180.w,
                                                        height: 230.h,
                                                        imageErrorBuilder:
                                                            (BuildContext
                                                                    context,
                                                                Object error,
                                                                StackTrace?
                                                                    stackTrace) {
                                                          return Image.asset(
                                                            'assets/gallery.png', // Display placeholder when an error occurs
                                                            width: 100.w,
                                                            height: 160.h,
                                                            fit: BoxFit.contain,
                                                          );
                                                        },
                                                        image: NetworkImage(
                                                            '${ServiceConfigurations.imagePath}/p/w500/${viewmodel.moviesSimilarData.results[index].posterPath ?? ''}'),
                                                        placeholder:
                                                            const AssetImage(
                                                                'assets/gallery.png'),
                                                        fadeInDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    300),
                                                        fadeOutDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                        fit: BoxFit.cover,
                                                        placeholderFit:
                                                            BoxFit.contain,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    SizedBox(
                                                      width: 180.w,
                                                      child: Text(
                                                        viewmodel
                                                                .moviesSimilarData
                                                                .results[index]
                                                                .title ??
                                                            viewmodel
                                                                .moviesSimilarData
                                                                .results[index]
                                                                .originalTitle ??
                                                            '',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 3,
                                                        style: TextStyle(
                                                          color: AppConfiguration.headingColor,
                                                          fontSize: 20.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ).pOnly(bottom: 5).p(10),
                                                    ),
                                                  ],
                                                ).onTap(
                                                  () {
                                                    Navigator.push(
                                                      context,
                                                      MoviesDetailsPage(
                                                        movieId: viewmodel
                                                            .moviesCreditsData
                                                            .cast[index]
                                                            .id,
                                                      ).cupertinoRoute(),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
