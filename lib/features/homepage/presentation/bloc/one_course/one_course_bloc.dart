import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learingn_app/features/homepage/domain/repository/home_repository.dart';
import '../home_event.dart';
import 'one_course_state.dart';

class SingleCourseBloc extends Bloc<HomeEvent, SingleCourseState> {
  final HomeRepository homeRepository;

  SingleCourseBloc(this.homeRepository) : super(SingleCourseInitial()) {
    on<GetSingleCourseEvent>(singleCourse);
  }

  Future<void> singleCourse(event, emit) async {
    emit(SingleCourseLoading());
    try {
      final course = await homeRepository.getSingleCourses(id: event.id);
      emit(SingleCourseLoaded(course: course));
    } catch (e) {
      emit(SingleCourseError(message: e.toString()));
    }
  }
}