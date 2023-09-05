import 'package:get/get.dart';
import 'package:story_view/story_view.dart';

class StoryGetXController extends GetxController {
  StoryController storyController = StoryController();

  @override
  void onClose() {
    super.onClose();

    storyController.dispose();
  }
}
