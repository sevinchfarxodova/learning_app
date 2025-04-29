import 'package:bloc/bloc.dart';
import 'package:learingn_app/features/homepage/domain/repository/home_repository.dart';
import 'package:learingn_app/features/homepage/presentation/bloc/courses/course_state.dart';
import 'package:learingn_app/features/homepage/presentation/bloc/home_event.dart';

class CoursesBloc extends Bloc<HomeEvent, CourseState> {
  final HomeRepository homeRepository;

  CoursesBloc(this.homeRepository) : super(CourseInitial()) {
    on<GetPopularCoursesEvent>(getCourses);
  }

  Future<void> getCourses(event, emit) async {
    emit(CourseLoading());
    try {
      final courses = await homeRepository.popularCourses(limit: event.limit);
      emit(CourseLoaded(courses: courses));
    } catch (e) {
      emit(CourseError(message: e.toString()));
    }
  }
}
