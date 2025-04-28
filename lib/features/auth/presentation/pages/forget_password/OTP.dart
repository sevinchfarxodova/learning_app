import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/routes/route_names.dart';
import '../../../../splash_page/presentation/widgets/long_button.dart';
import '../../bloc/confirm_email/confirm_email_bloc.dart';
import '../../bloc/confirm_email/confirm_email_event.dart';
import '../../bloc/confirm_email/confirm_email_state.dart';
import '../create_profile/widgets/pin_box.dart';

class OTP extends StatefulWidget {
  final String userId;
  final String emailOrPhone;
  const OTP({super.key, required this.userId, required this.emailOrPhone});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  TextEditingController codeController =TextEditingController();

  void _confirmNewCode() {
    final code = codeController.text.trim();


    context.read<ConfirmEmailBloc>().add(
      SendConfirmCodeEvent(
        userId: widget.userId,
        code: code,
        isResetPassword: true,
      ),
    );
    print("userId: ${widget.userId}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Forgot Password",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Code has been send to +1 111 ******99.",
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400 ),
              ),
            ),
            const SizedBox(height: 80),
            BuildPinBoxWidget(controller: codeController,),
             SizedBox(height: 33.h),
            Text("Resend code in 55 s"),
             SizedBox(height: 80),

            BlocConsumer<ConfirmEmailBloc, ConfirmEmailState>(
              listener: (context, state) {
                if (state is ConfirmEmailSuccess) {
                  Navigator.pushNamed(context, RouteNames.newPassword);
                } else if (state is ConfirmEmailFailure) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.error)));
                }
              },
              builder: (context, state) {
                if (state is ConfirmEmailLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                return LongButtonWg(title: "Verify", onPressed: _confirmNewCode);
              },
            ),
          ],
        ),
      ),
    );
  }
}
