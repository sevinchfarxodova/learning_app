import 'package:learingn_app/features/auth/domain/entity/register_entity.dart';

class RegisterModel extends RegisterEntity {
  RegisterModel({required super.userId, required super.authType});

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    userId: json["user_id"] ?? 0,
    authType: json["auth_type"] ?? "",
  );

  Map<String, dynamic> toJson() => {"user_id": userId, "auth_type": authType};
}
