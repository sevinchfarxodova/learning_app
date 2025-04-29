abstract class ApiUrls {
  static final baseURL = "https://manuchehra.pythonanywhere.com/api";

  // AUTH
  static final login = "$baseURL/auth/login";
  static final register = "$baseURL/auth/register/";
  static final confirmEmail = "$baseURL/auth/confirm-email/";
  static final resetPassword = "$baseURL/auth/reset-password/";
  static final confirmNewPassword =
      "$baseURL/auth/reset-password/confirm-password/";
  static final confirmCode = "$baseURL/auth/reset-password/confirm-code/";

  // HOME
  // Mentors
  static final String mentors = '/mentors/?limit=';
  static final String topMentors = '/mentors/top/?limit=';

  // Courses
  static final String courses = '/courses/';
  static final String popularCourses = '/courses/popular/?limit=';

}
