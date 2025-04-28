import 'package:learingn_app/features/auth/domain/entity/reset_passw_entity.dart';

class ResetPasswModel extends ResetPasswordEntity {
  ResetPasswModel({required super.userId, required super.message});

  factory ResetPasswModel.fromJson(Map<String, dynamic> json) =>
      ResetPasswModel(userId: json["user_id"], message: json["message"]);

  Map<String, dynamic> toJson() => {"user_id": userId, "message": message};
}
