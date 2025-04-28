import 'package:learingn_app/features/auth/domain/entity/register_entity.dart';

class RegisterModel extends RegisterEntity {
  RegisterModel({required super.userId});

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      RegisterModel(userId: json["user_id"] ?? 0);

  Map<String, dynamic> toJson() => {"user_id": userId};
}
