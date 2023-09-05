import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:story_view_app/screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init('MemoryImage');
  runApp(const MyApp());
}

final GetStorage memoryImgBox = GetStorage('MemoryImage');

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Story App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
