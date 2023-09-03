import 'dart:ui';

import 'package:anime_app/services/service_configuration.dart';
import 'package:anime_app/view/widgets/celeb_media_page.dart';
import 'package:anime_app/view/widgets/celeb_overview_page.dart';
import 'package:anime_app/view/widgets/celebs_credit_page.dart';
import 'package:anime_app/viewmodel/peoples_info_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../configurations/app_configurations.dart';
import '../model/popular_people_response_model.dart';

class PeopleInfoPage extends StatefulWidget {
  final PopularPeopleData personData;
  const PeopleInfoPage({super.key, required this.personData});

  PeopleInfoViewModel viewmodel() => GetIt.instance.get<PeopleInfoViewModel>();
  @override
  State<PeopleInfoPage> createState() => _PeopleInfoPageState();
}

class _PeopleInfoPageState extends State<PeopleInfoPage> {
  @override
  void initState() {
    widget.viewmodel().oninit(widget.personData.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var celebData = widget.personData;
    return ChangeNotifierProvider<PeopleInfoViewModel>.value(
      value: widget.viewmodel(),
      child:
          Consumer<PeopleInfoViewModel>(builder: (context, viewmodel, child) {
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
                  leadingWidth: 50.w,
                  leading: Icon(
                    Icons.arrow_back_ios,
                    size: 24.sp,
                    color: AppConfiguration.headingColor,
                  ).onTap(
                    () {
                      Navigator.pop(context);
                    },
                  ),
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
          body: Container(
            decoration: const BoxDecoration(
              color: AppConfiguration.primaryColor,
            ),
            child: NestedScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60.h,
                        ),
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.45,
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: FadeInImage(
                                imageErrorBuilder: (BuildContext context,
                                    Object error, StackTrace? stackTrace) {
                                  return Image.asset(
                                    'assets/gallery.png', // Display placeholder when an error occurs
                                    width: 100.w,
                                    height: 160.h,
                                    fit: BoxFit.contain,
                                  );
                                },
                                image: NetworkImage(
                                    '${ServiceConfigurations.imagePath}/p/w500/${celebData.profilePath ?? ''}'),
                                placeholder:
                                    const AssetImage('assets/gallery.png'),
                                fadeInDuration:
                                    const Duration(milliseconds: 300),
                                fadeOutDuration:
                                    const Duration(milliseconds: 100),
                                fit: BoxFit.cover,
                                placeholderFit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            celebData.name ?? '',
                            style: TextStyle(
                              color: AppConfiguration.headingColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 24.sp,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/insta1.png',
                              height: 20,
                              width: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              'assets/insta1.png',
                              height: 20,
                              width: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              'assets/insta1.png',
                              height: 20,
                              width: 20,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Personal Data',
                          style: TextStyle(
                            color: AppConfiguration.headingColor,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Table(
                          children: [
                            TableRow(
                              children: [
                                Text(
                                  'Known For',
                                  style: TextStyle(
                                    color: AppConfiguration.headingColor,
                                    fontSize: 20.sp,
                                  ),
                                ),
                                Text(
                                  celebData.knownForDepartment ?? '',
                                  style: TextStyle(
                                      color: AppConfiguration.headingColor,
                                      fontSize: 20.sp),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Text(
                                  'Gender',
                                  style: TextStyle(
                                      color: AppConfiguration.headingColor,
                                      fontSize: 20.sp,
                                      height: 1.5),
                                ),
                                Text(
                                  celebData.gender == 1 ? 'female' : 'male',
                                  style: TextStyle(
                                      color: AppConfiguration.headingColor,
                                      fontSize: 20.sp,
                                      height: 1.5),
                                )
                              ],
                            ),
                            TableRow(
                              children: [
                                Text(
                                  'Birthdate',
                                  style: TextStyle(
                                      color: AppConfiguration.headingColor,
                                      fontSize: 20.sp,
                                      height: 1.5),
                                ),
                                Text(
                                  viewmodel.celebData.birthday ?? '',
                                  style: TextStyle(
                                      color: AppConfiguration.headingColor,
                                      fontSize: 20.sp,
                                      height: 1.5),
                                )
                              ],
                            ),
                            TableRow(
                              children: [
                                Text(
                                  'Birth Place',
                                  style: TextStyle(
                                      color: AppConfiguration.headingColor,
                                      fontSize: 20.sp,
                                      height: 1.5),
                                ),
                                Text(
                                  viewmodel.celebData.placeOfBirth ?? '',
                                  style: TextStyle(
                                      color: AppConfiguration.headingColor,
                                      fontSize: 20.sp,
                                      height: 1.5),
                                )
                              ],
                            ),
                            TableRow(
                              children: [
                                Text(
                                  'Also Know As',
                                  style: TextStyle(
                                      color: AppConfiguration.headingColor,
                                      fontSize: 20.sp,
                                      height: 1.5),
                                ),
                                ListView.builder(
                                  itemCount:
                                      viewmodel.celebData.alsoKnownAs.length,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  itemBuilder: (context, index) {
                                    return Text(
                                      viewmodel.celebData.alsoKnownAs[index],
                                      style: TextStyle(
                                          color: AppConfiguration.headingColor,
                                          fontSize: 20.sp,
                                          height: 1.5),
                                    );
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ];
              },
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: DefaultTabController(
                      length: 3, // Number of tabs
                      child: Column(
                        children: [
                          TabBar(
                            tabs: const [
                              Tab(text: 'Overview'),
                              Tab(text: 'Credits'),
                              Tab(text: 'Media'),
                            ],
                            indicatorColor: AppConfiguration.headingColor,
                            labelColor: AppConfiguration.headingColor,
                            unselectedLabelColor: Colors.grey,
                            labelStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            unselectedLabelStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                OverviewPage(
                                  celebsData: viewmodel.celebData,
                                  knownFor: celebData.knownFor,
                                ),
                                CreditsPage(
                                  moviesCastList: viewmodel.moviesCastCredit,
                                  seriesCastList: viewmodel.seriesCastCredit,
                                  moviesCrewList: viewmodel.moviesCrewCredit,
                                  seriesCrewList: viewmodel.seriesCrewCredit,
                                ),
                                CelebMediaPage(mediaList: viewmodel.mediaList),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ).p(10),
            ),
          ),
        );
      }),
    );
  }
}
