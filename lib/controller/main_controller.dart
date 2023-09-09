import 'package:get/get.dart';

import '../models/story_image_expanded_model.dart';

class MainController extends GetxController {
  List<bool> isStoryShown = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  List<StoryExpandedModel> isStoryImgExpandedList = [];

  void showStory(int index) {
    isStoryShown[index] = true;
    update();
  }

  void addIsStoryImgExpanded(int index) {
    if (isStoryImgExpandedList.isEmpty) {
      print('isEmpty');
      isStoryImgExpandedList
          .add(StoryExpandedModel(index: index, isExpanded: true));
    } else {
      bool isValueInList =
          isStoryImgExpandedList.any((element) => element.index == index);

      if (isValueInList == false) {
        isStoryImgExpandedList
            .add(StoryExpandedModel(index: index, isExpanded: true));
        print('Value not In List');
      } else {
        print('Value In List');
        StoryExpandedModel result = isStoryImgExpandedList
            .firstWhere((element) => element.index == index);
        if (result.isExpanded) {
          isStoryImgExpandedList
              .firstWhere((element) => element.index == index)
              .isExpanded = false;
        } else {
          isStoryImgExpandedList
              .firstWhere((element) => element.index == index)
              .isExpanded = true;
        }
      }
    }

    update();
  }

  bool isExpanded(int index) {
    if (isStoryImgExpandedList.isEmpty) {
      return false;
    } else {
      bool isValueInList =
          isStoryImgExpandedList.any((element) => element.index == index);

      if (isValueInList) {
        StoryExpandedModel result = isStoryImgExpandedList
            .firstWhere((element) => element.index == index);
        return result.isExpanded;
      } else {
        return false;
      }
    }
  }
}
