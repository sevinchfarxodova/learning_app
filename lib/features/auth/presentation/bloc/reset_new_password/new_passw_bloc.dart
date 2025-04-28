import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learingn_app/features/auth/presentation/bloc/reset_new_password/new_passw_state.dart';
import 'package:learingn_app/features/auth/presentation/bloc/sign_up_in_event.dart';
import '../../../domain/repository/auth_repo.dart';

class NewPasswordBloc extends Bloc<AuthEvent, ResetNewPasswordState> {
  final AuthRepository authRepository;

  NewPasswordBloc(this.authRepository) : super(ResetNewPasswordInitial()) {
    on<ResetNewPasswordEvent>((event, emit) async {
      emit(ResetNewPasswordLoading());
      try {
        await authRepository.createNewPassword(
          newPassword: event.newPassword,
          token: event.token,
        );
        emit(ResetNewPasswordSuccess());
      } catch (e) {
        emit(ResetNewPasswordError(message: e.toString()));
      }
    });
  }
}
