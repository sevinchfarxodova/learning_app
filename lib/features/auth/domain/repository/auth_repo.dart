
import 'package:learingn_app/features/auth/data/model/register_model.dart';

import '../entity/token_entity.dart';

abstract class AuthRepository {

  Future<RegisterModel> registerWithEmail({required String email,required String password});


  Future <TokenEntity> confirmEmail({required String userId, required String code});

  Future login({required String email,required String password});

}
