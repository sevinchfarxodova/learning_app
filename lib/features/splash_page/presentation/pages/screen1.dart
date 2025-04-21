import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learingn_app/core/constants/colors/app_colors.dart';
import 'package:learingn_app/core/routes/route_names.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, RouteNames.screen2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Padding(
        padding: const EdgeInsets.only(top: 340),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/screen1.1.png"),
              SizedBox(height: 300.h,),
             CircularProgressIndicator(
               color: Colors.white,
             )

            ]
          ),
        ),
      ),
    );
  }
}
