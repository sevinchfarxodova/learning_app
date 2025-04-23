import 'package:learingn_app/features/auth/data/model/register_model.dart';
import '../../../domain/entity/token_entity.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterModel> registerWithEmail({
    required String email,
    required String password,
  });

  Future<TokenEntity> confirmEmail({
    required String userId,
    required String code,
  });

  Future<void> login({required String email, required String password});
}
