import 'package:learingn_app/features/auth/domain/repository/auth_repo.dart';

class LoginUsecase {
  final AuthRepository authRepository;

  LoginUsecase(this.authRepository);

  Future call({required String email,required String password}) async {
    if (email.isEmpty ||
        password.isEmpty) {
      throw Exception('All fields must be non-empty');
    }
    return await authRepository.login(email: email, password: password);
  }
}
