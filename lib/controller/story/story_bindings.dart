import 'package:get/get.dart';
import 'package:story_view_app/controller/story/story_controller.dart';

class StoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoryGetXController>(() => StoryGetXController());
  }
}
