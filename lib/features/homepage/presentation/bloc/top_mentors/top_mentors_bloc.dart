import 'package:bloc/bloc.dart';
import 'package:learingn_app/features/homepage/domain/repository/home_repository.dart';
import 'package:learingn_app/features/homepage/presentation/bloc/home_event.dart';
import 'package:learingn_app/features/homepage/presentation/bloc/top_mentors/top_mentors_state.dart';

class TopMentorsBloc extends Bloc<HomeEvent, TopMentorsState> {
  final HomeRepository homeRepository;

  TopMentorsBloc(this.homeRepository) : super(TopMentorsInitial()) {
    on<TopMentorsEvent>(topMentors);
  }

  Future<void> topMentors(event, emit) async {
    emit(TopMentorsLoading());
    try {
      final topMentors = await homeRepository.topMentors(limit: event.limit);
      emit(TopMentorsLoaded(mentors: topMentors));
    } catch (e) {
      emit(TopMentorsError(message: e.toString()));
    }
  }
}
