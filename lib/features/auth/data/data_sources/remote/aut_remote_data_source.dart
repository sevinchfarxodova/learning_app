import '../../../domain/entity/token_entity.dart';

abstract class AuthRemoteDataSource{
  Future<void> registerWithEmail({required String email,required String password});
  Future <TokenEntity> confirmEmail({required String userId, required String code});
  Future<void> login({required String email,required String password});

}