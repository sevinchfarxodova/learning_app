import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learingn_app/core/database/local/hive_auth.dart';
import 'package:learingn_app/features/auth/domain/repository/auth_repo.dart';
import 'package:learingn_app/features/auth/presentation/bloc/confirm_email/confirm_email_event.dart';
import 'package:learingn_app/features/auth/presentation/bloc/confirm_email/confirm_email_state.dart';

class ConfirmEmailBloc extends Bloc<ConfirmEmailEvent, ConfirmEmailState> {
  final AuthRepository authRepository;
  final AuthLocalDataSource authLocalDataSource;

  ConfirmEmailBloc({ required this.authRepository, required this.authLocalDataSource,})
      : super(ConfirmEmailInitial()) {
    on<SendConfirmCodeEvent>(onSendConfirmCode);
  }

  Future<void> onSendConfirmCode(
      SendConfirmCodeEvent event, Emitter<ConfirmEmailState> emit) async {
    emit(ConfirmEmailLoading());

    try {
      final token = await authRepository.confirmEmail(
        userId: event.userId,
        code: event.code, isResetPassword: event.isResetPassword,
        //
      );
      await authLocalDataSource.saveTokens(token.accessToken, token.refreshToken);
      emit(ConfirmEmailSuccess(token: token));
    }
    catch (e) {
      emit(ConfirmEmailFailure(error: e.toString()));
    }
  }
}
