import 'package:learingn_app/features/auth/data/model/register_model.dart';
import 'package:learingn_app/features/auth/domain/entity/register_entity.dart';

import '../../domain/entity/token_entity.dart';
import '../../domain/repository/auth_repo.dart';
import '../data_sources/remote/aut_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

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
  }) async {
    final model = await remoteDataSource.confirmEmail(
      code: code,
      userId: userId,
    );
    return model;
  }

  @override
  Future<void> login({required String email, required String password}) async {
    await remoteDataSource.login(email: email, password: password);
  }
}
