import 'package:learingn_app/features/homepage/domain/entity/response_mentor.dart';
import 'package:learingn_app/features/homepage/domain/repository/home_repository.dart';

class TopMentorsUseCase{
  final HomeRepository homeRepository;

  TopMentorsUseCase( this.homeRepository);

  Future <ResponseMentor>  call({required int limit})async{
    return await homeRepository.topMentors(limit: limit);
  }
}