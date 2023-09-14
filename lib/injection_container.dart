import 'package:get_it/get_it.dart';
import 'package:story_view_app/features/story/presentation/controllers/main_cubit/main_cubit.dart';
import 'features/story/presentation/controllers/story_cubit/story_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// features
  /// 1. authentication
  // bloc /////////////////////////////////////////////////
  // sl.registerFactory(
  //     () => AuthCubit(loginUseCase: sl.call(), signUpUseCase: sl.call()));
  // // useCase //////////////////////////////////////////////
  // sl.registerLazySingleton(() => LoginUseCase(sl.call()));
  // sl.registerLazySingleton(() => SignUpUseCase(sl.call()));
  // // repository ///////////////////////////////////////////
  // sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
  //       authLocalDataSource: sl.call(),
  //     ));
  // // dataSource /////////////////////////////////////////////
  // sl.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(
  //       localDataBase: sl.call(),
  //     ));

  /// 2. story
  // bloc /////////////////////////////////////////////////
  sl.registerFactory(() => StoryCubit());
  sl.registerFactory(() => MainCubit());
  // useCase //////////////////////////////////////////////
  // sl.registerLazySingleton(() => GetInstructorsDataUseCase(sl.call()));
  // sl.registerLazySingleton(() => BookSessionUseCase(sl.call()));
  // sl.registerLazySingleton(() => GetAllSessionsUseCase(sl.call()));
  // sl.registerLazySingleton(() => DeleteSessionUseCase(sl.call()));
  // // repository ///////////////////////////////////////////
  // sl.registerLazySingleton<BookingRepository>(() => BookingRepositoryImpl(
  //       bookingLocalDataSource: sl.call(),
  //     ));
  // // dataSource /////////////////////////////////////////////
  // sl.registerLazySingleton<BookingLocalDataSource>(
  //     () => BookingLocalDataSourceImpl(localDataBase: sl.call()));
  // /////////////////////////////////////////////////////////
  // /////////////////////////////////////////////////////////
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);

  // sl.registerSingleton<AppRouter>(AppRouter());
  // sl.registerSingleton<LocalDataBase>(LocalDataBase());
}
