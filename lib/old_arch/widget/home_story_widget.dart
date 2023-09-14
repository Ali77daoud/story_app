// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:story_view_app/old_arch/widget/thumbnail_widget.dart';

// import '../controller/main_controller.dart';
// import '../models/story_model.dart';

// class HomeStoryWidget extends StatelessWidget {
//   final MediaType mediaType;
//   final String url;
//   final Function() onTap;
//   final bool isShowed;
//   final MainController mainController;
//   final int index;

//   const HomeStoryWidget({
//     super.key,
//     required this.mediaType,
//     required this.url,
//     required this.onTap,
//     required this.isShowed,
//     required this.mainController,
//     required this.index,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SizedBox(
//         width: mainController.isStoryImgExpanded(index) ? 150 : 110,
//         height: mainController.isStoryImgExpanded(index) ? 218 : 160,
//         child: Stack(
//           children: [
//             Align(
//               alignment: Alignment.bottomRight,
//               child: mediaType == MediaType.video
//                   ? VideoThumbnailWidget(
//                       videoPath: url,
//                       mainController: mainController,
//                       index: index,
//                     )
//                   : netWorkImg(mainController),
//             ),
//             /////////////////////
//             Align(
//               alignment: Alignment.bottomRight,
//               child: InkWell(
//                   borderRadius: BorderRadius.circular(20),
//                   onTap: onTap,
//                   child: gradientContainer(mainController)),
//             ),
//             /////////////////////

//             ///////////////////
//             Align(
//               alignment: Alignment.topLeft,
//               child: InkWell(
//                   borderRadius: BorderRadius.circular(100),
//                   onTap: mainController.isStoryImgExpanded(index)
//                       ? () {
//                           mainController.addIsProfileImgExpanded(index);
//                           print('/////////////////////////');
//                           mainController.isProfileImgExpandedList
//                               .forEach((element) {
//                             print(
//                                 'index:${element.index} isEX: ${element.isExpanded}');
//                           });
//                         }
//                       : null,
//                   child: profileStoryImg(mainController)),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget netWorkImg(MainController mainController) {
//     return AnimatedContainer(
//       width: mainController.isStoryImgExpanded(index) ? 140 : 100,
//       height: mainController.isStoryImgExpanded(index) ? 208 : 150,
//       duration: const Duration(milliseconds: 0),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(20),
//         child: CachedNetworkImage(
//           imageUrl: url,
//           fit: BoxFit.cover,
//           progressIndicatorBuilder: (context, url, progress) {
//             return const Center(
//               child:
//                   CircularProgressIndicator(color: Colors.grey, strokeWidth: 3),
//             );
//           },
//           errorWidget: (context, url, error) => const Icon(Icons.error),
//         ),
//       ),
//     );
//   }

//   Widget gradientContainer(MainController mainController) {
//     return AnimatedContainer(
//       width: mainController.isStoryImgExpanded(index) ? 140 : 100,
//       height: mainController.isStoryImgExpanded(index) ? 208 : 150,
//       duration: const Duration(milliseconds: 0),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.bottomCenter,
//           end: Alignment.topCenter,
//           colors: [
//             Colors.black,
//             Colors.black.withOpacity(0.15),
//             Colors.transparent,
//           ],
//         ),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: const Align(
//         alignment: Alignment.bottomCenter,
//         child: Padding(
//           padding: EdgeInsets.only(bottom: 4),
//           child: Text(
//             'Name',
//             style: TextStyle(color: Colors.white, fontSize: 12),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget profileStoryImg(MainController mainController) {
//     return Container(
//       width: mainController.isProfileImgExpanded(index)
//           ? 100
//           : mainController.isStoryImgExpanded(index)
//               ? 50
//               : 35,
//       height: mainController.isProfileImgExpanded(index)
//           ? 100
//           : mainController.isStoryImgExpanded(index)
//               ? 50
//               : 35,
//       decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(
//               color: isShowed ? Colors.white : const Color(0xFFFFAB62),
//               width: 1),
//           shape: BoxShape.circle,
//           image: const DecorationImage(
//               image: AssetImage('assets/images/1.png'), fit: BoxFit.cover)),
//     );
//   }
// }
