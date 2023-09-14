import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:story_view_app/features/story/data/models/story_data_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/constants/api_constants.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

abstract class StoryRemoteDataSource {
  Future<StoryDataModel> getUserStoryApi();
}

class StoryRemoteDataSourceImpWithHttp implements StoryRemoteDataSource {
  late http.Client _client;

  http.Client get client => _client;
  @override
  Future<StoryDataModel> getUserStoryApi() async {
    final uri = Uri.parse('${ApiConstants.baseUrl}/stories/users_stories');
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
}
