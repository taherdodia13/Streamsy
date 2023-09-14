import 'package:anime_app/view/tabbar_pages/tv_series_cast.dart';
import 'package:anime_app/view/tabbar_pages/tv_series_crew.dart';
import 'package:anime_app/view/tabbar_pages/tv_series_overview_page.dart';
import 'package:anime_app/view/tabbar_pages/tv_series_photos.dart';
import 'package:anime_app/view/tabbar_pages/tv_series_recommendations.dart';
import 'package:anime_app/view/tabbar_pages/tv_series_similar.dart';
import 'package:anime_app/view/widgets/details_genre_widget.dart';
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
                                                      color: AppConfiguration
                                                          .headingColor),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  '${tvSeriesData.tagline}',
                                                  style: TextStyle(
                                                      color: AppConfiguration
                                                          .headingColor,
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
                                        height: 20,
                                      ),
                                      GenresWrapList(
                                        data: tvSeriesData,
                                        viewmodel: viewmodel,
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
                                                  color: AppConfiguration
                                                      .headingColor,
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
                                                        color: AppConfiguration
                                                            .headingColor,
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
                                                color: AppConfiguration
                                                    .headingColor,
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
                                            color:
                                                AppConfiguration.headingColor,
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
                                    indicatorColor:
                                        AppConfiguration.headingColor,
                                    labelColor: AppConfiguration.headingColor,
                                    unselectedLabelColor:
                                        AppConfiguration.headingColor,
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
                                      TVSeriesOverViewPage(
                                          viewmodel: viewmodel,
                                          data: tvSeriesData),
                                      TVSeriesCastPage(viewmodel: viewmodel),
                                      TVSeriesCrewPage(viewmodel: viewmodel),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          'Dummy Page',
                                          style: TextStyle(
                                              color:
                                                  AppConfiguration.headingColor,
                                              fontSize: 22.sp),
                                        ),
                                      ),
                                      TVSeriesPhotosPage(viewmodel: viewmodel),
                                      TVSeriesRecommendationPage(
                                          viewmodel: viewmodel),
                                      TVSeriesSimilarPage(viewmodel: viewmodel),
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
