import 'package:anime_app/viewmodel/dashboard_viewmodel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../configurations/app_configurations.dart';
import '../../services/service_configuration.dart';

class DashboardSlider extends StatefulWidget {
  final DashboardViewModel viewmodel;
  const DashboardSlider({super.key, required this.viewmodel});

  @override
  State<DashboardSlider> createState() => _DashboardSliderState();
}

class _DashboardSliderState extends State<DashboardSlider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 240.h,
        scrollDirection: Axis.horizontal,
        viewportFraction: 1,
        initialPage: 0,
        // enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        onPageChanged: (index, reason) {
          setState(() {
            widget.viewmodel.currentIndex = index;
          });
        },
      ),
      items: widget.viewmodel.moviesTrendingList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      foregroundDecoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            AppConfiguration.primaryColor.withOpacity(0.9),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0, 0.8],
                        ),
                      ),
                      child: FadeInImage(
                        image: NetworkImage(
                            '${ServiceConfigurations.imagePath}/p/w500/${i.backdropPath ?? ''}'),
                        placeholder: const AssetImage('assets/gallery.png'),
                        fadeInDuration: const Duration(milliseconds: 300),
                        fadeOutDuration: const Duration(milliseconds: 100),
                        fit: BoxFit.cover,
                        placeholderFit: BoxFit.contain,
                        imageErrorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                          return Image.asset(
                            'assets/gallery.png', // Display placeholder when an error occurs
                            width: 100.w,
                            height: 160.h,
                            fit: BoxFit.contain,
                          );
                        },
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 20,
                      child: Stack(
                        children: [
                          Container(
                            foregroundDecoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  AppConfiguration.primaryColor
                                      .withOpacity(0.9),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: const [0, 0.8],
                              ),
                            ),
                          ),
                          Text(
                            '#${widget.viewmodel.currentIndex + 1}',
                            style: TextStyle(
                                color: AppConfiguration.headingColor,
                                fontSize: 28.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 48,
                      left: 20,
                      child: Text(
                        i.title ?? i.originalTitle ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            color: AppConfiguration.headingColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    // Positioned(
                    //   left: 10,
                    //   bottom: 35,
                    //   child: MaterialButton(
                    //     onPressed: () {},
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     height: 50,
                    //     color: const Color(0xff2196f3),
                    //     child: Text(
                    //       'WATCH NOW',
                    //       style: TextStyle(
                    //           color:
                    //               AppConfiguration.headingColor,
                    //           fontWeight: FontWeight.w500,
                    //           fontSize: 18.sp),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
