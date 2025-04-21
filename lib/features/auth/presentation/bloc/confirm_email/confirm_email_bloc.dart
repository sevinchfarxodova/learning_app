import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learingn_app/features/auth/presentation/bloc/confirm_email/confirm_email_event.dart';
import 'package:learingn_app/features/auth/presentation/bloc/confirm_email/confirm_email_state.dart';

import '../../../data/data_sources/remote/aut_remote_data_source_impl.dart';

class ConfirmEmailBloc extends Bloc<ConfirmEmailEvent, ConfirmEmailState> {
  final AuthRemoteDataSourceImpl authRemoteDataSource;

  ConfirmEmailBloc({required this.authRemoteDataSource})
      : super(ConfirmEmailInitial()) {
    on<SendConfirmCodeEvent>(onSendConfirmCode);
  }

  Future<void> onSendConfirmCode(
      SendConfirmCodeEvent event, Emitter<ConfirmEmailState> emit) async {
    emit(ConfirmEmailLoading());

    try {
      final token = await authRemoteDataSource.confirmEmail(
        userId: event.userId,
        code: event.code,
      );
      emit(ConfirmEmailSuccess(token: token));
    } catch (e) {
      emit(ConfirmEmailFailure(error: e.toString()));
    }
  }
}
