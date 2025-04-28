import 'package:learingn_app/features/auth/data/model/register_model.dart';
import 'package:learingn_app/features/auth/data/model/reset_passw_model.dart';
import 'package:learingn_app/features/auth/data/model/token_model.dart';
import '../../../domain/entity/token_entity.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterModel> registerWithEmail({
    required String email,
    required String password,
  });

  Future<TokenEntity> confirmEmail({
    required String userId,
    required String code,
    required bool isResetPassword,
  });

  Future<TokenModel> login({required String email, required String password});

  Future<ResetPasswModel> resetPassword({required String phone_or_email});

  Future<void> createNewPassword({
    required String newPassword,
    required String token,
  });
}
