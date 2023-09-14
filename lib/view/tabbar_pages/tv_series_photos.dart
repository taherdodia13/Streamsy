import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../configurations/app_configurations.dart';
import '../../services/service_configuration.dart';
import '../../viewmodel/tvseries_viewmodel.dart';

class TVSeriesPhotosPage extends StatefulWidget {
  final TVSeriesViewmodel viewmodel;
  const TVSeriesPhotosPage({super.key, required this.viewmodel});

  @override
  State<TVSeriesPhotosPage> createState() => _TVSeriesPhotosPageState();
}

class _TVSeriesPhotosPageState extends State<TVSeriesPhotosPage> {
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
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    2, // You can adjust this value according to your design
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                childAspectRatio: 1.2, // Set the childAspectRatio to 1.2
              ),
              itemCount: widget.viewmodel.tvSeriesImageData.backdrops.length,
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
                        'assets/gallery.png', // Display a placeholder when an error occurs
                        width: 100.w,
                        height: 160.h,
                        fit: BoxFit.contain,
                      );
                    },
                    placeholderFit: BoxFit.contain,
                    image: NetworkImage(
                        '${ServiceConfigurations.imagePath}/p/w185/${widget.viewmodel.tvSeriesImageData.backdrops[index].filePath ?? ''}'),
                    placeholder: const AssetImage('assets/gallery.png'),
                    fadeInDuration: const Duration(milliseconds: 300),
                    fadeOutDuration: const Duration(milliseconds: 100),
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
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    2, // You can adjust this value according to your design
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                childAspectRatio: 1.1, // Set the childAspectRatio to 1.1
              ),
              itemCount: widget.viewmodel.tvSeriesImageData.logos.length,
              itemBuilder: (context, index) {
                return Container(
                  // width: 160.w,
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
                        'assets/gallery.png', // Display a placeholder when an error occurs
                        width: 100.w,
                        height: 160.h,
                        fit: BoxFit.contain,
                      );
                    },
                    placeholderFit: BoxFit.contain,
                    image: NetworkImage(
                        '${ServiceConfigurations.imagePath}/p/w185/${widget.viewmodel.tvSeriesImageData.logos[index].filePath ?? ''}'),
                    placeholder: const AssetImage('assets/gallery.png'),
                    fadeInDuration: const Duration(milliseconds: 300),
                    fadeOutDuration: const Duration(milliseconds: 100),
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
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    2, // You can adjust this value according to your design
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                childAspectRatio: 0.7, // Set the childAspectRatio to 0.7
              ),
              itemCount: widget.viewmodel.tvSeriesImageData.posters.length,
              itemBuilder: (context, index) {
                return Container(
                  // width: 160.w,
                  decoration: const BoxDecoration(
                    color: AppConfiguration.cardColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: FadeInImage(
                    width: 180.w,
                    height: 230.h,
                    imageErrorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      return Image.asset(
                        'assets/gallery.png', // Display a placeholder when an error occurs
                        width: 100.w,
                        height: 160.h,
                        fit: BoxFit.contain,
                      );
                    },
                    placeholderFit: BoxFit.contain,
                    image: NetworkImage(
                        '${ServiceConfigurations.imagePath}/p/w185/${widget.viewmodel.tvSeriesImageData.posters[index].filePath ?? ''}'),
                    placeholder: const AssetImage('assets/gallery.png'),
                    fadeInDuration: const Duration(milliseconds: 300),
                    fadeOutDuration: const Duration(milliseconds: 100),
                    fit: BoxFit.cover,
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
