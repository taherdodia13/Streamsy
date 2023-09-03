import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../configurations/app_configurations.dart';
import '../helper/app_drawer.dart';
import '../viewmodel/main_page_viewmodel.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  MainPageViewModel viewmodel() => GetIt.instance.get<MainPageViewModel>();

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    widget.viewmodel().oninit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainPageViewModel>.value(
      value: widget.viewmodel(),
      child: Consumer<MainPageViewModel>(
        builder: (context, viewmodel, child) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
              preferredSize: const Size(double.infinity, 50),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: AppBar(
                    backgroundColor:
                        AppConfiguration.primaryColor.withOpacity(0.5),
                    elevation: 0.0,
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/chat.png',
                          width: 30.h,
                          height: 30.h,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            drawer: const AppDrawer(),
            body: Stack(
              children: [
                viewmodel.tabs[viewmodel.selectedIndex],
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppConfiguration.primaryColor.withOpacity(0.7),
                              AppConfiguration.primaryColor.withOpacity(0.7),
                            ],
                            begin: AlignmentDirectional.topStart,
                            end: AlignmentDirectional.bottomEnd,
                          ),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15),
                          ),
                          border: Border.all(
                            width: 1.5,
                            color:
                                AppConfiguration.primaryColor.withOpacity(0.9),
                          ),
                        ),
                        child: BottomNavigationBar(
                          onTap: (index) {
                            viewmodel.onTabChange(index);
                          },
                          elevation: 0.0,
                          useLegacyColorScheme: false,
                          selectedItemColor: Colors.amber,
                          iconSize: 28.sp,
                          unselectedItemColor: AppConfiguration.headingColor,
                          selectedFontSize: 0,
                          unselectedFontSize: 0,
                          showSelectedLabels: false,
                          showUnselectedLabels: false,
                          currentIndex: viewmodel.selectedIndex,
                          backgroundColor: Colors.transparent,
                          items: <BottomNavigationBarItem>[
                            BottomNavigationBarItem(
                              icon: viewmodel.selectedIndex == 0
                                  ? Image.asset(
                                      'assets/home_fill.png',
                                      width: 28,
                                      height: 28,
                                      color: Colors.amber,
                                    )
                                  : Image.asset(
                                      'assets/home.png',
                                      width: 28,
                                      height: 28,
                                      color: AppConfiguration.headingColor,
                                    ),
                              label: 'Home',
                            ),
                            BottomNavigationBarItem(
                              icon: viewmodel.selectedIndex == 1
                                  ? Image.asset(
                                      'assets/compass_fill.png',
                                      width: 28,
                                      height: 28,
                                      color: Colors.amber,
                                    )
                                  : Image.asset(
                                      'assets/compass.png',
                                      width: 28,
                                      height: 28,
                                      color: AppConfiguration.headingColor,
                                    ),
                              label: 'Discover',
                            ),
                            BottomNavigationBarItem(
                              icon: viewmodel.selectedIndex == 2
                                  ? Image.asset(
                                      'assets/option_fill.png',
                                      width: 28,
                                      height: 28,
                                      color: Colors.amber,
                                    )
                                  : Image.asset(
                                      'assets/option.png',
                                      width: 28,
                                      height: 28,
                                      color: AppConfiguration.headingColor,
                                    ),
                              label: 'Profile',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
