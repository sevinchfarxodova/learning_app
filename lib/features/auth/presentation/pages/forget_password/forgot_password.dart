import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:learingn_app/features/auth/presentation/bloc/reset_password/reset_pass_bloc.dart';
import 'package:learingn_app/features/auth/presentation/bloc/reset_password/reset_pass_state.dart';
import 'package:learingn_app/features/auth/presentation/bloc/sign_up_in_event.dart';
import 'package:learingn_app/features/splash_page/presentation/widgets/long_button.dart';
import '../../../../../core/routes/route_names.dart';
import '../../widgets/text_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();

  void resetPassword() {
    context.read<ResetPasswordBloc>().add(
      ResetPasswordEvent(
        phone_or_email: _emailController.text.trim(),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Forgot Password",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 24.h,),
            Center(child: Image.asset("assets/images/forgor_password1.png")),
            SizedBox(height: 22.h,),
            Text(
              "Select which contact details should we use to reset your password.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 22.h,),
            TextFiledWidget1(
              text: 'Email',
              textEditingController: _emailController,
              prefixIcon: IconButton(
                icon: Icon(IconlyLight.message, color: Colors.grey),
                onPressed: () {},
              ),
              obsecure: false,
            ),
            SizedBox(height: 28.h,),
            BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
              listener: (context, state) {
                if (state is ResetPasswordSuccess) {
                  Navigator.pushNamed(context, RouteNames.otp,
                  arguments: state.resetPasswordEntity.userId);
                } else if (state is ResetPasswordFailure) {
                  print('Error state: ${state.message}');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is ResetPasswordLoading) {
                  return CircularProgressIndicator();
                }
                return LongButtonWg(
                  title: "Continue",
                  onPressed: () {
                    resetPassword();
                  },
                );
              },
            ),
          ],
        ),
      ),

    );
  }
}
