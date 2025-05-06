import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learingn_app/core/utils/responsiveness/app_responsive.dart';
import 'package:learingn_app/features/auth/presentation/bloc/confirm_email/confirm_email_bloc.dart';
import 'package:learingn_app/features/auth/presentation/bloc/reset_new_password/new_passw_bloc.dart';
import 'package:learingn_app/features/auth/presentation/bloc/reset_password/reset_pass_bloc.dart';
import 'package:learingn_app/features/homepage/presentation/bloc/category/category_bloc.dart';
import 'package:learingn_app/features/homepage/presentation/bloc/courses/course_bloc.dart';
import 'package:learingn_app/features/homepage/presentation/bloc/search/search_bloc.dart';
import 'package:learingn_app/features/homepage/presentation/bloc/top_mentors/top_mentors_bloc.dart';

import 'core/di/service_locator.dart';
import 'core/routes/route_generator.dart';
import 'core/routes/route_names.dart';
import 'features/auth/presentation/bloc/register/sign_up_in_bloc.dart';
import 'features/homepage/presentation/bloc/mentors/mentors_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);
    return MultiBlocProvider(
      providers: [
        // auth
        BlocProvider<AuthBloc>(create: (context) => sl<AuthBloc>()),
        BlocProvider<ConfirmEmailBloc>(
          create: (context) => sl<ConfirmEmailBloc>(),
        ),
        BlocProvider<ResetPasswordBloc>(
          create: (context) => sl<ResetPasswordBloc>(),
        ),
        BlocProvider<NewPasswordBloc>(
          create: (context) => sl<NewPasswordBloc>(),
        ),

        // home
        BlocProvider<TopMentorsBloc>(create: (context) => sl<TopMentorsBloc>()),
        BlocProvider<MentorBloc>(create: (context) => sl<MentorBloc>()),
        BlocProvider<CoursesBloc>(create: (context) => sl<CoursesBloc>()),
        BlocProvider<CategoryBloc>(create: (context) => sl<CategoryBloc>()),
        BlocProvider<SearchBloc>(create: (context) => sl<SearchBloc>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(430, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: RouteNames.bottomNavBar,
            onGenerateRoute: AppRoute(context: context).onGenerateRoute,
          );
        },
      ),
    );
  }
}
