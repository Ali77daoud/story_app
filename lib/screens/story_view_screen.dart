import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view/story_view.dart';
import 'package:story_view_app/controller/main_controller.dart';
import 'package:story_view_app/controller/story_controller.dart';
import '../data.dart';
import '../models/story_model.dart';

class StoryViewPage extends StatelessWidget {
  final StoryGetXController storyGetXController =
      Get.put(StoryGetXController());
  final MainController mainController = Get.find<MainController>();
  final int index;
  StoryViewPage({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currentIndex = index;
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(body: GetBuilder<StoryGetXController>(builder: (_) {
          return StoryView(
            controller: storyGetXController.storyController,
            storyItems: [
              for (int i = index; i < stories.length; i++)
                stories[i].media == MediaType.video
                    ? StoryItem.pageVideo(stories[i].url,
                        duration: stories[i].duration,
                        controller: storyGetXController.storyController)
                    : StoryItem.inlineImage(
                        imageFit: BoxFit.contain,
                        url: (stories[i].url),
                        controller: storyGetXController.storyController,
                        duration: stories[i].duration),
            ],
            onStoryShow: (s) async {
              await Future.delayed(const Duration(microseconds: 1));
              mainController.showStory(currentIndex);
              print(currentIndex);
              currentIndex += 1;
            },
            onComplete: () {
              print('Story Completed');
            },
            progressPosition: ProgressPosition.top,
            repeat: false,
            inline: true,
          );
        })),
      ),
    );
  }
}
