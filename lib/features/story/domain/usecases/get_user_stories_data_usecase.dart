import 'package:dartz/dartz.dart';
import 'package:story_view_app/core/errors/failures.dart';
import 'package:story_view_app/features/story/domain/entities/story_data_entity.dart';

import '../repositories/story_repository.dart';

class GetUserStoryDataUseCase {
  final StoryRepository storyRepository;

  GetUserStoryDataUseCase(this.storyRepository);

  Future<Either<Failure, StoryDataEntity>> call() async {
    return await storyRepository.getUserStories();
  }
}
