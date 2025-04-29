import 'package:learingn_app/features/homepage/data/datasource/home_remote_datasource.dart';
import 'package:learingn_app/features/homepage/data/model/response_courses_model.dart';
import 'package:learingn_app/features/homepage/domain/entity/response_mentor.dart';
import 'package:learingn_app/features/homepage/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository{
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<ResponseMentor> mentors({required int limit})async {
   return await homeRemoteDataSource.mentors(limit: limit);
  }

  @override
  Future<CoursesResponseModel> popularCourses({required int limit})async {
   return await homeRemoteDataSource.popularCourses(limit: limit);
  }

  @override
  Future<ResponseMentor> topMentors({required int limit})async {
    return await homeRemoteDataSource.topMentors(limit: limit);

  }
  
}