import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../configurations/app_configurations.dart';

class HeadingRow extends StatelessWidget {
  final String heading;
  const HeadingRow({super.key, required this.heading});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          heading,
          style: TextStyle(
              color: AppConfiguration.headingColor,
              fontSize: 22.sp,
              fontWeight: FontWeight.bold),
        ),
        Text(
          'View More',
          style: TextStyle(
              color: AppConfiguration.seeAllColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w400),
        )
      ],
    ).pSymmetric(h: 10);
  }
}
