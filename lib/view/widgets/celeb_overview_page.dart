import 'package:anime_app/model/popular_people_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../configurations/app_configurations.dart';
import '../../model/people_info_response_model.dart';
import '../../services/service_configuration.dart';

class OverviewPage extends StatefulWidget {
  final PeopleInfoResponseModel celebsData;
  final List<KnownFor> knownFor;
  const OverviewPage({
    super.key,
    required this.celebsData,
    required this.knownFor,
  });

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  Widget build(BuildContext context) {
    var celebInfo = widget.celebsData;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            celebInfo.biography ?? 'No Details Found',
            style: TextStyle(
              color: AppConfiguration.headingColor,
              fontWeight: FontWeight.w400,
              fontSize: 18.sp,
              height: 1.2,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Know For',
            style: TextStyle(
                color: AppConfiguration.headingColor,
                fontWeight: FontWeight.w500,
                fontSize: 22.sp),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 310.h,
            child: ListView.builder(
              itemCount: widget.knownFor.length,
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
                          imageErrorBuilder: (BuildContext context,
                              Object error, StackTrace? stackTrace) {
                            return Image.asset(
                              'assets/gallery.png', // Display placeholder when an error occurs
                              width: 100.w,
                              height: 160.h,
                              fit: BoxFit.contain,
                            );
                          },
                          placeholderFit: BoxFit.contain,
                          image: NetworkImage(
                              '${ServiceConfigurations.imagePath}/p/w500/${widget.knownFor[index].posterPath ?? ''}'),
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
                          widget.knownFor[index].title ??
                              widget.knownFor[index].originalTitle ??
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
                ).pSymmetric(h: 10);
              },
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
