import 'package:learingn_app/features/homepage/domain/entity/response_mentor.dart';
import '../entity/category_response.dart';
import '../entity/course.dart';
import '../entity/course_response.dart';
import '../entity/search_reponse.dart';

abstract class HomeRepository {
  // mentors
  Future<ResponseMentor> topMentors({required int limit});

  Future<ResponseMentor> mentors({required int limit});

  // courses

  Future<CourseResponse> popularCourses({required int limit});

  Future<Course> getSingleCourses({required int id});

  // Category
  Future<CategoryResponse> getCategories({required int limit});

  // Search
  Future<SearchResponse> search({required String query});


}
