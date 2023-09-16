import 'package:cloudinary_flutter/cloudinary_context.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'core/bloc_observer.dart';
import 'core/route/routes.dart';
import 'features/story/presentation/controllers/main_cubit/main_cubit.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /////////////////
  await di.init();
  //////////////////////////////////////////////////////////////////
  await GetStorage.init('MemoryImage');
  //////////////////////////////////////////////////////////////////
  Bloc.observer = MyBlocObserver();
////////////////////////////////////////////////////////////////////
  CloudinaryContext.cloudinary =
      Cloudinary.fromCloudName(cloudName: 'djooohujg');

  runApp(const MyApp());
}

final GetStorage memoryImgBox = GetStorage('MemoryImage');

final List<String> iconList = [
  'assets/images/person.png',
  'assets/images/woman.png',
  'assets/images/child.png',
  'assets/images/home-2.png',
  'assets/images/aa.png',
  'assets/images/home.png',
  'assets/images/search.png',
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<MainCubit>()),
      ],
      child: MaterialApp.router(
        title: 'Story App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: router,
      ),
    );
  }
}
