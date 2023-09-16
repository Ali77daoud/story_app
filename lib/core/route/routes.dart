import 'package:go_router/go_router.dart';
import '../../features/story/presentation/pages/home_page.dart';
import '../../features/story/presentation/pages/story_view_page.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name:
          'home', // Optional, add name to your routes. Allows you navigate by name instead of path
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      name: 'story',
      path: '/story',
      builder: (context, state) => StoryViewPage(),
    ),
  ],
);
