import 'package:learingn_app/features/auth/data/model/register_model.dart';
import 'package:learingn_app/features/auth/domain/entity/reset_passw_entity.dart';

import '../entity/token_entity.dart';

abstract class AuthRepository {
  Future<RegisterModel> registerWithEmail({
    required String email,
    required String password,
  });

  Future<TokenEntity> confirmEmail({
    required String userId,
    required String code,
    required bool isResetPassword,
  });

  Future<TokenEntity> login({required String email, required String password});

  Future<ResetPasswordEntity> resetPassword({required String phone_or_email});

  Future<void> createNewPassword({
    required String newPassword,
    required String token,
  });

  Future<void> saveTokens(String accessToken, String refreshToken);

  String? getAccessToken();

  String? getRefreshToken();
}
