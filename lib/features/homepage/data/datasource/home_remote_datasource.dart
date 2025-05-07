import 'package:learingn_app/features/homepage/data/model/response_courses_model.dart';
import 'package:learingn_app/features/homepage/data/model/response_mentor_model.dart';

import '../../domain/entity/search_reponse.dart';
import '../model/category_response_model.dart';
import '../model/course_model.dart';

abstract class HomeRemoteDataSource {
  //   MENTORS
  Future<MentorsResponseModel> topMentors({required int limit});

  Future<MentorsResponseModel> mentors({required int limit});

  // COURSES
  Future<CoursesResponseModel> popularCourses({required int limit});

  Future<CourseModel> getSingleCourses({required int id});


  // Category
  Future<CategoryResponseModel> getCategories({required int limit});

  // Search
  Future<SearchResponse> search({required String query});


}
