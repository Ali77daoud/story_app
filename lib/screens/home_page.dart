import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view_app/controller/main_controller.dart';
import 'package:story_view_app/route/routes.dart';
import 'package:story_view_app/widget/home_story_widget.dart';
import '../data.dart';
import '../models/story_model.dart';
import '../utils/screen_size_utils.dart';

class HomePage extends StatelessWidget {
  final MainController mainController = Get.put(MainController());
  HomePage({super.key});

  final List<String> iconList = [
    'assets/images/person.png',
    'assets/images/woman.png',
    'assets/images/child.png',
    'assets/images/home-2.png',
    'assets/images/aa.png',
    'assets/images/home.png',
    'assets/images/search.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: buildNavBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 0, bottom: 10, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SizedBox(
                    height: 21,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return buildIcon(icon: iconList[index]);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: index == iconList.length - 2
                                ? getWidthInPercent(context, 15)
                                : getWidthInPercent(context, 5),
                          );
                        },
                        itemCount: iconList.length),
                  ),
                ),
                /////////////////////
                const SizedBox(
                  height: 40,
                ),
                ////////////////////
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      buildIcon(icon: 'assets/images/reels.png'),
                      const SizedBox(
                        width: 7,
                      ),
                      const Text(
                        'Reels',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                /////////////////////
                const SizedBox(
                  height: 10,
                ),
                ////////////////////
                SizedBox(
                  height: 218,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: stories.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 15,
                      );
                    },
                    itemBuilder: (context, index) {
                      return GetBuilder<MainController>(builder: (_) {
                        return
                            // Container(
                            //   width: 110,
                            //   height: 160,
                            //   color: Colors.red,
                            // );
                            HomeStoryWidget(
                          mainController: mainController,
                          mediaType: MediaType.image,
                          // stories[index].media,
                          url: stories[0].url,
                          isShowed: mainController.isStoryShown[index],
                          index: index,
                          onTap: () {
                            mainController.addIsStoryImgExpanded(index);
                            print('/////////////////////////');
                            mainController.isStoryImgExpandedList
                                .forEach((element) {
                              print(
                                  'index:${element.index} isEX: ${element.isExpanded}');
                            });

                            // Get.toNamed(Routes.storyPage, arguments: [index]);
                          },
                        );
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBar buildNavBar() {
    return BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: buildNavIcon(
                  img: 'assets/images/trydos.png',
                  width: 45,
                  title1: 'try',
                  title2: 'dos'),
              label: ''),
          ////////////
          BottomNavigationBarItem(
              icon: buildNavIcon(
                  img: 'assets/images/cart.png',
                  width: 28,
                  title1: '',
                  title2: 'Cart'),
              label: ''),
          ////////////////////
          BottomNavigationBarItem(
              icon: buildNavIcon(
                  img: 'assets/images/chat.png',
                  width: 28,
                  title1: '',
                  title2: 'Chat'),
              label: ''),
          ////////////////////
          BottomNavigationBarItem(
              icon: buildNavIcon(
                  img: 'assets/images/profile.png',
                  width: 28,
                  title1: '',
                  title2: 'Me'),
              label: ''),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 0,
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        onTap: (index) async {});
  }

  Column buildNavIcon(
      {required String img,
      required double width,
      required String title1,
      required String title2}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          img,
          width: width,
        ),
        /////////
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title1,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              title2,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.normal),
            )
          ],
        )
      ],
    );
  }

  Container buildIcon({required String icon}) {
    return Container(
      width: 20,
      height: 20,
      decoration:
          BoxDecoration(image: DecorationImage(image: AssetImage(icon))),
    );
  }
}
