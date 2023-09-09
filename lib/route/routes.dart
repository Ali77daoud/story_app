import 'package:get/get.dart';
import 'package:story_view_app/screens/story_view_screen.dart';
import '../controller/story/story_bindings.dart';
import '../screens/home_page.dart';

class Routes {
  static const homePage = '/homePage';
  static const storyPage = '/storyPage';
}

class AppRoutes {
  static final routes = [
    GetPage(
      name: Routes.homePage,
      page: () => HomePage(),
      // binding: MainBinding(),
    ),
    ////
    GetPage(
      name: Routes.storyPage,
      page: () => StoryViewPage(),
      binding: StoryBinding(),
    ),
  ];
}
