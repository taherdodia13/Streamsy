import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../configurations/app_configurations.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.topLeft,
            decoration:
                const BoxDecoration(color: AppConfiguration.primaryColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/dummyImage.jpg'),
                    ).pOnly(
                      bottom: 10,
                    ),
                    Image.asset(
                      'assets/logout.png',
                      width: 30.w,
                      height: 30.h,
                    ).pOnly(
                      top: 10,
                      right: 5,
                    ),
                  ],
                ),
                Text(
                  'Kakeru Blaze',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppConfiguration.headingColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                  ),
                ).pOnly(
                  top: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'kakerblaze@gmail.com',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppConfiguration.headingColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                    ).pOnly(top: 5),
                    IconButton(
                      onPressed: () {},
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.edit,
                        color: AppConfiguration.headingColor,
                        size: 22.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ).pOnly(
              left: 20,
              right: 20,
            ),
          ),
          const Divider(
            color: AppConfiguration.headingColor,
            height: 1,
          ),
          Expanded(
            child: Container(
              decoration:
                  const BoxDecoration(color: AppConfiguration.primaryColor),
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    titleTextStyle: AppConfiguration.drawerList,
                    leading: Icon(
                      Icons.home,
                      color: AppConfiguration.headingColor,
                      size: 28.sp,
                    ),
                    title: const Text('Home'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    titleTextStyle: AppConfiguration.drawerList,
                    leading: Image.asset(
                      'assets/japanese.png',
                      width: 22.w,
                      height: 22.h,
                    ),
                    title: const Text('Trending'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    titleTextStyle: AppConfiguration.drawerList,
                    leading: Image.asset(
                      'assets/english.png',
                      width: 22.w,
                      height: 22.h,
                    ),
                    title: const Text('Discover'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    titleTextStyle: AppConfiguration.drawerList,
                    leading: Image.asset(
                      'assets/fire.png',
                      width: 22.w,
                      height: 22.h,
                    ),
                    title: const Text('Search'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    titleTextStyle: AppConfiguration.drawerList,
                    leading: Image.asset(
                      'assets/movie.png',
                      width: 22.w,
                      height: 22.h,
                    ),
                    title: const Text('Movies'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    titleTextStyle: AppConfiguration.drawerList,
                    leading: Image.asset(
                      'assets/tv.png',
                      width: 22.w,
                      height: 22.h,
                    ),
                    title: const Text('Tv Shows'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    titleTextStyle: AppConfiguration.drawerList,
                    leading: Image.asset(
                      'assets/grid.png',
                      width: 22.w,
                      height: 22.h,
                    ),
                    title: const Text('Anime'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    titleTextStyle: AppConfiguration.drawerList,
                    leading: Image.asset(
                      'assets/grid.png',
                      width: 22.w,
                      height: 22.h,
                    ),
                    title: const Text('People'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    titleTextStyle: AppConfiguration.drawerList,
                    leading: Image.asset(
                      'assets/grid.png',
                      width: 22.w,
                      height: 22.h,
                    ),
                    title: const Text('Settings'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            color: AppConfiguration.headingColor,
            height: 1,
          ),
          Container(
            padding: EdgeInsets.all(10.h),
            decoration: const BoxDecoration(
              color: AppConfiguration.primaryColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/insta.png',
                        width: 22.w,
                        height: 22.h,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/github.png',
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/discord.png',
                        width: 22.w,
                        height: 22.h,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Privacy Policy',
                      style: TextStyle(
                          color: AppConfiguration.headingColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 18.sp),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      'About Us',
                      style: TextStyle(
                          color: AppConfiguration.headingColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 18.sp),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
