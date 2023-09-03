import 'package:anime_app/configurations/app_configurations.dart';
import 'package:anime_app/services/service_configuration.dart';
import 'package:anime_app/view/anime_details_page.dart';
import 'package:anime_app/view/movies_details_page.dart';
import 'package:anime_app/view/peoples_info_page.dart';
import 'package:anime_app/view/tv_series.dart';
import 'package:anime_app/view/widgets/dashboard_slider.dart';
import 'package:anime_app/view/widgets/heading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../viewmodel/dashboard_viewmodel.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  DashboardViewModel viewmodel() => GetIt.instance.get<DashboardViewModel>();

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    widget.viewmodel().oninit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return ChangeNotifierProvider<DashboardViewModel>.value(
      value: widget.viewmodel(),
      child: Consumer<DashboardViewModel>(
        builder: (context, viewmodel, child) {
          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                color: AppConfiguration.primaryColor,
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60.h,
                    ),
                    DashboardSlider(
                      viewmodel: viewmodel,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HeadingRow(
                          heading: 'Popular Movies',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 310.h,
                          child: ListView.builder(
                            itemCount: viewmodel.popularMovieList.length,
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
                                        imageErrorBuilder:
                                            (BuildContext context, Object error,
                                                StackTrace? stackTrace) {
                                          return Image.asset(
                                            'assets/gallery.png', // Display placeholder when an error occurs
                                            width: 100.w,
                                            height: 160.h,
                                            fit: BoxFit.contain,
                                          );
                                        },
                                        image: NetworkImage(
                                          '${ServiceConfigurations.imagePath}/p/w500/${viewmodel.popularMovieList[index].posterPath ?? ''}',
                                        ),
                                        placeholder: const AssetImage(
                                            'assets/gallery.png'),
                                        fadeInDuration:
                                            const Duration(milliseconds: 300),
                                        fadeOutDuration:
                                            const Duration(milliseconds: 100),
                                        fit: BoxFit.cover,
                                        placeholderFit: BoxFit.contain,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: 180.w,
                                      child: Text(
                                        viewmodel.popularMovieList[index]
                                                .title ??
                                            viewmodel.popularMovieList[index]
                                                .originalTitle ??
                                            '',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: AppConfiguration.headingColor,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ).p(10),
                                    ),
                                  ],
                                ),
                              ).onTap(() {
                                Navigator.push(
                                  context,
                                  MoviesDetailsPage(
                                    movieId:
                                        viewmodel.popularMovieList[index].id,
                                  ).cupertinoRoute(),
                                );
                              }).pSymmetric(h: 10);
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const HeadingRow(
                          heading: 'Popular TV SHows',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 310.h,
                          child: ListView.builder(
                            itemCount: viewmodel.popularTVShowsList.length,
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
                                        image: NetworkImage(
                                          '${ServiceConfigurations.imagePath}/p/w500/${viewmodel.popularTVShowsList[index].posterPath ?? ''}',
                                        ),
                                        width: 180.w,
                                        imageErrorBuilder:
                                            (BuildContext context, Object error,
                                                StackTrace? stackTrace) {
                                          return Image.asset(
                                            'assets/gallery.png', // Display placeholder when an error occurs
                                            width: 100.w,
                                            height: 160.h,
                                            fit: BoxFit.contain,
                                          );
                                        },
                                        height: 230.h,
                                        placeholder: const AssetImage(
                                            'assets/gallery.png'),
                                        fadeInDuration:
                                            const Duration(milliseconds: 300),
                                        fadeOutDuration:
                                            const Duration(milliseconds: 100),
                                        fit: BoxFit.cover,
                                        placeholderFit: BoxFit.contain,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: 180.w,
                                      child: Text(
                                        viewmodel.popularTVShowsList[index]
                                                .name ??
                                            viewmodel.popularTVShowsList[index]
                                                .originalName ??
                                            '',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: AppConfiguration.headingColor,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ).p(10),
                                    ),
                                  ],
                                ),
                              ).onTap(() {
                                Navigator.push(
                                  context,
                                  TVSeries(
                                    seriesId:
                                        viewmodel.popularTVShowsList[index].id,
                                  ).cupertinoRoute(),
                                );
                              }).pSymmetric(h: 10);
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const HeadingRow(
                          heading: 'Popular Animes',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 310.h,
                          child: ListView.builder(
                            itemCount: viewmodel.animePopularDataList.length,
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
                                        imageErrorBuilder:
                                            (BuildContext context, Object error,
                                                StackTrace? stackTrace) {
                                          return Image.asset(
                                            'assets/gallery.png', // Display placeholder when an error occurs
                                            width: 100.w,
                                            height: 160.h,
                                            fit: BoxFit.contain,
                                          );
                                        },
                                        image: NetworkImage(viewmodel
                                                .animePopularDataList[index]
                                                .image ??
                                            ''),
                                        placeholder: const AssetImage(
                                            'assets/gallery.png'),
                                        fadeInDuration:
                                            const Duration(milliseconds: 300),
                                        fadeOutDuration:
                                            const Duration(milliseconds: 100),
                                        fit: BoxFit.cover,
                                        placeholderFit: BoxFit.contain,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: 180.w,
                                      child: Text(
                                        viewmodel.animePopularDataList[index]
                                                .title?.english ??
                                            viewmodel
                                                .animePopularDataList[index]
                                                .title
                                                ?.native ??
                                            viewmodel
                                                .animePopularDataList[index]
                                                .title
                                                ?.romaji ??
                                            '',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: AppConfiguration.headingColor,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ).p(10),
                                    ).onTap(() {
                                      Navigator.push(
                                        context,
                                        AnimeDetailPage(
                                          animeid: viewmodel
                                                  .animePopularDataList[index]
                                                  .id ??
                                              '',
                                        ).cupertinoRoute(),
                                      );
                                    }),
                                  ],
                                ),
                              ).pSymmetric(h: 10);
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const HeadingRow(
                          heading: 'Popular Peoples',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 350.h,
                          child: ListView.builder(
                            itemCount: viewmodel.popularPeopleList.length,
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
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: FadeInImage(
                                        width: 180.w,
                                        height: 230.h,
                                        imageErrorBuilder:
                                            (BuildContext context, Object error,
                                                StackTrace? stackTrace) {
                                          return Image.asset(
                                            'assets/gallery.png', // Display placeholder when an error occurs
                                            width: 100.w,
                                            height: 160.h,
                                            fit: BoxFit.contain,
                                          );
                                        },
                                        image: NetworkImage(
                                            '${ServiceConfigurations.imagePath}/p/w500/${viewmodel.popularPeopleList[index].profilePath ?? ''}'),
                                        placeholder: const AssetImage(
                                            'assets/gallery.png'),
                                        fadeInDuration:
                                            const Duration(milliseconds: 300),
                                        fadeOutDuration:
                                            const Duration(milliseconds: 100),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            viewmodel.popularPeopleList[index]
                                                    .name ??
                                                '',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: TextStyle(
                                              color:
                                                  AppConfiguration.headingColor,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ).pOnly(bottom: 5),
                                          Text.rich(
                                            TextSpan(
                                              style: TextStyle(
                                                  fontSize: 18.sp,
                                                  color: AppConfiguration
                                                      .headingColor),
                                              children: [
                                                TextSpan(
                                                  text: viewmodel
                                                          .popularPeopleList[
                                                              index]
                                                          .knownFor[0]
                                                          .title ??
                                                      viewmodel
                                                          .popularPeopleList[
                                                              index]
                                                          .knownFor[0]
                                                          .originalTitle ??
                                                      viewmodel
                                                          .popularPeopleList[
                                                              index]
                                                          .knownFor[0]
                                                          .name ??
                                                      '',
                                                ),
                                                const TextSpan(text: ', '),
                                                TextSpan(
                                                    text: viewmodel
                                                            .popularPeopleList[
                                                                index]
                                                            .knownFor[1]
                                                            .title ??
                                                        viewmodel
                                                            .popularPeopleList[
                                                                index]
                                                            .knownFor[1]
                                                            .originalTitle ??
                                                        viewmodel
                                                            .popularPeopleList[
                                                                index]
                                                            .knownFor[1]
                                                            .name ??
                                                        ''),
                                                const TextSpan(text: ', '),
                                                TextSpan(
                                                    text: viewmodel
                                                            .popularPeopleList[
                                                                index]
                                                            .knownFor[2]
                                                            .title ??
                                                        viewmodel
                                                            .popularPeopleList[
                                                                index]
                                                            .knownFor[2]
                                                            .originalTitle ??
                                                        viewmodel
                                                            .popularPeopleList[
                                                                index]
                                                            .knownFor[2]
                                                            .name ??
                                                        ''),
                                              ],
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.white54,
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ).p(10),
                                    ),
                                  ],
                                ),
                              ).pSymmetric(h: 10).onTap(
                                () {
                                  Navigator.push(
                                    context,
                                    PeopleInfoPage(
                                      personData:
                                          viewmodel.popularPeopleList[index],
                                    ).cupertinoRoute(),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 50,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
