import 'package:equatable/equatable.dart';

 class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterWithEmailEvent extends AuthEvent {
  final String email;
  final String password;

  RegisterWithEmailEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class LoginWithEmailEvent extends AuthEvent {
  final String email;
  final String password;

  LoginWithEmailEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class ResetPasswordEvent extends AuthEvent {
  final String phone_or_email;

  ResetPasswordEvent({ required this.phone_or_email});

  @override
  List<Object?> get props => [phone_or_email];
}

class ResetNewPasswordEvent extends AuthEvent {
  final String newPassword;
  final String token;

  ResetNewPasswordEvent({required this.newPassword, required this.token});

  @override
  List<Object?> get props => [newPassword, token];
}






