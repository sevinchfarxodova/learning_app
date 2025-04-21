import 'package:learingn_app/features/auth/domain/repository/auth_repo.dart';

import '../entity/token_entity.dart';

class ConfirmEmailUseCase {
  final AuthRepository authRepository;

  ConfirmEmailUseCase(this.authRepository);

  Future<TokenEntity> call({required String userId, required String code}) async {
    if (userId.isEmpty ||
        code.isEmpty) {
      throw Exception('All fields must be non-empty');
    }
    return await authRepository.confirmEmail(userId: userId, code: code);
  }
}
