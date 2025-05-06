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
import 'package:learingn_app/features/homepage/data/datasource/home_remote_datasource.dart';
import 'package:learingn_app/features/homepage/data/datasource/home_remote_datasource_impl.dart';
import 'package:learingn_app/features/homepage/data/repository/home_repo.dart';
import 'package:learingn_app/features/homepage/domain/repository/home_repository.dart';
import 'package:learingn_app/features/homepage/domain/usecases/category_usecase.dart';
import 'package:learingn_app/features/homepage/domain/usecases/courses_usecase.dart';
import 'package:learingn_app/features/homepage/domain/usecases/mentors_usecase.dart';
import 'package:learingn_app/features/homepage/domain/usecases/search_usecase.dart';
import 'package:learingn_app/features/homepage/domain/usecases/top_mentors_usecase.dart';
import 'package:learingn_app/features/homepage/presentation/bloc/category/category_bloc.dart';
import 'package:learingn_app/features/homepage/presentation/bloc/courses/course_bloc.dart';
import 'package:learingn_app/features/homepage/presentation/bloc/mentors/mentors_bloc.dart';
import 'package:learingn_app/features/homepage/presentation/bloc/search/search_bloc.dart';
import 'package:learingn_app/features/homepage/presentation/bloc/top_mentors/top_mentors_bloc.dart';
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

  // DATA SOURCES
  // auth
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(dioClient: sl<DioClient>()),
  );

  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(box: Hive.box('authBox')),
  );
  // home
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(dioClient: sl<DioClient>()),
  );

  // REPOSITORIES
  //auth
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl<AuthRemoteDataSource>(),
      authLocalDataSource: sl<AuthLocalDataSource>(),
    ),
  );
  // home
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(homeRemoteDataSource: sl<HomeRemoteDataSource>()),
  );

  // USE CASES
  // auth
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


  // home
  sl.registerLazySingleton<TopMentorsUseCase>(
    () => TopMentorsUseCase(sl<HomeRepository>()),
  );

  sl.registerLazySingleton<MentorsUseCase>(
    () => MentorsUseCase(sl<HomeRepository>()),
  );

  sl.registerLazySingleton<CoursesUseCase>(
    () => CoursesUseCase(sl<HomeRepository>()),
  );


  sl.registerLazySingleton <CategoryUseCase>(
        () => CategoryUseCase(sl<HomeRepository>()),
  );


  sl.registerLazySingleton <SearchUseCase>(
        () => SearchUseCase(sl<HomeRepository>()),
  );

  //BLOCS
  //     auth

  sl.registerFactory<AuthBloc>(
    () => AuthBloc(authRepository: sl<AuthRepository>()),
  );

  sl.registerFactory<ResetPasswordBloc>(
    () => ResetPasswordBloc(authRepository: sl<AuthRepository>()),
  );

  sl.registerFactory<NewPasswordBloc>(
    () => NewPasswordBloc(sl<AuthRepository>()),
  );

  sl.registerFactory<ConfirmEmailBloc>(
    () => ConfirmEmailBloc(
      authRepository: sl<AuthRepository>(),
      authLocalDataSource: sl<AuthLocalDataSource>(),
    ),
  );

  //  home
  sl.registerLazySingleton<TopMentorsBloc>(
    () => TopMentorsBloc(sl<HomeRepository>()),
  );

  sl.registerLazySingleton<MentorBloc>(() => MentorBloc(sl<HomeRepository>()));

  sl.registerLazySingleton<CoursesBloc>(
    () => CoursesBloc(sl<HomeRepository>()),
  );

  sl.registerLazySingleton<CategoryBloc>(
        () => CategoryBloc(sl<HomeRepository>()),
  );

  sl.registerLazySingleton<SearchBloc>(
        () => SearchBloc(sl<HomeRepository>()),
  );

}
