import 'package:learingn_app/features/homepage/domain/entity/response_mentor.dart';
import 'package:learingn_app/features/homepage/domain/repository/home_repository.dart';

class MentorsUseCase{
  final HomeRepository homeRepository;

  MentorsUseCase( this.homeRepository);

  Future <ResponseMentor>  call({required int limit})async{
    return await homeRepository.mentors(limit: limit);
  }
}