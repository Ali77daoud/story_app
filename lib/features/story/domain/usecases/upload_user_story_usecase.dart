import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:story_view_app/core/errors/failures.dart';
import '../repositories/story_repository.dart';

class UploadUserStoryUseCase {
  final StoryRepository storyRepository;

  UploadUserStoryUseCase(this.storyRepository);

  Future<Either<Failure, Unit>> call(
      {required File mediaFile, required int isVideo}) async {
    return await storyRepository.uploadUserStory(
        mediaFile: mediaFile, isVideo: isVideo);
  }
}
