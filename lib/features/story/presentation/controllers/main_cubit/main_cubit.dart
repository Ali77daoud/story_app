import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/story_image_expanded_model.dart';
import 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitialState());

  static MainCubit get(context) => BlocProvider.of(context);

  List<bool> isStoryShown = [
    false,
    false,
    false,
    false,
    false,
    // false,
  ];

  List<StoryExpandedModel> isStoryImgExpandedList = [];
  List<StoryExpandedModel> isProfileImgExpandedList = [];
  int currentIndex = 0;

  void showStory(int index) {
    isStoryShown[index] = true;
    emit(ShowStoryState(index: index));
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
          for (var element in isStoryImgExpandedList) {
            element.isExpanded = false;
          }
          // isStoryImgExpandedList
          //     .firstWhere((element) => element.index == index)
          //     .isExpanded = false;
          ////////////
          // bool isProfileValueInList =
          //     isProfileImgExpandedList.any((element) => element.index == index);
          if (isProfileImgExpandedList.isNotEmpty) {
            for (var element in isProfileImgExpandedList) {
              element.isExpanded = false;
            }
            // isProfileImgExpandedList
            //     .firstWhere((element) => element.index == index)
            //     .isExpanded = false;
          }
          /////////////////
          // Get.toNamed(Routes.storyPage, arguments: [index]);
          currentIndex = index;
          emit(MoveToStoryPageState(index: index));
        } else {
          isStoryImgExpandedList
              .firstWhere((element) => element.index == index)
              .isExpanded = true;
        }
      }
    }
    emit(StoryImgExpandedState(
        index: index,
        isEx: isStoryImgExpandedList
            .firstWhere((element) => element.index == index)
            .isExpanded));
    // update();
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
    emit(ProfileImgExpandedState(
        index: index,
        isEx: isProfileImgExpandedList
            .firstWhere((element) => element.index == index)
            .isExpanded));
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
