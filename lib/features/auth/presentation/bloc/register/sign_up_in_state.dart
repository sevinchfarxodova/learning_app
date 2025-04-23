import 'package:equatable/equatable.dart';
import 'package:learingn_app/features/auth/domain/entity/register_entity.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final RegisterEntity registerEntity;

  AuthSuccessState({required this.registerEntity});

  @override
  List<Object?> get props => [registerEntity];
}

class AuthErrorState extends AuthState {
  final String error;

  AuthErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}
