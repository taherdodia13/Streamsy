import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../configurations/app_configurations.dart';
import '../services/service_configuration.dart';
import '../viewmodel/tvseries_viewmodel.dart';

class TVSeries extends StatefulWidget {
  final int seriesId;
  const TVSeries({super.key, required this.seriesId});

  TVSeriesViewmodel viewmodel() => GetIt.instance.get<TVSeriesViewmodel>();

  @override
  State<TVSeries> createState() => _TVSeriesState();
}

class _TVSeriesState extends State<TVSeries> {
  @override
  void initState() {
    widget.viewmodel().oninit(widget.seriesId);
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
    return ChangeNotifierProvider<TVSeriesViewmodel>.value(
      value: widget.viewmodel(),
      child: Consumer<TVSeriesViewmodel>(builder: (context, viewmodel, child) {
        var tvSeriesData = viewmodel.tvSeriesDetailsData;
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
                        viewmodel.tvSeriesDetailsData.name ?? '',
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
                    ),
            ),
            body: Container(
              decoration: const BoxDecoration(
                color: AppConfiguration.primaryColor,
              ),
              child: Stack(
                children: [
                  FadeInImage(
                    imageErrorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      return Image.asset(
                        'assets/gallery.png', // Display placeholder when an error occurs
                        width: 100.w,
                        height: 160.h,
                        fit: BoxFit.contain,
                      );
                    },
                    image: NetworkImage(
                        '${ServiceConfigurations.imagePath}/p/w500/${viewmodel.tvSeriesDetailsData.backdropPath}'),
                    placeholder: const AssetImage('assets/gallery.png'),
                    fadeInDuration: const Duration(milliseconds: 300),
                    fadeOutDuration: const Duration(milliseconds: 100),
                    fit: BoxFit.cover,
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
                                    height: 600.h,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                  '${ServiceConfigurations.imagePath}/p/w500/${viewmodel.tvSeriesDetailsData.posterPath}'),
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
                                                  tvSeriesData.name ??
                                                      tvSeriesData
                                                          .originalName ??
                                                      '',
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
                                                  '${tvSeriesData.tagline}',
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
                                      ).pOnly(
                                        left: 20,
                                        right: 10,
                                      ),
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
                                      //         'TMDB : ${tvSeriesData.voteAverage.toStringAsFixed(1)}',
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
                                      //         'IMDB : ${tvSeriesData.voteAverage.toStringAsFixed(1)}',
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
                                      //         'Runtime : ${tvSeriesData.episodeRunTime} minutes',
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
                                      //         'Release Date : ${tvSeriesData.firstAirDate}',
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
                                        alignment: WrapAlignment.start,
                                        runAlignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        children: List.generate(
                                          tvSeriesData.genres.length,
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
                                                '${tvSeriesData.genres[index].name}',
                                                style: TextStyle(
                                                    color: AppConfiguration.headingColor,
                                                    fontSize: 18.sp,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            );
                                          },
                                        ),
                                      ).pOnly(
                                        left: 15,
                                        right: 15,
                                      ),
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
                                                          '${viewmodel.tvSeriesDetailsData.voteAverage} '),
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
                                                          'Status',
                                                          style: TextStyle(
                                                              color:
                                                                  AppConfiguration.headingColor,
                                                              fontSize: 20.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ).pOnly(bottom: 14),
                                                        Text(
                                                          tvSeriesData.status ??
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
                                                          'Network',
                                                          style: TextStyle(
                                                              color:
                                                                  AppConfiguration.headingColor,
                                                              fontSize: 20.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ).pOnly(bottom: 14),
                                                        ListView.builder(
                                                          itemCount:
                                                              tvSeriesData
                                                                  .networks
                                                                  .length,
                                                          shrinkWrap: true,
                                                          padding:
                                                              EdgeInsets.zero,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Text(
                                                              tvSeriesData
                                                                      .networks[
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
                                                          tvSeriesData
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
                                                          'Type',
                                                          style: TextStyle(
                                                              color:
                                                                  AppConfiguration.headingColor,
                                                              fontSize: 20.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ).pOnly(bottom: 14),
                                                        Text(
                                                          '${tvSeriesData.type}',
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
                                                      tvSeriesData.overview ??
                                                          '',
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
                                                              'Creators',
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
                                                                      .creators
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
                                                                          .creators[
                                                                              index]
                                                                          .originalName ??
                                                                      viewmodel
                                                                          .creators[
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
                                                              'Production Companies',
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
                                                                  tvSeriesData
                                                                      .productionCompanies
                                                                      .length,
                                                              shrinkWrap: true,
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              itemBuilder:
                                                                  (context,
                                                                      index) {
                                                                return Text(
                                                                  tvSeriesData
                                                                          .productionCompanies[
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
                                                              itemCount:
                                                                  tvSeriesData
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
                                                                  tvSeriesData
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
                                                              itemCount:
                                                                  tvSeriesData
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
                                                                  tvSeriesData
                                                                          .spokenLanguages[
                                                                              index]
                                                                          .englishName ??
                                                                      tvSeriesData
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
                                                  itemCount: viewmodel
                                                      .tvSeriesAggregateCreditsData
                                                      .cast
                                                      .length,
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
                                                      height: 300.h,
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
                                                                  '${ServiceConfigurations.imagePath}/p/w185/${viewmodel.tvSeriesAggregateCreditsData.cast[index].profilePath ?? ''}'),
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
                                                            child: Text(
                                                              viewmodel
                                                                      .tvSeriesAggregateCreditsData
                                                                      .cast[
                                                                          index]
                                                                      .name ??
                                                                  viewmodel
                                                                      .tvSeriesAggregateCreditsData
                                                                      .cast[
                                                                          index]
                                                                      .originalName ??
                                                                  '',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 2,
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ).p(10),
                                                          ),
                                                        ],
                                                      ),
                                                    ).onTap(() {
                                                      // Navigator.push(
                                                      // context,
                                                      // MoviesDetailsPage(
                                                      //   movieId: viewmodel
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
                                                  itemCount: viewmodel
                                                      .tvSeriesDetailsData
                                                      .seasons
                                                      .length,
                                                  physics:
                                                      const BouncingScrollPhysics(),
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
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
                                                                  '${ServiceConfigurations.imagePath}/p/w500/${viewmodel.tvSeriesDetailsData.seasons[index].posterPath ?? ''}'),
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
                                                                          .tvSeriesDetailsData
                                                                          .seasons[
                                                                              index]
                                                                          .name ??
                                                                      viewmodel
                                                                          .tvSeriesRecommendationsData
                                                                          .results[
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
                                                              ],
                                                            ).p(10),
                                                          ),
                                                        ],
                                                      ),
                                                    ).onTap(() {
                                                      // Navigator.push(
                                                      //   context,
                                                      // MoviesDetailsPage(
                                                      //   movieId: viewmodel
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
                                                  itemCount: viewmodel
                                                      .tvSeriesRecommendationsData
                                                      .results
                                                      .length,
                                                  physics:
                                                      const BouncingScrollPhysics(),
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
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
                                                                  '${ServiceConfigurations.imagePath}/p/w500/${viewmodel.tvSeriesRecommendationsData.results[index].posterPath ?? ''}'),
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
                                                                          .tvSeriesRecommendationsData
                                                                          .results[
                                                                              index]
                                                                          .name ??
                                                                      viewmodel
                                                                          .tvSeriesRecommendationsData
                                                                          .results[
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
                                                              ],
                                                            ).p(10),
                                                          ),
                                                        ],
                                                      ),
                                                    ).onTap(() {
                                                      // Navigator.push(
                                                      //   context,
                                                      // MoviesDetailsPage(
                                                      //   movieId: viewmodel
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
                                                  itemCount: viewmodel
                                                      .tvSeriesSimilarData
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
                                                                  '${ServiceConfigurations.imagePath}/p/w500/${viewmodel.tvSeriesSimilarData.results[index].posterPath ?? ''}'),
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
                                                                          .tvSeriesSimilarData
                                                                          .results[
                                                                              index]
                                                                          .name ??
                                                                      viewmodel
                                                                          .tvSeriesSimilarData
                                                                          .results[
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
                                                .tvSeriesAggregateCreditsData
                                                .cast
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
                                                            '${ServiceConfigurations.imagePath}/p/w185/${viewmodel.tvSeriesAggregateCreditsData.cast[index].profilePath ?? ''}'),
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
                                                                .tvSeriesAggregateCreditsData
                                                                .cast[index]
                                                                .name ??
                                                            viewmodel
                                                                .tvSeriesAggregateCreditsData
                                                                .cast[index]
                                                                .originalName ??
                                                            '',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                          color: AppConfiguration.headingColor,
                                                          fontSize: 20.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ).p(10),
                                                    ),
                                                  ],
                                                ),
                                              ).onTap(
                                                () {
                                                  // Navigator.push(
                                                  //   context,
                                                  //   MoviesDetailsPage(
                                                  //     movieId: viewmodel.tvSeriesAggregateCreditsData.cast[index].id,
                                                  //   ).cupertinoRoute(),
                                                  // );
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
                                            scrollDirection: Axis.vertical,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount:
                                                  2, // You can adjust this value according to your design
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 20,
                                              childAspectRatio:
                                                  0.52, // Set the childAspectRatio to 0.52
                                            ),
                                            itemCount: viewmodel
                                                .tvSeriesAggregateCreditsData
                                                .crew
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
                                                        placeholderFit:
                                                            BoxFit.contain,
                                                        image: NetworkImage(
                                                            '${ServiceConfigurations.imagePath}/p/w185/${viewmodel.tvSeriesAggregateCreditsData.crew[index].profilePath ?? ''}'),
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
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    SizedBox(
                                                      width: 180.w,
                                                      child: Text(
                                                        viewmodel
                                                                .tvSeriesAggregateCreditsData
                                                                .crew[index]
                                                                .name ??
                                                            viewmodel
                                                                .tvSeriesAggregateCreditsData
                                                                .crew[index]
                                                                .originalName ??
                                                            '',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                          color: AppConfiguration.headingColor,
                                                          fontSize: 20.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ).p(10),
                                                    ),
                                                  ],
                                                ),
                                              ).onTap(
                                                () {
                                                  // Navigator.push(
                                                  //   context,
                                                  //   MoviesDetailsPage(
                                                  //     movieId: viewmodel.tvSeriesAggregateCreditsData.crew[index].id,
                                                  //   ).cupertinoRoute(),
                                                  // );
                                                },
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
                                                scrollDirection: Axis.vertical,
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount:
                                                      2, // You can adjust this value according to your design
                                                  crossAxisSpacing: 10,
                                                  mainAxisSpacing: 20,
                                                  childAspectRatio:
                                                      1.2, // Set the childAspectRatio to 1.2
                                                ),
                                                itemCount: viewmodel
                                                    .tvSeriesImageData
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
                                                    child: FadeInImage(
                                                      width: 160.w,
                                                      height: 160.h,
                                                      imageErrorBuilder:
                                                          (BuildContext context,
                                                              Object error,
                                                              StackTrace?
                                                                  stackTrace) {
                                                        return Image.asset(
                                                          'assets/gallery.png', // Display a placeholder when an error occurs
                                                          width: 100.w,
                                                          height: 160.h,
                                                          fit: BoxFit.contain,
                                                        );
                                                      },
                                                      placeholderFit:
                                                          BoxFit.contain,
                                                      image: NetworkImage(
                                                          '${ServiceConfigurations.imagePath}/p/w185/${viewmodel.tvSeriesImageData.backdrops[index].filePath ?? ''}'),
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
                                                      fit: BoxFit.cover,
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
                                                  childAspectRatio:
                                                      1.1, // Set the childAspectRatio to 1.1
                                                ),
                                                itemCount: viewmodel
                                                    .tvSeriesImageData
                                                    .logos
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                    // width: 160.w,
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
                                                          'assets/gallery.png', // Display a placeholder when an error occurs
                                                          width: 100.w,
                                                          height: 160.h,
                                                          fit: BoxFit.contain,
                                                        );
                                                      },
                                                      placeholderFit:
                                                          BoxFit.contain,
                                                      image: NetworkImage(
                                                          '${ServiceConfigurations.imagePath}/p/w185/${viewmodel.tvSeriesImageData.logos[index].filePath ?? ''}'),
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
                                                      fit: BoxFit.cover,
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
                                                scrollDirection: Axis.vertical,
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount:
                                                      2, // You can adjust this value according to your design
                                                  crossAxisSpacing: 10,
                                                  mainAxisSpacing: 20,
                                                  childAspectRatio:
                                                      0.7, // Set the childAspectRatio to 0.7
                                                ),
                                                itemCount: viewmodel
                                                    .tvSeriesImageData
                                                    .posters
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                    // width: 160.w,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: AppConfiguration.cardColor,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(15),
                                                      ),
                                                    ),
                                                    child: FadeInImage(
                                                      width: 180.w,
                                                      height: 230.h,
                                                      imageErrorBuilder:
                                                          (BuildContext context,
                                                              Object error,
                                                              StackTrace?
                                                                  stackTrace) {
                                                        return Image.asset(
                                                          'assets/gallery.png', // Display a placeholder when an error occurs
                                                          width: 100.w,
                                                          height: 160.h,
                                                          fit: BoxFit.contain,
                                                        );
                                                      },
                                                      placeholderFit:
                                                          BoxFit.contain,
                                                      image: NetworkImage(
                                                          '${ServiceConfigurations.imagePath}/p/w185/${viewmodel.tvSeriesImageData.posters[index].filePath ?? ''}'),
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
                                                      fit: BoxFit.cover,
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
                                            scrollDirection: Axis.vertical,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount:
                                                  2, // You can adjust this value according to your design
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 20,
                                              childAspectRatio:
                                                  0.51, // Set the childAspectRatio to 0.51
                                            ),
                                            itemCount: viewmodel
                                                .tvSeriesRecommendationsData
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
                                                        placeholderFit:
                                                            BoxFit.contain,
                                                        image: NetworkImage(
                                                            '${ServiceConfigurations.imagePath}/p/w500/${viewmodel.tvSeriesRecommendationsData.results[index].posterPath ?? ''}'),
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
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    SizedBox(
                                                      width: 180.w,
                                                      child: Text(
                                                        viewmodel
                                                                .tvSeriesRecommendationsData
                                                                .results[index]
                                                                .name ??
                                                            viewmodel
                                                                .tvSeriesRecommendationsData
                                                                .results[index]
                                                                .originalName ??
                                                            '',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                          color: AppConfiguration.headingColor,
                                                          fontSize: 20.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ).p(10),
                                                    ),
                                                  ],
                                                ),
                                              ).onTap(
                                                () {
                                                  // Navigator.push(
                                                  //   context,
                                                  //   MoviesDetailsPage(
                                                  //     movieId: viewmodel.tvSeriesAggregateCreditsData.cast[index].id,
                                                  //   ).cupertinoRoute(),
                                                  // );
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
                                            scrollDirection: Axis.vertical,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount:
                                                  2, // You can adjust this value according to your design
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 20,
                                              childAspectRatio:
                                                  0.51, // Set the childAspectRatio to 0.51
                                            ),
                                            itemCount: viewmodel
                                                .tvSeriesSimilarData
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
                                                        placeholderFit:
                                                            BoxFit.contain,
                                                        image: NetworkImage(
                                                            '${ServiceConfigurations.imagePath}/p/w500/${viewmodel.tvSeriesSimilarData.results[index].posterPath ?? ''}'),
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
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    SizedBox(
                                                      width: 180.w,
                                                      child: Text(
                                                        viewmodel
                                                                .tvSeriesSimilarData
                                                                .results[index]
                                                                .name ??
                                                            viewmodel
                                                                .tvSeriesSimilarData
                                                                .results[index]
                                                                .originalName ??
                                                            '',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                          color: AppConfiguration.headingColor,
                                                          fontSize: 20.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ).p(10),
                                                    ),
                                                  ],
                                                ),
                                              ).onTap(
                                                () {
                                                  // Navigator.push(
                                                  //   context,
                                                  //   MoviesDetailsPage(
                                                  //     movieId: viewmodel.tvSeriesAggregateCreditsData.cast[index].id,
                                                  //   ).cupertinoRoute(),
                                                  // );
                                                },
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
