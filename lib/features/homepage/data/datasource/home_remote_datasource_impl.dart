import 'package:dio/dio.dart';
import 'package:learingn_app/core/constants/api_urls.dart';
import 'package:learingn_app/core/network/dio_client.dart';
import 'package:learingn_app/features/homepage/data/datasource/home_remote_datasource.dart';
import 'package:learingn_app/features/homepage/data/model/response_courses_model.dart';
import 'package:learingn_app/features/homepage/data/model/response_mentor_model.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource{
   DioClient dioClient = DioClient();
  HomeRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<MentorsResponseModel> mentors({required int limit})async {
    try{
      final response = await dioClient.get("${ApiUrls.mentors}$limit");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return MentorsResponseModel.fromJson(response.data);
      } else {
        throw Exception(_parseError(response));
      }
    } on DioException catch (e) {
      throw Exception(_parseDioError(e));
    }
   }

  @override
  Future<CoursesResponseModel> popularCourses({required int limit})async {
    try{
      final response = await dioClient.get("${ApiUrls.popularCourses}$limit");
      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return CoursesResponseModel.fromJson(response.data);
      } else {
        throw Exception(_parseError(response));
      }
    } on DioException catch (e) {
      throw Exception(_parseDioError(e));
    }
  }



  @override
  Future<MentorsResponseModel> topMentors({required int limit})async {
    try{
      final response = await dioClient.get("${ApiUrls.topMentors}$limit");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return MentorsResponseModel.fromJson(response.data);
      } else {
        throw Exception(_parseError(response));
      }
    } on DioException catch (e) {
      throw Exception(_parseDioError(e));
    }
  }















String _parseError(Response response) {
  try {
    final errorJson = response.data;
    return errorJson['message'] ?? 'Unknown error occurred';
  } catch (_) {
    return 'Server error: ${response.statusCode}';
  }
}

String _parseDioError(DioException e) {
  if (e.response != null && e.response!.data != null) {
    try {
      final errorJson = e.response!.data;
      return errorJson['message'] ?? 'Unknown error occurred';
    } catch (_) {
      return 'Server error: ${e.response?.statusCode}';
    }
  }
  return e.message ?? 'Network error occurred';
}
}