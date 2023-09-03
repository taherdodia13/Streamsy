import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../configurations/app_configurations.dart';
import '../viewmodel/anime_details_viewmodel.dart';

class AnimeDetailPage extends StatefulWidget {
  final String animeid;
  const AnimeDetailPage({super.key, required this.animeid});
  AnimeDetailsViewmodel viewmodel() =>
      GetIt.instance.get<AnimeDetailsViewmodel>();

  @override
  State<AnimeDetailPage> createState() => _AnimeDetailPageState();
}

class _AnimeDetailPageState extends State<AnimeDetailPage> {
  @override
  void initState() {
    widget.viewmodel().oninit(widget.animeid);
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
    return ChangeNotifierProvider<AnimeDetailsViewmodel>.value(
      value: widget.viewmodel(),
      child:
          Consumer<AnimeDetailsViewmodel>(builder: (context, viewmodel, child) {
        var animeDetailsData = viewmodel.animeDetailsData;
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
                        animeDetailsData.title?.english ??
                            animeDetailsData.title?.native ??
                            animeDetailsData.title?.romaji ??
                            '',
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
                    image: NetworkImage('${animeDetailsData.cover}'),
                    placeholder: const AssetImage('assets/gallery.png'),
                    fadeInDuration: const Duration(milliseconds: 300),
                    fadeOutDuration: const Duration(milliseconds: 100),
                    fit: BoxFit.cover,
                    // width: 100.w,
                    height: 190.h,
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
                                                  '${animeDetailsData.image}'),
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
                                            child: Text(
                                              animeDetailsData.title?.english ??
                                                  animeDetailsData
                                                      .title?.native ??
                                                  animeDetailsData
                                                      .title?.romaji ??
                                                  '',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 3,
                                              style: TextStyle(
                                                  fontSize: 26.sp,
                                                  height: 1.4,
                                                  fontWeight: FontWeight.w700,
                                                  color: AppConfiguration.headingColor),
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
                                          animeDetailsData.genres.length,
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
                                                animeDetailsData.genres[index],
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
                                                          '${animeDetailsData.rating} '),
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
                                      Tab(text: 'Episodes'),
                                      Tab(text: 'Characters'),
                                      Tab(text: 'Staff'),
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
                                                      viewmodel.removeHtmlTags(
                                                          animeDetailsData
                                                                  .description ??
                                                              ''),
                                                      style: TextStyle(
                                                          color: AppConfiguration.headingColor,
                                                          fontSize: 18.sp,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ).pOnly(bottom: 14),
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
                                                          'Episodes',
                                                          style: TextStyle(
                                                              color:
                                                                  AppConfiguration.headingColor,
                                                              fontSize: 20.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ).pOnly(bottom: 14),
                                                        Text(
                                                          animeDetailsData
                                                              .totalEpisodes
                                                              .toString(),
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
                                                          'Episodes Duration',
                                                          style: TextStyle(
                                                              color:
                                                                  AppConfiguration.headingColor,
                                                              fontSize: 20.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ).pOnly(bottom: 14),
                                                        Text(
                                                          animeDetailsData
                                                              .duration
                                                              .toString(),
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
                                                        ).pOnly(bottom: 14),
                                                        Text(
                                                          animeDetailsData
                                                                  .status ??
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
                                                          'Start Date',
                                                          style: TextStyle(
                                                              color:
                                                                  AppConfiguration.headingColor,
                                                              fontSize: 20.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ).pOnly(bottom: 14),
                                                        Text(
                                                          "${animeDetailsData.startDate?.day ?? ''}/${animeDetailsData.startDate?.month ?? ''}/${animeDetailsData.startDate?.year ?? ''}",
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
                                                          'End Date',
                                                          style: TextStyle(
                                                              color:
                                                                  AppConfiguration.headingColor,
                                                              fontSize: 20.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ).pOnly(bottom: 14),
                                                        Text(
                                                          "${animeDetailsData.endDate?.day ?? ''}/${animeDetailsData.endDate?.month ?? ''}/${animeDetailsData.endDate?.year ?? ''}",
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
                                                          'Country of Origin',
                                                          style: TextStyle(
                                                              color:
                                                                  AppConfiguration.headingColor,
                                                              fontSize: 20.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ).pOnly(bottom: 14),
                                                        Text(
                                                          animeDetailsData
                                                                  .countryOfOrigin ??
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
                                                          'Popularity',
                                                          style: TextStyle(
                                                              color:
                                                                  AppConfiguration.headingColor,
                                                              fontSize: 20.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ).pOnly(bottom: 14),
                                                        Text(
                                                          "${animeDetailsData.popularity}",
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
                                                          'Studios',
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
                                                              animeDetailsData
                                                                  .studios
                                                                  .length,
                                                          shrinkWrap: true,
                                                          padding:
                                                              EdgeInsets.zero,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Text(
                                                              animeDetailsData
                                                                      .studios[
                                                                  index],
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
                                                          'Synonyms',
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
                                                              animeDetailsData
                                                                  .synonyms
                                                                  .length,
                                                          shrinkWrap: true,
                                                          padding:
                                                              EdgeInsets.zero,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Text(
                                                              animeDetailsData
                                                                      .synonyms[
                                                                  index],
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
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                'Relations',
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
                                                height: 310.h,
                                                child: ListView.builder(
                                                  itemCount: animeDetailsData
                                                      .relations.length,
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
                                                                  animeDetailsData
                                                                          .relations[
                                                                              index]
                                                                          .image ??
                                                                      ''),
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
                                                              animeDetailsData
                                                                      .relations[
                                                                          index]
                                                                      .title
                                                                      ?.english ??
                                                                  animeDetailsData
                                                                      .relations[
                                                                          index]
                                                                      .title
                                                                      ?.native ??
                                                                  animeDetailsData
                                                                      .relations[
                                                                          index]
                                                                      .title
                                                                      ?.romaji ??
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
                                                'Characters',
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
                                                  itemCount: animeDetailsData
                                                      .characters.length,
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
                                                                  '${animeDetailsData.characters[index].image}'),
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
                                                                  animeDetailsData
                                                                          .characters[
                                                                              index]
                                                                          .name
                                                                          ?.full ??
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
                                                  itemCount: animeDetailsData
                                                      .recommendations.length,
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
                                                                  '${animeDetailsData.recommendations[index].image}'),
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
                                                                  animeDetailsData.recommendations[index].title?.english ??
                                                                      animeDetailsData
                                                                          .recommendations[
                                                                              index]
                                                                          .title
                                                                          ?.native ??
                                                                      animeDetailsData
                                                                          .recommendations[
                                                                              index]
                                                                          .title
                                                                          ?.romaji ??
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
                                              childAspectRatio: 0.40,
                                            ),
                                            itemCount: animeDetailsData
                                                .episodes.length,
                                            itemBuilder: (context, index) {
                                              final reversedIndex =
                                                  animeDetailsData
                                                          .episodes.length -
                                                      1 -
                                                      index;

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
                                                            '${animeDetailsData.episodes[reversedIndex].image}'),
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
                                                        'Episode ${animeDetailsData.episodes[reversedIndex].number}',
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
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    SizedBox(
                                                      width: 180.w,
                                                      child: Text(
                                                        animeDetailsData
                                                                .episodes[
                                                                    reversedIndex]
                                                                .title ??
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
                                            itemCount: animeDetailsData
                                                .characters.length,
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
                                                            '${animeDetailsData.characters[index].image}'),
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
                                                        animeDetailsData
                                                                .characters[
                                                                    index]
                                                                .name
                                                                ?.full ??
                                                            animeDetailsData
                                                                .characters[
                                                                    index]
                                                                .name
                                                                ?.userPreferred ??
                                                            animeDetailsData
                                                                .characters[
                                                                    index]
                                                                .name
                                                                ?.first ??
                                                            animeDetailsData
                                                                .characters[
                                                                    index]
                                                                .name
                                                                ?.last ??
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
                                            itemCount: animeDetailsData
                                                .characters.length,
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
                                                            '${animeDetailsData.characters[index].voiceActors[0].image}'),
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
                                                        animeDetailsData
                                                                .characters[
                                                                    index]
                                                                .voiceActors[0]
                                                                .name
                                                                ?.full ??
                                                            animeDetailsData
                                                                .characters[
                                                                    index]
                                                                .voiceActors[0]
                                                                .name
                                                                ?.userPreferred ??
                                                            animeDetailsData
                                                                .characters[
                                                                    index]
                                                                .voiceActors[0]
                                                                .name
                                                                ?.first ??
                                                            animeDetailsData
                                                                .characters[
                                                                    index]
                                                                .voiceActors[0]
                                                                .name
                                                                ?.last ??
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
