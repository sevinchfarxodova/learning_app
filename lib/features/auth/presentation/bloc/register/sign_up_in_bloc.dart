import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learingn_app/features/auth/domain/repository/auth_repo.dart';
import 'package:learingn_app/features/auth/presentation/bloc/register/sign_up_in_event.dart';
import 'package:learingn_app/features/auth/presentation/bloc/register/sign_up_in_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitialState()) {
    on<RegisterWithEmailEvent>(registerWithEmail);
    on<LoginWithEmailEvent>(logIn);
  }

  Future<void> registerWithEmail(
    RegisterWithEmailEvent event,
    Emitter<AuthState> emit,
  ) async {
      emit(AuthLoadingState());

      try {
        final response = await authRepository.registerWithEmail(
          email: event.email,
          password: event.password,
        );
        emit(AuthSuccessState(data: response));
      } catch (e) {
        emit(AuthErrorState(error: e.toString()));
      }

  }

  Future<void> logIn(
      LoginWithEmailEvent event,
      Emitter<AuthState> emit,
      ) async {
    emit(AuthLoadingState());

    try {
      final response = await authRepository.registerWithEmail(
        email: event.email,
        password: event.password,
      );
      emit(AuthSuccessState(data: response));
    } catch (e) {
      emit(AuthErrorState(error: e.toString()));
    }

  }
}
