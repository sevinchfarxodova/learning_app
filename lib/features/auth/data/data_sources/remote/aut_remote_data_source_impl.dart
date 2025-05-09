import 'package:dio/dio.dart';
import 'package:learingn_app/core/constants/api_urls.dart';
import 'package:learingn_app/core/network/dio_client.dart';
import 'package:learingn_app/features/auth/data/model/register_model.dart';
import 'package:learingn_app/features/auth/data/model/reset_passw_model.dart';
import '../../model/token_model.dart';
import 'aut_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient dioClient;

  AuthRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<RegisterModel> registerWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dioClient.post(
        ApiUrls.register,
        data: {'phone_or_email': email, 'password': password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return RegisterModel.fromJson(response.data);
      } else {
        throw Exception(_parseError(response));
      }
    } on DioException catch (e) {
      throw Exception(_parseDioError(e));
    }
  }

  @override
  Future<TokenModel> confirmEmail({
    required String userId,
    required String code,
    required bool isResetPassword,
  }) async {
    try {
      final response = await dioClient.post(
        isResetPassword ? ApiUrls.confirmEmail : ApiUrls.confirmCode,
        data: {'user_id': userId, 'code': code},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return TokenModel.fromJson(response.data);
      } else {
        throw Exception(_parseError(response));
      }
    } on DioException catch (e) {
      throw Exception(_parseDioError(e));
    }
  }

  @override
  Future<TokenModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dioClient.post(
        ApiUrls.login,
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return TokenModel.fromJson(response.data);
      } else {
        throw Exception(_parseError(response));
      }
    } on DioException catch (e) {
      throw Exception(_parseDioError(e));
    }
  }


  @override
  Future<ResetPasswModel> resetPassword(
      {required String phone_or_email}) async {
    try {
      final response = await dioClient.post(
          ApiUrls.resetPassword, data: {"phone_or_email": phone_or_email});
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ResetPasswModel.fromJson(response.data);
      } else {
        throw Exception(_parseError(response));
      }
    } on DioException catch (e) {
      throw Exception(_parseDioError(e));
    }
  }

  @override
  Future<void> createNewPassword(
      {required String newPassword, required String token}) async {
    dioClient.setToken(token);
    try {
      final response = await dioClient.post(ApiUrls.confirmNewPassword, data: {
        'password_one': newPassword});
      if (response.statusCode == 200 || response.statusCode == 201) {
        return print("Success");
      } else {
        throw Exception(_parseError(response));
      }
    } on DioException catch (e) {
      throw Exception(_parseDioError(e));
    }
  }


}

String _parseError(Response response) {
  try {
    final errorJson = response.data;
    return errorJson['message'] ?? 'Unknown error occurred';
  } catch (_) {
    return 'Server error: ${response.statusCode}';
  }
}

String _parseDioError(DioException e) {
  if (e.response != null && e.response!.data != null) {
    try {
      final errorJson = e.response!.data;
      return errorJson['message'] ?? 'Unknown error occurred';
    } catch (_) {
      return 'Server error: ${e.response?.statusCode}';
    }
  }
  return e.message ?? 'Network error occurred';
}


