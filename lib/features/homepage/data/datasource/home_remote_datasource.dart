import 'package:learingn_app/features/homepage/data/model/course_model.dart';
import 'package:learingn_app/features/homepage/data/model/response_courses_model.dart';
import 'package:learingn_app/features/homepage/data/model/response_mentor_model.dart';

abstract class HomeRemoteDataSource {
  //   MENTORS
  Future<MentorsResponseModel> topMentors({required int limit});

  Future<MentorsResponseModel> mentors({required int limit});

  // COURSES
  Future<CoursesResponseModel> popularCourses({required int limit});
}
