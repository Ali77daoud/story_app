import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:story_view_app/features/story/data/models/story_data_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/constants/api_constants.dart';
import 'package:http/http.dart' as http;

abstract class StoryRemoteDataSource {
  Future<StoryDataModel> getUserStoryApi();
  Future<Unit> uploadUserStoryApi(
      {required File mediaFile, required int isVideo});
}

class StoryRemoteDataSourceImpWithHttp implements StoryRemoteDataSource {
  final http.Client client;

  StoryRemoteDataSourceImpWithHttp({required this.client});

  @override
  Future<StoryDataModel> getUserStoryApi() async {
    final uri = Uri.parse('${ApiConstants.baseUrl}stories/users_stories');
    final response = await client.get(uri, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${ApiConstants.token}',
    });
    debugPrint('1');
    debugPrint(response.statusCode.toString());
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final data = jsonDecode(response.body);
      debugPrint('get user story data success');
      final resposeData = StoryDataModel.fromJson(data);
      return resposeData;
    } else {
      debugPrint('3');
      throw ServerException();
    }
  }

  @override
  Future<Unit> uploadUserStoryApi(
      {required File mediaFile, required int isVideo}) async {
    final uri = Uri.parse('${ApiConstants.baseUrl}stories/upload_story');

    var request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('file', mediaFile.path));

    request.headers.addAll({
      'Authorization': 'Bearer ${ApiConstants.token}',
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });

    request.fields['is_video'] = isVideo.toString();

    debugPrint('1');

    var response = await request.send();
    final responseData = await response.stream.transform(utf8.decoder).first;

    debugPrint(responseData.toString());
    debugPrint(response.statusCode.toString());

    if (response.statusCode >= 200 && response.statusCode < 300) {
      debugPrint('upload user story  success');
      return Future.value(unit);
    } else {
      debugPrint('3');
      throw ServerException();
    }
  }
}
