import 'package:get_it/get_it.dart';
import 'package:widgetbook_challenge/api/widgetbook_api.dart';
import 'package:widgetbook_challenge/viewmodels/home_viewmodel.dart';

/// Instance of GetIt
GetIt locator = GetIt.instance;

/// static method to setup service and viewmodels
void setupLocator() {
  locator
    ..registerLazySingleton(WidgetbookApi.new)
    ..registerFactory(HomeViewModel.new);
}
