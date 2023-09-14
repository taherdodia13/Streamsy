import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../configurations/app_configurations.dart';

class GenresWrapList extends StatefulWidget {
  final viewmodel;
  final data;
  const GenresWrapList({
    super.key,
    required this.viewmodel,
    required this.data,
  });

  @override
  State<GenresWrapList> createState() => _GenresWrapListState();
}

class _GenresWrapListState extends State<GenresWrapList> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 10,
      children: List.generate(
        widget.data.genres.length,
        (index) {
          return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: widget.viewmodel.lightenColor(
                widget.viewmodel.palette?.darkVibrantColor?.color ??
                    AppConfiguration.primaryColor,
                0.2,
              ),
            ),
            child: Text(
              '${widget.data.genres[index].name}',
              style: TextStyle(
                  color: AppConfiguration.headingColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400),
            ),
          );
        },
      ),
    ).pOnly(left: 20, right: 20);
  }
}
