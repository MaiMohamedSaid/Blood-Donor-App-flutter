import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:untitledtest11/data/repository/need_repo.dart';
import 'package:untitledtest11/provider/auth_provider.dart';
import 'package:untitledtest11/provider/donation_provider.dart';
import 'package:untitledtest11/provider/localization_provider.dart';
import 'package:untitledtest11/provider/needs_provider.dart';
import 'package:untitledtest11/provider/section_provider.dart';
import 'package:untitledtest11/provider/theme_provider.dart';
import 'package:untitledtest11/services/navigation_services.dart';
import 'data/dataSource/remote/dio/dio_client.dart';
import 'data/dataSource/remote/dio/logging_interceptor.dart';
import 'data/repository/auth_repo.dart';
import 'data/repository/donar_repo.dart';
import 'data/repository/section_repo.dart';
import 'helper/network_info.dart';

final sl = GetIt.instance;
GetIt locator = GetIt.I;

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => NavigationServices());

  // External
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
  sl.registerLazySingleton(() => Connectivity());

  // Core
  sl.registerLazySingleton(() => NetworkInfo(sl()));
  sl.registerLazySingleton(() => DioClient(
      // AppConstants.BASE_URL,
      sl(),
      loggingInterceptor: sl(), sharedPreferences: sl()));

  // Repository
  sl.registerLazySingleton(() => AuthRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => SectionRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => DonarRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => NeedRepo(dioClient: sl(), sharedPreferences: sl()));

  // Provider
  sl.registerFactory(() => ThemeProvider(sharedPreferences: sl()));
  sl.registerFactory(() => LocalizationProvider(sharedPreferences: sl()));
  sl.registerFactory(() => AuthProvider(authRepo: sl()));
  sl.registerFactory(() => DonationProvider(donarRepo: sl()));
  sl.registerFactory(() => SectionProvider(sectionRepo: sl()));
  sl.registerFactory(() => NeedsProvider(needRepo: sl()));
}
