import 'package:learingn_app/features/auth/domain/repository/auth_repo.dart';

class NewPasswordResetUseCase{
  final AuthRepository authRepository;

  NewPasswordResetUseCase({required this.authRepository});

  Future<void> call({ required String newPassword,
    required String token,})async{
    return await authRepository.createNewPassword(newPassword: newPassword, token: token);
  }
}