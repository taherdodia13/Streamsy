import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../configurations/app_configurations.dart';
import '../../services/service_configuration.dart';
import '../../viewmodel/movies_details_viewmodel.dart';
import '../movies_details_page.dart';

class MoviesCastPage extends StatefulWidget {
  final MoviesDetailsViewModel viewmodel;
  const MoviesCastPage({super.key, required this.viewmodel});

  @override
  State<MoviesCastPage> createState() => _MoviesCastPageState();
}

class _MoviesCastPageState extends State<MoviesCastPage> {
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
            childAspectRatio: 0.51,
          ),
          itemCount: widget.viewmodel.moviesCreditsData.cast.length,
          itemBuilder: (context, index) {
            return Container(
              width: 160.w,
              height: 320.h,
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
                      imageErrorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return Image.asset(
                          'assets/gallery.png', // Display placeholder when an error occurs
                          width: 100.w,
                          height: 160.h,
                          fit: BoxFit.contain,
                        );
                      },
                      height: 230.h,
                      image: NetworkImage(
                        '${ServiceConfigurations.imagePath}/p/w185/${widget.viewmodel.moviesCreditsData.cast[index].profilePath ?? ''}',
                      ),
                      placeholder: const AssetImage('assets/gallery.png'),
                      fadeInDuration: const Duration(milliseconds: 300),
                      fadeOutDuration: const Duration(milliseconds: 100),
                      placeholderFit: BoxFit.contain,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 180.w,
                    child: Text(
                      widget.viewmodel.moviesCreditsData.cast[index].name ??
                          widget.viewmodel.moviesCreditsData.cast[index]
                              .originalName ??
                          '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(
                        color: AppConfiguration.headingColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
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
                    movieId: widget.viewmodel.moviesCreditsData.cast[index].id,
                  ).cupertinoRoute(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
