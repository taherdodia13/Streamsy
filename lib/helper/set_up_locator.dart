import 'package:anime_app/viewmodel/dashboard_viewmodel.dart';
import 'package:anime_app/viewmodel/main_page_viewmodel.dart';
import 'package:anime_app/viewmodel/peoples_info_viewmodel.dart';
import 'package:get_it/get_it.dart';

import '../viewmodel/anime_details_viewmodel.dart';
import '../viewmodel/movies_details_viewmodel.dart';
import '../viewmodel/tvseries_viewmodel.dart';

GetIt get locator => GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton<DashboardViewModel>(() => DashboardViewModel());
  locator
      .registerLazySingleton<PeopleInfoViewModel>(() => PeopleInfoViewModel());
  locator.registerLazySingleton<MainPageViewModel>(() => MainPageViewModel());
  locator.registerLazySingleton<MoviesDetailsViewModel>(
      () => MoviesDetailsViewModel());
  locator.registerLazySingleton<TVSeriesViewmodel>(() => TVSeriesViewmodel());
  locator.registerLazySingleton<AnimeDetailsViewmodel>(
      () => AnimeDetailsViewmodel());
}
