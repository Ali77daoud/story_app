import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:story_view_app/controller/main_controller.dart';
import 'package:story_view_app/widget/thumbnail_widget.dart';
import '../models/story_model.dart';

class HomeStoryWidget extends StatelessWidget {
  final MediaType mediaType;
  final String url;
  final Function() onTap;
  final bool isShowed;
  final MainController mainController;
  final int index;

  const HomeStoryWidget({
    super.key,
    required this.mediaType,
    required this.url,
    required this.onTap,
    required this.isShowed,
    required this.mainController,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 160,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: mediaType == MediaType.video
                ? VideoThumbnailWidget(
                    videoPath: url,
                  )
                : netWorkImg(mainController),
          ),
          /////////////////////
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: onTap,
                child: gradientContainer(mainController)),
          ),
          /////////////////////

          ///////////////////
          Align(
            alignment: Alignment.topLeft,
            child: profileStoryImg(),
          )
        ],
      ),
    );
  }

  Widget netWorkImg(MainController mainController) {
    return AnimatedContainer(
      width: mainController.isExpanded(index) ? 140 : 100,
      height: mainController.isExpanded(index) ? 208 : 150,
      duration: const Duration(seconds: 1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.cover,
          progressIndicatorBuilder: (context, url, progress) {
            return const Center(
              child:
                  CircularProgressIndicator(color: Colors.grey, strokeWidth: 3),
            );
          },
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }

  Widget gradientContainer(MainController mainController) {
    return AnimatedContainer(
      width: mainController.isExpanded(index) ? 140 : 100,
      height: mainController.isExpanded(index) ? 208 : 150,
      duration: const Duration(seconds: 1),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black,
            Colors.black.withOpacity(0.15),
            Colors.transparent,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: 4),
          child: Text(
            'Name',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
    );
  }

  Widget profileStoryImg() {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: isShowed ? Colors.white : const Color(0xFFFFAB62),
              width: 1),
          shape: BoxShape.circle,
          image: const DecorationImage(
              image: AssetImage('assets/images/1.png'), fit: BoxFit.cover)),
    );
  }
}
