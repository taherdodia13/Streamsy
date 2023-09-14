import 'package:anime_app/services/service_configuration.dart';
import 'package:anime_app/view/tabbar_pages/movies_cast.dart';
import 'package:anime_app/view/tabbar_pages/movies_crew.dart';
import 'package:anime_app/view/tabbar_pages/movies_overview.dart';
import 'package:anime_app/view/tabbar_pages/movies_photos.dart';
import 'package:anime_app/view/tabbar_pages/movies_recommendations.dart';
import 'package:anime_app/view/tabbar_pages/movies_similar.dart';
import 'package:anime_app/view/widgets/details_genre_widget.dart';
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
                                                      color: AppConfiguration
                                                          .headingColor),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  '${movieData.tagline}',
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
                                      ).pOnly(left: 20, right: 10),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      GenresWrapList(
                                        data: movieData,
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
                                      MoviesOverViewPage(viewmodel: viewmodel),
                                      MoviesCastPage(
                                        viewmodel: viewmodel,
                                      ),
                                      MoviesCrewPage(viewmodel: viewmodel),
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
                                      MoviesPhotosPage(viewmodel: viewmodel),
                                      MoviesRecommendationsPage(
                                          viewmodel: viewmodel),
                                      MoviesSimilarPage(viewmodel: viewmodel),
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
