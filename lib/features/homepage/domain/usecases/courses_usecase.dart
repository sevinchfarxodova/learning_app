import 'package:learingn_app/features/homepage/domain/repository/home_repository.dart';
import '../entity/course_response.dart';

class CoursesUseCase {
  final HomeRepository homeRepository;

  CoursesUseCase(this.homeRepository);

  Future<CourseResponse> call({required int limit}) async {
    return await homeRepository.popularCourses(limit: limit);
  }
}
