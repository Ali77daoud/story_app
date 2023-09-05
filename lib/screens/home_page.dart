import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view_app/controller/main_controller.dart';
import 'package:story_view_app/models/story_model.dart';
import 'package:story_view_app/screens/story_view_screen.dart';
import '../data.dart';
import '../widget/thumbnail_widget.dart';

class HomePage extends StatelessWidget {
  final MainController mainController = Get.put(MainController());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Story View")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: ListView.builder(
                  itemCount: stories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(90),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StoryViewPage(
                                      index: index,
                                    )),
                          );
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ///////////
                            GetBuilder<MainController>(builder: (_) {
                              return Container(
                                width: 85,
                                height: 85,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            mainController.isStoryShown[index]
                                                ? Colors.grey
                                                : Colors.blue,
                                        width: 2),
                                    shape: BoxShape.circle),
                              );
                            }),

                            ///////////////////
                            stories[index].media == MediaType.video
                                ? VideoThumbnailWidget(
                                    videoPath: stories[index].url)
                                : Container(
                                    width: 75,
                                    height: 75,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      shape: BoxShape.circle,
                                    ),
                                    child: ClipOval(
                                      child: CachedNetworkImage(
                                        imageUrl: stories[index].url,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            /////////////////////
          ],
        ),
      ),
    );
  }
}
