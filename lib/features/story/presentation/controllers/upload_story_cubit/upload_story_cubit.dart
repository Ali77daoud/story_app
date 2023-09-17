import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:story_view_app/features/story/presentation/controllers/upload_story_cubit/upload_story_state.dart';
import 'package:video_player/video_player.dart';

class UploadStoryCubit extends Cubit<UploadStoryState> {
  @override
  Future<void> close() {
    // dispose
    debugPrint(
        '////////////////// UploadStoryCubit Closed //////////////////////////');
    videoController != null ? videoController!.dispose() : null;
    return super.close();
  }

  UploadStoryCubit() : super(UploadStoryInitialState());

  static UploadStoryCubit get(context) => BlocProvider.of(context);

  File? galleryFile;
  final picker = ImagePicker();
  VideoPlayerController? videoController;
  // bool isLoading = false;

  void showPicker({
    required BuildContext context,
    required bool isVideo,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  isVideo
                      ? getVideo(ImageSource.gallery, context)
                      : getImage(ImageSource.gallery, context);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  isVideo
                      ? getVideo(ImageSource.camera, context)
                      : getImage(ImageSource.camera, context);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future getVideo(ImageSource imgSource, BuildContext context) async {
    print('1');
    emit(const CheckVideoDurationLoadingState(isLoading: true));
    final pickedFile = await picker.pickVideo(
        source: imgSource,
        preferredCameraDevice: CameraDevice.front,
        maxDuration: const Duration(seconds: 5));

    XFile? xfilePick = pickedFile;

    if (xfilePick != null) {
      print('2');
      if (imgSource == ImageSource.gallery) {
        print('3');
        // emit(const CheckVideoDurationLoadingState(isLoading: true));
        videoController = VideoPlayerController.file(File(pickedFile!.path));
        videoController!.initialize().then((value) {
          if (videoController!.value.duration.inSeconds <= 50) {
            galleryFile = File(pickedFile.path);
            emit(const CheckVideoDurationLoadingState(isLoading: false));
            emit(ChooseVideoSuccessState(pickedFile: pickedFile.path));
          } else {
            emit(const CheckVideoDurationLoadingState(isLoading: false));
            emit(const SelectedVideoDurationFailedState());
          }
        });
      } else {
        print('Camera Video Selected');
        galleryFile = File(pickedFile!.path);
        emit(const CheckVideoDurationLoadingState(isLoading: false));
        emit(ChooseVideoSuccessState(pickedFile: pickedFile.path));
      }
    } else {
      emit(const CheckVideoDurationLoadingState(isLoading: false));
      emit(const NoVideoSelectedState());
    }
  }

  Future getImage(ImageSource img, BuildContext context) async {
    final pickedFile = await picker.pickImage(
      source: img,
      preferredCameraDevice: CameraDevice.front,
    );

    XFile? xfilePick = pickedFile;

    if (xfilePick != null) {
      galleryFile = File(pickedFile!.path);
      emit(ChooseImageSuccessState(pickedFile: pickedFile.path));
    } else {
      emit(const NoImageSelectedState());
    }
  }
}
