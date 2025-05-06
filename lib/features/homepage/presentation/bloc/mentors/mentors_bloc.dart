import 'package:bloc/bloc.dart';
import 'package:learingn_app/features/homepage/domain/repository/home_repository.dart';
import 'package:learingn_app/features/homepage/presentation/bloc/home_event.dart';
import 'package:learingn_app/features/homepage/presentation/bloc/mentors/mentors_state.dart';

class MentorBloc extends Bloc<MentorsEvent, MentorState>{
  final HomeRepository homeRepository;

  MentorBloc(this.homeRepository): super (MentorInitial()){
    on<MentorsEvent>(mentors);
  }

  Future<void> mentors(MentorsEvent event,Emitter<MentorState> emit) async{
    emit(MentorLoading());
    try{
      final mentors = await homeRepository.mentors(limit: event.limit);
      emit(MentorLoaded(mentors: mentors));
    }catch(e){
      emit(MentorError(message: e.toString()));
    }
  }
}