import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learingn_app/core/utils/responsiveness/app_responsive.dart';
import 'package:learingn_app/features/auth/presentation/bloc/confirm_email/confirm_email_bloc.dart';

import 'core/di/service_locator.dart';
import 'core/routes/route_generator.dart';
import 'core/routes/route_names.dart';
import 'features/auth/presentation/bloc/register/sign_up_in_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);
     return  MultiBlocProvider(
       providers: [
         BlocProvider<AuthBloc>(create: (context) => sl<AuthBloc>()),

         BlocProvider<ConfirmEmailBloc>(create: (context) => sl<ConfirmEmailBloc>()),
       ],
       child: ScreenUtilInit(
           designSize: const Size(430, 812),
           minTextAdapt: true,
           splitScreenMode: true,
           builder: (context, child) {
           return  MaterialApp(
               debugShowCheckedModeBanner: false,
                   initialRoute: RouteNames.screen2,
                   onGenerateRoute: AppRoute(context: context).onGenerateRoute,
                 );
           },

       ),
     );
  }
}