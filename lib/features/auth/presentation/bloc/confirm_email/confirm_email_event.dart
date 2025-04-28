import 'package:equatable/equatable.dart';

abstract class ConfirmEmailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SendConfirmCodeEvent extends ConfirmEmailEvent {
  final String userId;
  final String code;
  final bool isResetPassword;

  SendConfirmCodeEvent({
    required this.userId,
    required this.code,
    required this.isResetPassword
  });

  @override
  List<Object?> get props => [userId, code];
}
