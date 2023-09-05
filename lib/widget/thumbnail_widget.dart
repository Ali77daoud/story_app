import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:story_view_app/main.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class VideoThumbnailWidget extends StatefulWidget {
  final String videoPath;

  const VideoThumbnailWidget({super.key, required this.videoPath});

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
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              shape: BoxShape.circle,
              image: DecorationImage(
                image: MemoryImage(snapshot.data!),
                fit: BoxFit.cover,
              ),
            ),
          );
        } else {
          return Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                shape: BoxShape.circle,
              ),
              child:
                  const CircularProgressIndicator()); // or any other loading indicator
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
            maxHeight: 100, // Adjust as needed
            quality: 25, // Adjust as needed
          )
        : Uint8List.fromList(data.cast<int>());
    return uint8list;
  }
}
