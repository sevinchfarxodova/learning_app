// data/models/token_model.dart

import '../../domain/entity/token_entity.dart';

class TokenModel extends TokenEntity {
  const TokenModel({
    required super.accessToken,
    required super.refreshToken,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      accessToken: json['accessToken'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
    );
  }


}
