import 'package:dartz/dartz.dart';
import 'package:story_view_app/features/story/domain/entities/story_data_entity.dart';
import '../../../../core/errors/failures.dart';

abstract class StoryRepository {
  Future<Either<Failure, StoryDataEntity>> getUserStories();
}
