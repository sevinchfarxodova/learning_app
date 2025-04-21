import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:learingn_app/features/splash_page/presentation/widgets/long_button.dart';

import '../../../../../core/routes/route_names.dart';
import '../../widgets/select_sms_or_email.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String selectedOption = '';
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 24.h,),
            Center(child: Image.asset("assets/images/forgor_password1.png")),
            SizedBox(height: 22.h,),
            Text(
              "Select which contact details should we use to \nreset your password.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 22.h,),
            ContactOptionCard(
              icon: IconlyBold.chat,
              method: 'SMS',
              contact: '+1 111 ******99',
              isSelected: selectedOption == 'SMS',
              onTap: () {
                setState(() {
                  selectedOption = 'SMS';
                });
              },
            ),
            SizedBox(height: 8.h,),
            ContactOptionCard(
              icon: IconlyBold.message,
              method: 'Email',
              contact: 'and***ley@yourdomain.com',
              isSelected: selectedOption == 'Email',
              onTap: () {
                setState(() {
                  selectedOption = 'Email';
                });
              },
            ),
            SizedBox(height: 28.h,),
            LongButtonWg(title: "Continue", onPressed: (){
              Navigator.pushNamed(context, RouteNames.otp);

            }),
          ],
        ),
      ),

    );
  }
}
