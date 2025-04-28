import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learingn_app/features/auth/domain/repository/auth_repo.dart';
import 'package:learingn_app/features/auth/presentation/bloc/reset_password/reset_pass_state.dart';
import 'package:learingn_app/features/auth/presentation/bloc/sign_up_in_event.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final AuthRepository authRepository;

    ResetPasswordBloc({required this.authRepository}) : super(ResetPasswordInitial()) {
    on<ResetPasswordEvent>(resetPassword);
  }

  Future<void> resetPassword(
      ResetPasswordEvent event,
      Emitter<ResetPasswordState> emit,
      ) async {
    emit(ResetPasswordLoading());

    try {
      final response = await authRepository.resetPassword(
        phone_or_email: event.phone_or_email,
      );
      emit(ResetPasswordSuccess( resetPasswordEntity: response));
    } catch (e) {
      emit(ResetPasswordFailure(e.toString()));
    }

  }

}
