import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/celeb_media_response_model.dart';
import '../../services/service_configuration.dart';

class CelebMediaPage extends StatefulWidget {
  final List<Profiles> mediaList;
  const CelebMediaPage({super.key, required this.mediaList});

  @override
  State<CelebMediaPage> createState() => _CelebMediaPageState();
}

class _CelebMediaPageState extends State<CelebMediaPage> {
  @override
  Widget build(BuildContext context) {
    var mediaData = widget.mediaList;
    return Container(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
          child: GridView.builder(
        itemCount: mediaData.length,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 10, // Spacing between columns
            mainAxisSpacing: 10, // Spacing between rows
            childAspectRatio: 0.70),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage(
              image: NetworkImage(
                '${ServiceConfigurations.imagePath}/p/w500/${mediaData[index].filePath ?? ''}',
              ),
              placeholder: const AssetImage('assets/gallery.png'),
              fadeInDuration: const Duration(milliseconds: 300),
              fadeOutDuration: const Duration(milliseconds: 100),
              fit: BoxFit.cover,
              imageErrorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                return Image.asset(
                  'assets/gallery.png',
                  width: 100.w,
                  fit: BoxFit.contain,
                );
              },
              placeholderFit: BoxFit.contain,
            ),
          );
        },
      )),
    );
  }
}
