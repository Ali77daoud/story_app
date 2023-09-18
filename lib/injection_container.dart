import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:story_view_app/features/story/data/data_sources/story_remote_datasource.dart';
import 'package:story_view_app/features/story/data/repositories/story_repositories_imp.dart';
import 'package:story_view_app/features/story/domain/repositories/story_repository.dart';
import 'package:story_view_app/features/story/domain/usecases/get_user_stories_data_usecase.dart';
import 'package:story_view_app/features/story/presentation/controllers/main_cubit/main_cubit.dart';
import 'package:story_view_app/features/story/presentation/controllers/upload_story_cubit/upload_story_cubit.dart';
import 'core/network_info/network_info.dart';
import 'features/story/domain/usecases/upload_user_story_usecase.dart';
import 'features/story/presentation/controllers/story_cubit/story_cubit.dart';
import 'package:http/http.dart' as http;

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
  sl.registerFactory(() => MainCubit(getUserStoryDataUseCase: sl.call()));
  sl.registerFactory(() => UploadStoryCubit(uploadUserStoryUseCase: sl.call()));
  // useCase //////////////////////////////////////////////
  sl.registerLazySingleton(() => GetUserStoryDataUseCase(sl.call()));
  sl.registerLazySingleton(() => UploadUserStoryUseCase(sl.call()));
  // // repository ///////////////////////////////////////////
  sl.registerLazySingleton<StoryRepository>(() => StoryRepositoryImpl(
      networkInfo: sl.call(), storyRemoteDataSource: sl.call()));
  // // dataSource /////////////////////////////////////////////
  sl.registerLazySingleton<StoryRemoteDataSource>(
      () => StoryRemoteDataSourceImpWithHttp(client: sl.call()));
  // /////////////////////////////////////////////////////////
  // /////External////////////////////////////////////////////////////
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl.call()));
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
