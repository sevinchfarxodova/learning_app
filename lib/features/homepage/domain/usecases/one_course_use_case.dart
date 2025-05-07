import 'package:learingn_app/features/homepage/domain/repository/home_repository.dart';

import '../entity/course.dart';

class SingleCourseUseCase {
  final HomeRepository homeRepository;

  SingleCourseUseCase(this.homeRepository);

  Future<Course> call({required int courseId}) async {
    return await homeRepository.getSingleCourses(id: courseId);
  }
}
