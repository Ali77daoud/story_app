import 'package:get/get.dart';

class MainController extends GetxController {
  List<bool> isStoryShown = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  void showStory(int index) {
    isStoryShown[index] = true;
    update();
  }
}
