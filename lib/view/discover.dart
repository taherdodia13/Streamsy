import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../configurations/app_configurations.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          color: AppConfiguration.primaryColor,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 60.h,
              ),
              Text(
                'Discover',
                style: TextStyle(
                    color: AppConfiguration.headingColor,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold),
              ).pSymmetric(v: 20),
              MaterialButton(
                onPressed: () {},
                color: const Color(0xff3f3f46),
                height: 50.h,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/search.png',
                      width: 25,
                      height: 25,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(
                          color: AppConfiguration.headingColor,
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {},
                color: const Color(0xff3f3f46),
                height: 50.h,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(
                        fontSize: 26.sp, color: AppConfiguration.headingColor),
                    children: [
                      WidgetSpan(
                        child: Image.asset(
                          'assets/filter.png',
                          width: 35,
                          height: 35,
                        ).pOnly(right: 10),
                      ),
                      const TextSpan(
                        text: 'Filter',
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Categories',
                style: TextStyle(
                    color: AppConfiguration.headingColor,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {},
                    color: const Color(0xff3f3f46),
                    height: 50.h,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: AppConfiguration.headingColor),
                        children: [
                          WidgetSpan(
                            child: Image.asset(
                              'assets/filter.png',
                              width: 30,
                              height: 30,
                            ).pOnly(right: 10),
                          ),
                          const TextSpan(
                            text: 'Movies',
                          )
                        ],
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    color: const Color(0xff3f3f46),
                    height: 50.h,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: AppConfiguration.headingColor),
                        children: [
                          WidgetSpan(
                            child: Image.asset(
                              'assets/filter.png',
                              width: 30,
                              height: 30,
                            ).pOnly(right: 10),
                          ),
                          const TextSpan(
                            text: 'TV Shows',
                          )
                        ],
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    color: const Color(0xff3f3f46),
                    height: 50.h,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: AppConfiguration.headingColor),
                        children: [
                          WidgetSpan(
                            child: Image.asset(
                              'assets/filter.png',
                              width: 30,
                              height: 30,
                            ).pOnly(right: 10),
                          ),
                          const TextSpan(
                            text: 'Anime',
                          )
                        ],
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    color: const Color(0xff3f3f46),
                    height: 50.h,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: AppConfiguration.headingColor),
                        children: [
                          WidgetSpan(
                            child: Image.asset(
                              'assets/filter.png',
                              width: 30,
                              height: 30,
                            ).pOnly(right: 10),
                          ),
                          const TextSpan(
                            text: 'People',
                          )
                        ],
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    color: const Color(0xff3f3f46),
                    height: 50.h,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: AppConfiguration.headingColor),
                        children: [
                          WidgetSpan(
                            child: Image.asset(
                              'assets/filter.png',
                              width: 30,
                              height: 30,
                            ).pOnly(right: 10),
                          ),
                          const TextSpan(
                            text: 'Trending',
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'General',
                style: TextStyle(
                    color: AppConfiguration.headingColor,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {},
                    color: const Color(0xff3f3f46),
                    height: 50.h,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: AppConfiguration.headingColor),
                        children: [
                          WidgetSpan(
                            child: Image.asset(
                              'assets/filter.png',
                              width: 30,
                              height: 30,
                            ).pOnly(right: 10),
                          ),
                          const TextSpan(
                            text: 'Movies Genres',
                          )
                        ],
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    color: const Color(0xff3f3f46),
                    height: 50.h,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: AppConfiguration.headingColor),
                        children: [
                          WidgetSpan(
                            child: Image.asset(
                              'assets/filter.png',
                              width: 30,
                              height: 30,
                            ).pOnly(right: 10),
                          ),
                          const TextSpan(
                            text: 'TV Shows Genres',
                          )
                        ],
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    color: const Color(0xff3f3f46),
                    height: 50.h,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: AppConfiguration.headingColor),
                        children: [
                          WidgetSpan(
                            child: Image.asset(
                              'assets/filter.png',
                              width: 30,
                              height: 30,
                            ).pOnly(right: 10),
                          ),
                          const TextSpan(
                            text: 'Anime Genres',
                          )
                        ],
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    color: const Color(0xff3f3f46),
                    height: 50.h,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: AppConfiguration.headingColor),
                        children: [
                          WidgetSpan(
                            child: Image.asset(
                              'assets/filter.png',
                              width: 30,
                              height: 30,
                            ).pOnly(right: 10),
                          ),
                          const TextSpan(
                            text: 'Featured List',
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60.h,
              )
            ],
          ).pSymmetric(h: 15),
        ),
      ),
    );
  }
}
