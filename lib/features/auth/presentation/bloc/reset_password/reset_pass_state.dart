import 'package:equatable/equatable.dart';
import 'package:learingn_app/features/auth/domain/entity/reset_passw_entity.dart';

abstract class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object?> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {
  final ResetPasswordEntity resetPasswordEntity;

  const ResetPasswordSuccess({required this.resetPasswordEntity});

  @override
  List<Object?> get props => [resetPasswordEntity];
}

class ResetPasswordFailure extends ResetPasswordState {
  final String message;

  const ResetPasswordFailure(this.message);

  @override
  List<Object?> get props => [message];
}
