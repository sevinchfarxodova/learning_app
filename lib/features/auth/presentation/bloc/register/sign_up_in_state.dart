import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final Map<String, dynamic> data;

  AuthSuccessState({required this.data});

  @override
  List<Object?> get props => [data];
}

class AuthErrorState extends AuthState {
  final String error;

  AuthErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}
