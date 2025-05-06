import 'package:learingn_app/features/homepage/domain/repository/home_repository.dart';

import '../entity/search_reponse.dart';

class SearchUseCase {
  final HomeRepository homeRepository;

  SearchUseCase(this.homeRepository);

  Future<SearchResponse> call({required String query}) async {
    return await homeRepository.search(query: query);
  }
}