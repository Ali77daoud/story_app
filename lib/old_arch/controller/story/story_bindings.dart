import 'package:get/get.dart';
import 'package:story_view_app/old_arch/controller/story/story_controller.dart';

class StoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoryGetXController>(() => StoryGetXController());
  }
}
