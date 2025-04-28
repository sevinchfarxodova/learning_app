import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:learingn_app/core/database/local/hive_auth.dart';
import 'package:learingn_app/features/auth/domain/usecase/confirm_email_use_case.dart';
import 'package:learingn_app/features/auth/domain/usecase/login_usecase.dart';
import 'package:learingn_app/features/auth/domain/usecase/new_passw_reset.dart';
import 'package:learingn_app/features/auth/domain/usecase/reset_password_usecase.dart';
import 'package:learingn_app/features/auth/presentation/bloc/confirm_email/confirm_email_bloc.dart';
import 'package:learingn_app/features/auth/presentation/bloc/register/sign_up_in_bloc.dart';
import 'package:learingn_app/features/auth/presentation/bloc/reset_new_password/new_passw_bloc.dart';
import 'package:learingn_app/features/auth/presentation/bloc/reset_password/reset_pass_bloc.dart';

import '../../features/auth/data/data_sources/remote/aut_remote_data_source.dart';
import '../../features/auth/data/data_sources/remote/aut_remote_data_source_impl.dart';
import '../../features/auth/data/repositories/auth_repo_impl.dart';
import '../../features/auth/domain/repository/auth_repo.dart';
import '../../features/auth/domain/usecase/register_email_usecase.dart';
import '../network/dio_client.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Core
  sl.registerSingleton<DioClient>(DioClient());

  // Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(dioClient: sl<DioClient>()),
  );

  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(box: Hive.box('authBox')),
  );

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl<AuthRemoteDataSource>(),
      authLocalDataSource: sl<AuthLocalDataSource>(),
    ),
  );

  // use Case
  sl.registerLazySingleton<RegisterWithEmailUseCase>(
    () => RegisterWithEmailUseCase(sl<AuthRepository>()),
  );

  sl.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(sl<AuthRepository>()),
  );

  sl.registerLazySingleton<ConfirmEmailUseCase>(
    () => ConfirmEmailUseCase(sl<AuthRepository>()),
  );

  sl.registerLazySingleton<ResetPasswordUseCase>(
    () => ResetPasswordUseCase(authRepository: sl<AuthRepository>()),
  );

  sl.registerLazySingleton<NewPasswordResetUseCase>(
        () => NewPasswordResetUseCase(authRepository: sl<AuthRepository>()),
  );

  // bloc

  sl.registerFactory<AuthBloc>(
    () => AuthBloc(authRepository: sl<AuthRepository>()),
  );

  sl.registerFactory<ResetPasswordBloc>(
        () => ResetPasswordBloc(authRepository: sl<AuthRepository>()),
  );

  sl.registerFactory<NewPasswordBloc>(
        () => NewPasswordBloc( sl<AuthRepository>()),
  );

  sl.registerFactory<ConfirmEmailBloc>(
    () => ConfirmEmailBloc(
      authRepository: sl<AuthRepository>(),
      authLocalDataSource: sl<AuthLocalDataSource>(),
    ),
  );
}
