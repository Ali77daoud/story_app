import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:story_view_app/core/errors/failures.dart';
import 'package:story_view_app/core/network_info/network_info.dart';
import 'package:story_view_app/features/story/domain/entities/story_data_entity.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/repositories/story_repository.dart';
import '../data_sources/story_remote_datasource.dart';

class StoryRepositoryImpl implements StoryRepository {
  final StoryRemoteDataSource storyRemoteDataSource;
  final NetworkInfo networkInfo;

  StoryRepositoryImpl(
      {required this.storyRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, StoryDataEntity>> getUserStories() async {
    if (await networkInfo.isConnected) {
      try {
        final getUserStoriesResponse =
            await storyRemoteDataSource.getUserStoryApi();
        return Right(getUserStoriesResponse);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> uploadUserStory(
      {required File mediaFile, required int isVideo}) async {
    if (await networkInfo.isConnected) {
      try {
        await storyRemoteDataSource.uploadUserStoryApi(
            mediaFile: mediaFile, isVideo: isVideo);
        return const Right(unit);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
