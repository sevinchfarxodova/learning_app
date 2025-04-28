import 'package:learingn_app/features/auth/domain/entity/reset_passw_entity.dart';
import 'package:learingn_app/features/auth/domain/repository/auth_repo.dart';

class ResetPasswordUseCase{
 final AuthRepository authRepository;

 ResetPasswordUseCase({required this.authRepository});

 Future<ResetPasswordEntity> call({required String phone_or_email})async{
   return await authRepository.resetPassword(phone_or_email: phone_or_email);
 }
}