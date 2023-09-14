// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:story_view/story_view.dart';
// import '../../data.dart';
// import '../controller/main_controller.dart';
// import '../controller/story/story_controller.dart';
// import '../models/story_model.dart';

// class StoryViewPage extends StatelessWidget {
//   final StoryGetXController storyGetXController =
//       Get.find<StoryGetXController>();
//   final MainController mainController = Get.find<MainController>();
//   // final int index;
//   StoryViewPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     int currentIndex = Get.arguments[0];
//     print(currentIndex);
//     return Container(
//       color: Colors.white,
//       child: SafeArea(
//         child: WillPopScope(
//           onWillPop: () async {
//             Get.close(1);
//             return true;
//           },
//           child: Scaffold(body: GetBuilder<StoryGetXController>(builder: (_) {
//             return StoryView(
//               controller: storyGetXController.storyController,
//               storyItems: [
//                 for (int i = Get.arguments[0]; i < stories.length; i++)
//                   stories[i].media == MediaType.video
//                       ? StoryItem.pageVideo(stories[i].url,
//                           duration: stories[i].duration,
//                           controller: storyGetXController.storyController)
//                       : StoryItem.inlineImage(
//                           imageFit: BoxFit.contain,
//                           url: (stories[i].url),
//                           controller: storyGetXController.storyController,
//                           duration: stories[i].duration),
//               ],
//               onStoryShow: (s) async {
//                 await Future.delayed(const Duration(microseconds: 1));
//                 mainController.showStory(currentIndex);
//                 print(currentIndex);
//                 currentIndex += 1;
//               },
//               onComplete: () {
//                 print('Story Completed');
//               },
//               progressPosition: ProgressPosition.top,
//               repeat: false,
//               inline: true,
//             );
//           })),
//         ),
//       ),
//     );
//   }
// }
