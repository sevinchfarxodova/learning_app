import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learingn_app/core/routes/route_names.dart';

import '../../../../../../core/constants/colors/app_colors.dart';
import '../widgets/alert_dialog.dart';
import '../widgets/bottom_button.dart';


class FingerPrintPage extends StatefulWidget {
  const FingerPrintPage({super.key});

  @override
  State<FingerPrintPage> createState() => _FingerPrintPageState();
}

class _FingerPrintPageState extends State<FingerPrintPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Set Your Fingerprint",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 35.h),
          Center(
            child: Text(
              "Add a fingerprint to make your account\n                 more secure.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: 45.h),
          Image.asset("assets/images/finger.png"),
          SizedBox(height: 66.h),
          Text(
            "Add a fingerprint to make your account\n                 more secure.",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 77.h),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  text: "Skip",
                  textColor: AppColors.blue,
                  backgroundColor: Color(0xffEBEFFE),
                  borderColor: Color(0xffEBEFFE),
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        Future.delayed(const Duration(seconds: 2), () {
                          Navigator.of(context).pop();
                        });

                        return CustomAlertDialog(
                          imagePath: 'assets/images/alert1.png',
                          title: 'Congratulations!',
                          subtitle:
                              'Your account is ready to use. You will be redirected to the Home page in a few seconds..',
                        );
                      },
                    );
                    Text("Show Dialog");
                  },
                ),

                CustomButton(
                  text: "Continue",
                  textColor: AppColors.white,
                  backgroundColor: AppColors.blue,
                  borderColor: AppColors.blue,
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.forgotPassword);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
