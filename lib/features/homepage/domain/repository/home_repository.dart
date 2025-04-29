import 'package:learingn_app/features/homepage/domain/entity/response_mentor.dart';

import '../entity/course_response.dart';

abstract class HomeRepository {
  // mentors
  Future<ResponseMentor> topMentors({required int limit});

  Future<ResponseMentor> mentors({required int limit});

  // courses

  Future<CourseResponse> popularCourses({required int limit});
}
