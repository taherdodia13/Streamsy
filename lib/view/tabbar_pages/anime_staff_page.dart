import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../configurations/app_configurations.dart';
import '../../model/anime_details_response_model.dart';

class AnimeStaffPage extends StatefulWidget {
  final AnimeDetailsResponseModel animeData;
  const AnimeStaffPage({super.key, required this.animeData});

  @override
  State<AnimeStaffPage> createState() => _AnimeStaffPageState();
}

class _AnimeStaffPageState extends State<AnimeStaffPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(color: AppConfiguration.primaryColor),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                2, // You can adjust this value according to your design
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
            childAspectRatio: 0.52, // Set the childAspectRatio to 0.52
          ),
          itemCount: widget.animeData.characters.length,
          itemBuilder: (context, index) {
            return Container(
              width: 160.w,
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
                      image: NetworkImage(
                          '${widget.animeData.characters[index].voiceActors[0].image}'),
                      placeholder: const AssetImage('assets/gallery.png'),
                      fadeInDuration: const Duration(milliseconds: 300),
                      fadeOutDuration: const Duration(milliseconds: 100),
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 180.w,
                    child: Text(
                      widget.animeData.characters[index].voiceActors[0].name
                              ?.full ??
                          widget.animeData.characters[index].voiceActors[0].name
                              ?.userPreferred ??
                          widget.animeData.characters[index].voiceActors[0].name
                              ?.first ??
                          widget.animeData.characters[index].voiceActors[0].name
                              ?.last ??
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
    );
  }
}
