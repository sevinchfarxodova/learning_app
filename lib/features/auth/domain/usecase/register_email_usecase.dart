import 'package:learingn_app/features/auth/domain/entity/register_entity.dart';
import 'package:learingn_app/features/auth/domain/repository/auth_repo.dart';

class RegisterWithEmailUseCase {
  final AuthRepository authRepository;

  RegisterWithEmailUseCase(this.authRepository);

  Future<RegisterEntity> call({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      throw Exception('All fields must be non-empty');
    }
    return await authRepository.registerWithEmail(
      email: email,
      password: password,
    );
  }
}
