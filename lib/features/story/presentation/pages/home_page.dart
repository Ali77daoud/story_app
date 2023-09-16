import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:story_view_app/features/story/presentation/controllers/main_cubit/main_cubit.dart';
import '../../../../main.dart';
import '../controllers/main_cubit/main_state.dart';
import '../widgets/home_story_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    MainCubit.get(context).getUserStories();
  }

  @override
  Widget build(BuildContext context) {
    final w1 = (MediaQuery.of(context).size.width) * (15 / 100);
    final w2 = (MediaQuery.of(context).size.width) * (5 / 100);
    final mainCubit = MainCubit.get(context);
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: buildNavBar(),
          body: BlocConsumer<MainCubit, MainState>(
            listener: (context, state) {
              if (state is MoveToStoryPageState) {
                context.pushNamed(
                  'story',
                );
              }
            },
            builder: (context, state) {
              if (state is GetUserStoriesLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GetUserStoriesErrorState) {
                return const Center(
                    child: Text('Connection Or Server Failure'));
              } else if (state is GetUserStoriesSuccessState ||
                  state is StoryImgExpandedState ||
                  state is ProfileImgExpandedState) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 0, bottom: 10, top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: SizedBox(
                            height: 21,
                            width: double.infinity,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return buildIcon(icon: iconList[index]);
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                      width: index == iconList.length - 2
                                          ? w1
                                          : w2);
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
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
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
                            itemCount:
                                mainCubit.userStoriesData!.data.data.length,
                            // stories.length,
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                width: 15,
                              );
                            },
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    right: index ==
                                            mainCubit.userStoriesData!.data.data
                                                    .length -
                                                1
                                        ? 10
                                        : 0),
                                child: HomeStoryWidget(
                                  mainCubit: mainCubit,
                                  isVideo: mainCubit.userStoriesData!.data
                                      .data[index].stories[0].isVideo,
                                  url: mainCubit.userStoriesData!.data
                                              .data[index].stories[0].isVideo ==
                                          1
                                      ? mainCubit.userStoriesData!.data
                                          .data[index].stories[0].fullVideoPath
                                      : mainCubit.userStoriesData!.data
                                          .data[index].stories[0].photoPath,
                                  isShowed: mainCubit.isStoryShown[index],
                                  index: index,
                                  onTap: () {
                                    mainCubit.addIsStoryImgExpanded(index);
                                    print('/////////////////////////');
                                    for (var element
                                        in mainCubit.isStoryImgExpandedList) {
                                      print(
                                          'index:${element.index} isEX: ${element.isExpanded}');
                                    }
                                  },
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          )),
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
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           InkWell(
//             onTap: () {
//               context.goNamed('story');
//             },
//             child: Container(
//               width: 50,
//               height: 60,
//               color: Colors.red,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
