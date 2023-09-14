import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../configurations/app_configurations.dart';
import '../../model/anime_details_response_model.dart';
import '../../viewmodel/anime_details_viewmodel.dart';

class AnimeOverViewPage extends StatefulWidget {
  final AnimeDetailsResponseModel animeData;
  final AnimeDetailsViewmodel viewmodel;
  const AnimeOverViewPage({
    super.key,
    required this.animeData,
    required this.viewmodel,
  });

  @override
  State<AnimeOverViewPage> createState() => _AnimeOverViewPageState();
}

class _AnimeOverViewPageState extends State<AnimeOverViewPage> {
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
                right: 20,
              ),
              decoration: BoxDecoration(
                color: AppConfiguration.cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    widget.viewmodel
                        .removeHtmlTags(widget.animeData.description ?? ''),
                    style: TextStyle(
                        color: AppConfiguration.headingColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400),
                  ).pOnly(bottom: 14),
                ],
              ),
            ),
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
                        'Episodes',
                        style: TextStyle(
                            color: AppConfiguration.headingColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
                      ).pOnly(bottom: 14),
                      Text(
                        widget.animeData.totalEpisodes.toString(),
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
                        'Episodes Duration',
                        style: TextStyle(
                            color: AppConfiguration.headingColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
                      ).pOnly(bottom: 14),
                      Text(
                        widget.animeData.duration.toString(),
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
                      ).pOnly(bottom: 14),
                      Text(
                        widget.animeData.status ?? '',
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
                        'Start Date',
                        style: TextStyle(
                            color: AppConfiguration.headingColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
                      ).pOnly(bottom: 14),
                      Text(
                        "${widget.animeData.startDate?.day ?? ''}/${widget.animeData.startDate?.month ?? ''}/${widget.animeData.startDate?.year ?? ''}",
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
                        'End Date',
                        style: TextStyle(
                            color: AppConfiguration.headingColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
                      ).pOnly(bottom: 14),
                      Text(
                        "${widget.animeData.endDate?.day ?? ''}/${widget.animeData.endDate?.month ?? ''}/${widget.animeData.endDate?.year ?? ''}",
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
                        'Country of Origin',
                        style: TextStyle(
                            color: AppConfiguration.headingColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
                      ).pOnly(bottom: 14),
                      Text(
                        widget.animeData.countryOfOrigin ?? '',
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
                        'Popularity',
                        style: TextStyle(
                            color: AppConfiguration.headingColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
                      ).pOnly(bottom: 14),
                      Text(
                        "${widget.animeData.popularity}",
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
                        'Studios',
                        style: TextStyle(
                            color: AppConfiguration.headingColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
                      ).pOnly(bottom: 14),
                      ListView.builder(
                        itemCount: widget.animeData.studios.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Text(
                            widget.animeData.studios[index],
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
                        'Synonyms',
                        style: TextStyle(
                            color: AppConfiguration.headingColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
                      ).pOnly(bottom: 14),
                      ListView.builder(
                        itemCount: widget.animeData.synonyms.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Text(
                            widget.animeData.synonyms[index],
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
                itemCount: widget.animeData.relations.length,
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
                                widget.animeData.relations[index].image ?? ''),
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
                            widget.animeData.relations[index].title?.english ??
                                widget
                                    .animeData.relations[index].title?.native ??
                                widget
                                    .animeData.relations[index].title?.romaji ??
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
                itemCount: widget.animeData.characters.length,
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
                                '${widget.animeData.characters[index].image}'),
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
                                widget.animeData.characters[index].name?.full ??
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
                itemCount: widget.animeData.recommendations.length,
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
                                '${widget.animeData.recommendations[index].image}'),
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
                                widget.animeData.recommendations[index].title
                                        ?.english ??
                                    widget.animeData.recommendations[index]
                                        .title?.native ??
                                    widget.animeData.recommendations[index]
                                        .title?.romaji ??
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
    );
  }
}
