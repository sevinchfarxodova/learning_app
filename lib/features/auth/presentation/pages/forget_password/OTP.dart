import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/routes/route_names.dart';
import '../../../../splash_page/presentation/widgets/long_button.dart';
import '../create_profile/widgets/pin_box.dart';

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  TextEditingController passwordController =TextEditingController();
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
            BuildPinBoxWidget(controller: passwordController,),
             SizedBox(height: 33.h),
            Text("Resend code in 55 s"),
             SizedBox(height: 80),
            LongButtonWg(
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.newPassword);
              },
              title: 'Verify',
            ),
          ],
        ),
      ),
    );
  }
}
