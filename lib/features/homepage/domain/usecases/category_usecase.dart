
import 'package:learingn_app/features/homepage/domain/repository/home_repository.dart';

import '../entity/category_response.dart';

class CategoryUseCase {
  HomeRepository homeRepository;

  CategoryUseCase(this.homeRepository);

  Future<CategoryResponse> call({required int limit}) async {
    return await homeRepository.getCategories(limit: limit);
  }
}