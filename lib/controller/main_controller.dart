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
  List<StoryExpandedModel> isProfileImgExpandedList = [];

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
          ////////////
          bool isProfileValueInList =
              isProfileImgExpandedList.any((element) => element.index == index);
          if (isProfileValueInList) {
            isProfileImgExpandedList
                .firstWhere((element) => element.index == index)
                .isExpanded = false;
          }
        } else {
          isStoryImgExpandedList
              .firstWhere((element) => element.index == index)
              .isExpanded = true;
        }
      }
    }

    update();
  }

  bool isStoryImgExpanded(int index) {
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

  void addIsProfileImgExpanded(int index) {
    if (isProfileImgExpandedList.isEmpty) {
      print('isEmpty');
      isProfileImgExpandedList
          .add(StoryExpandedModel(index: index, isExpanded: true));
    } else {
      bool isValueInList =
          isProfileImgExpandedList.any((element) => element.index == index);

      if (isValueInList == false) {
        isProfileImgExpandedList
            .add(StoryExpandedModel(index: index, isExpanded: true));
        print('Value not In List');
      } else {
        print('Value In List');
        StoryExpandedModel result = isProfileImgExpandedList
            .firstWhere((element) => element.index == index);
        if (result.isExpanded) {
          isProfileImgExpandedList
              .firstWhere((element) => element.index == index)
              .isExpanded = false;
        } else {
          isProfileImgExpandedList
              .firstWhere((element) => element.index == index)
              .isExpanded = true;
        }
      }
    }
    update();
  }

  bool isProfileImgExpanded(int index) {
    if (isProfileImgExpandedList.isEmpty) {
      return false;
    } else {
      bool isValueInList =
          isProfileImgExpandedList.any((element) => element.index == index);

      if (isValueInList) {
        StoryExpandedModel result = isProfileImgExpandedList
            .firstWhere((element) => element.index == index);
        return result.isExpanded;
      } else {
        return false;
      }
    }
  }
}
