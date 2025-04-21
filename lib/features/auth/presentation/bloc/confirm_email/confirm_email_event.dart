import 'package:equatable/equatable.dart';

abstract class ConfirmEmailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SendConfirmCodeEvent extends ConfirmEmailEvent {
  final String userId;
  final String code;

  SendConfirmCodeEvent({
    required this.userId,
    required this.code,
  });

  @override
  List<Object?> get props => [userId, code];
}
