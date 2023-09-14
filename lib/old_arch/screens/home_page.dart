// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../data.dart';
// import '../../main.dart';
// import '../controller/main_controller.dart';
// import '../widget/home_story_widget.dart';
// // import 'package:story_view_app/route/routes.dart';

// class HomePage extends StatelessWidget {
//   final MainController mainController = Get.put(MainController());
//   HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final w1 = (MediaQuery.of(context).size.width) * (15 / 100);
//     final w2 = (MediaQuery.of(context).size.width) * (5 / 100);
//     return SafeArea(
//       child: Scaffold(
//         bottomNavigationBar: buildNavBar(),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding:
//                 const EdgeInsets.only(left: 10, right: 0, bottom: 10, top: 30),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 20),
//                   child: SizedBox(
//                     height: 21,
//                     width: double.infinity,
//                     child: ListView.separated(
//                         scrollDirection: Axis.horizontal,
//                         shrinkWrap: true,
//                         itemBuilder: (context, index) {
//                           return buildIcon(icon: iconList[index]);
//                         },
//                         separatorBuilder: (context, index) {
//                           return SizedBox(
//                               width: index == iconList.length - 2 ? w1 : w2);
//                         },
//                         itemCount: iconList.length),
//                   ),
//                 ),
//                 /////////////////////
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 ////////////////////
//                 Padding(
//                   padding: const EdgeInsets.only(left: 20),
//                   child: Row(
//                     children: [
//                       buildIcon(icon: 'assets/images/reels.png'),
//                       const SizedBox(
//                         width: 7,
//                       ),
//                       const Text(
//                         'Reels',
//                         style: TextStyle(fontSize: 14, color: Colors.black),
//                       ),
//                     ],
//                   ),
//                 ),
//                 /////////////////////
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 ////////////////////
//                 SizedBox(
//                   height: 218,
//                   child: ListView.separated(
//                     shrinkWrap: true,
//                     scrollDirection: Axis.horizontal,
//                     itemCount: stories.length,
//                     separatorBuilder: (context, index) {
//                       return const SizedBox(
//                         width: 15,
//                       );
//                     },
//                     itemBuilder: (context, index) {
//                       return GetBuilder<MainController>(builder: (_) {
//                         return Padding(
//                           padding: EdgeInsets.only(
//                               right: index == stories.length - 1 ? 10 : 0),
//                           child: HomeStoryWidget(
//                             mainController: mainController,
//                             mediaType: stories[index].media,
//                             url: stories[index].url,
//                             isShowed: mainController.isStoryShown[index],
//                             index: index,
//                             onTap: () {
//                               mainController.addIsStoryImgExpanded(index);
//                               print('/////////////////////////');
//                               mainController.isStoryImgExpandedList
//                                   .forEach((element) {
//                                 print(
//                                     'index:${element.index} isEX: ${element.isExpanded}');
//                               });

//                               // Get.toNamed(Routes.storyPage, arguments: [index]);
//                             },
//                           ),
//                         );
//                       });
//                     },
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   BottomNavigationBar buildNavBar() {
//     return BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//               icon: buildNavIcon(
//                   img: 'assets/images/trydos.png',
//                   width: 45,
//                   title1: 'try',
//                   title2: 'dos'),
//               label: ''),
//           ////////////
//           BottomNavigationBarItem(
//               icon: buildNavIcon(
//                   img: 'assets/images/cart.png',
//                   width: 28,
//                   title1: '',
//                   title2: 'Cart'),
//               label: ''),
//           ////////////////////
//           BottomNavigationBarItem(
//               icon: buildNavIcon(
//                   img: 'assets/images/chat.png',
//                   width: 28,
//                   title1: '',
//                   title2: 'Chat'),
//               label: ''),
//           ////////////////////
//           BottomNavigationBarItem(
//               icon: buildNavIcon(
//                   img: 'assets/images/profile.png',
//                   width: 28,
//                   title1: '',
//                   title2: 'Me'),
//               label: ''),
//         ],
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         currentIndex: 0,
//         elevation: 10,
//         type: BottomNavigationBarType.fixed,
//         onTap: (index) async {});
//   }

//   Column buildNavIcon(
//       {required String img,
//       required double width,
//       required String title1,
//       required String title2}) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Image.asset(
//           img,
//           width: width,
//         ),
//         /////////
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               title1,
//               style: const TextStyle(
//                   color: Colors.black, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               title2,
//               style: const TextStyle(
//                   color: Colors.black, fontWeight: FontWeight.normal),
//             )
//           ],
//         )
//       ],
//     );
//   }

//   Container buildIcon({required String icon}) {
//     return Container(
//       width: 20,
//       height: 20,
//       decoration:
//           BoxDecoration(image: DecorationImage(image: AssetImage(icon))),
//     );
//   }
// }
