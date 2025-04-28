abstract class ApiUrls {
  static final baseURL = "https://manuchehra.pythonanywhere.com/api";
  static final login = "$baseURL/auth/login";
  static final register = "$baseURL/auth/register/";
  static final confirmEmail = "$baseURL/auth/confirm-email/";
  static final resetPassword = "$baseURL/auth/reset-password/";
  static final confirmNewPassword = "$baseURL/auth/reset-password/confirm-password/";
  static final confirmCode = "$baseURL/auth/reset-password/confirm-code/";
}
