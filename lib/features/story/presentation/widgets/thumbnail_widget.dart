import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:story_view_app/main.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../controllers/main_cubit/main_cubit.dart';

class VideoThumbnailWidget extends StatefulWidget {
  final String videoPath;
  final MainCubit mainCubit;
  final int index;

  const VideoThumbnailWidget(
      {super.key,
      required this.videoPath,
      required this.mainCubit,
      required this.index});

  @override
  // ignore: library_private_types_in_public_api
  _VideoThumbnailWidgetState createState() => _VideoThumbnailWidgetState();
}

class _VideoThumbnailWidgetState extends State<VideoThumbnailWidget> {
  late Future<Uint8List?> _thumbnailFuture;

  @override
  void initState() {
    super.initState();
    _thumbnailFuture = generateThumbnail(widget.videoPath);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: _thumbnailFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          memoryImgBox.read(widget.videoPath) == null
              ? memoryImgBox.write(widget.videoPath, snapshot.data!)
              : null;
          return Container(
            width:
                widget.mainCubit.isStoryImgExpanded(widget.index) ? 140 : 100,
            height:
                widget.mainCubit.isStoryImgExpanded(widget.index) ? 208 : 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: MemoryImage(snapshot.data!),
                fit: BoxFit.cover,
              ),
            ),
          );
        } else {
          return Container(
              width:
                  // widget.mainController.isStoryImgExpanded(widget.index)
                  //     ? 140
                  //     :
                  100,
              height:
                  //  widget.mainController.isStoryImgExpanded(widget.index)
                  //     ? 208
                  //     :
                  150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                  child: CircularProgressIndicator(
                color: Colors.grey,
              ))); // or any other loading indicator
        }
      },
    );
  }

  Future<Uint8List?> generateThumbnail(String videoPath) async {
    var data = memoryImgBox.read(videoPath);
    final uint8list = data == null
        ? await VideoThumbnail.thumbnailData(
            video: videoPath,
            imageFormat: ImageFormat.JPEG,
            // maxHeight: 150,
            // maxWidth: 100, // Adjust as needed
            quality: 50, // Adjust as needed
          )
        : Uint8List.fromList(data.cast<int>());
    return uint8list;
  }
}
