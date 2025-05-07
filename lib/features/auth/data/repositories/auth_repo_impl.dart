import 'package:learingn_app/core/database/local/hive_auth.dart';
import 'package:learingn_app/features/auth/data/model/register_model.dart';
import 'package:learingn_app/features/auth/domain/entity/reset_passw_entity.dart';

import '../../domain/entity/token_entity.dart';
import '../../domain/repository/auth_repo.dart';
import '../data_sources/remote/aut_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  AuthRepositoryImpl({
    required this.authLocalDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<RegisterModel> registerWithEmail({
    required String email,
    required String password,
  }) {
    return remoteDataSource.registerWithEmail(email: email, password: password);
  }

  @override
  Future<TokenEntity> confirmEmail({
    required String code,
    required String userId,
    required bool isResetPassword,
  }) async {
    final model = await remoteDataSource.confirmEmail(
      code: code,
      userId: userId,
      isResetPassword: isResetPassword
    );
    return model;
  }

  @override
  Future<TokenEntity> login({
    required String email,
    required String password,
  }) async {
    return remoteDataSource.login(email: email, password: password);
  }

  @override
  Future<ResetPasswordEntity> resetPassword({required String phone_or_email})async {
   return remoteDataSource.resetPassword(phone_or_email: phone_or_email);
  }

  // save tokens
  @override
  String? getAccessToken() => authLocalDataSource.getAccessToken();

  @override
  String? getRefreshToken() => authLocalDataSource.getRefreshToken();

  @override
  Future<void> saveTokens(String accessToken, String refreshToken) {
    return authLocalDataSource.saveTokens(accessToken, refreshToken);
  }

  @override
  Future<void> createNewPassword({required String newPassword, required String token}) {
    return remoteDataSource.createNewPassword(newPassword: newPassword, token: token);
  }


}
