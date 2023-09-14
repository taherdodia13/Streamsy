import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../configurations/app_configurations.dart';
import '../../services/service_configuration.dart';
import '../../viewmodel/movies_details_viewmodel.dart';

class MoviesPhotosPage extends StatefulWidget {
  final MoviesDetailsViewModel viewmodel;
  const MoviesPhotosPage({super.key, required this.viewmodel});

  @override
  State<MoviesPhotosPage> createState() => _MoviesPhotosPageState();
}

class _MoviesPhotosPageState extends State<MoviesPhotosPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(color: AppConfiguration.primaryColor),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: widget.viewmodel.moviesImageData.backdrops.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: const BoxDecoration(
                    color: AppConfiguration.cardColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: FadeInImage(
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
                          '${ServiceConfigurations.imagePath}/p/w185/${widget.viewmodel.moviesImageData.backdrops[index].filePath ?? ''}'),
                      placeholder: const AssetImage('assets/gallery.png'),
                      fadeInDuration: const Duration(milliseconds: 300),
                      fadeOutDuration: const Duration(milliseconds: 100),
                      placeholderFit: BoxFit.contain,
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
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                childAspectRatio: 1.1,
              ),
              itemCount: widget.viewmodel.moviesImageData.logos.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: const BoxDecoration(
                    color: AppConfiguration.cardColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: FadeInImage(
                    width: 160.w,
                    height: 160.h,
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
                        '${ServiceConfigurations.imagePath}/p/w185/${widget.viewmodel.moviesImageData.logos[index].filePath ?? ''}'),
                    placeholder: const AssetImage('assets/gallery.png'),
                    fadeInDuration: const Duration(milliseconds: 300),
                    fadeOutDuration: const Duration(milliseconds: 100),
                    placeholderFit: BoxFit.contain,
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
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                childAspectRatio: 0.7,
              ),
              itemCount: widget.viewmodel.moviesImageData.posters.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: const BoxDecoration(
                    color: AppConfiguration.cardColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                    child: FadeInImage(
                      width: 160.w,
                      height: 160.h,
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
                          '${ServiceConfigurations.imagePath}/p/w185/${widget.viewmodel.moviesImageData.posters[index].filePath ?? ''}'),
                      placeholder: const AssetImage('assets/gallery.png'),
                      fadeInDuration: const Duration(milliseconds: 300),
                      fadeOutDuration: const Duration(milliseconds: 100),
                      placeholderFit: BoxFit.contain,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
