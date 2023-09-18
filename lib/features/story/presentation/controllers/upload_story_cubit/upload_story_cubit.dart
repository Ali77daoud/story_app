import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:story_view_app/features/story/presentation/controllers/upload_story_cubit/upload_story_state.dart';
import 'package:video_player/video_player.dart';

import '../../../../../core/utils/failure_handling.dart';
import '../../../domain/usecases/upload_user_story_usecase.dart';

class UploadStoryCubit extends Cubit<UploadStoryState> {
  final UploadUserStoryUseCase uploadUserStoryUseCase;
  @override
  Future<void> close() {
    // dispose
    debugPrint(
        '////////////////// UploadStoryCubit Closed //////////////////////////');
    videoController != null ? videoController!.dispose() : null;
    return super.close();
  }

  UploadStoryCubit({required this.uploadUserStoryUseCase})
      : super(UploadStoryInitialState());

  static UploadStoryCubit get(context) => BlocProvider.of(context);

  File? galleryFile;
  final picker = ImagePicker();
  VideoPlayerController? videoController;
  int isVideo = 0;

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
    emit(const LoadingState(isLoading: true));
    final pickedFile = await picker.pickVideo(
        source: imgSource,
        preferredCameraDevice: CameraDevice.front,
        maxDuration: const Duration(seconds: 50));

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
            isVideo = 1;
            emit(const LoadingState(isLoading: false));
            emit(ChooseVideoSuccessState(pickedFile: pickedFile.path));
          } else {
            emit(const LoadingState(isLoading: false));
            emit(const SelectedVideoDurationFailedState());
          }
        });
      } else {
        print('Camera Video Selected');
        galleryFile = File(pickedFile!.path);
        isVideo = 1;
        emit(const LoadingState(isLoading: false));
        emit(ChooseVideoSuccessState(pickedFile: pickedFile.path));
      }
    } else {
      emit(const LoadingState(isLoading: false));
      emit(const NoMediaFileSelectedState());
    }
  }

  Future getImage(ImageSource img, BuildContext context) async {
    emit(const LoadingState(isLoading: true));
    final pickedFile = await picker.pickImage(
      source: img,
      preferredCameraDevice: CameraDevice.front,
    );

    XFile? xfilePick = pickedFile;

    if (xfilePick != null) {
      galleryFile = File(pickedFile!.path);
      isVideo = 0;
      emit(const LoadingState(isLoading: false));
      emit(ChooseImageSuccessState(pickedFile: pickedFile.path));
    } else {
      emit(const LoadingState(isLoading: false));
      emit(const NoMediaFileSelectedState());
    }
  }

  void uploadUserStory() async {
    emit(const LoadingState(isLoading: true));
    if (galleryFile != null) {
      final failureOrGetUserStories = await uploadUserStoryUseCase.call(
          mediaFile: galleryFile!, isVideo: isVideo);

      failureOrGetUserStories.fold((failure) {
        emit(UploadUserStoryErrorState(
            error: FailureHandling.mapFailureToMessage(failure)));
        emit(const LoadingState(isLoading: false));
      }, (unit) {
        emit(const UploadUserStorySuccessState());
        emit(const LoadingState(isLoading: false));
      });
    } else {
      emit(const LoadingState(isLoading: false));
      emit(const NoMediaFileSelectedState());
    }
  }
}
