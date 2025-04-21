import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learingn_app/core/routes/route_names.dart';
import 'package:learingn_app/features/splash_page/presentation/widgets/long_button.dart';

import '../../../../core/constants/colors/app_colors.dart';

class LetsInPage extends StatefulWidget {
  const LetsInPage({super.key});

  @override
  State<LetsInPage> createState() => _LetsInPageState();
}

class _LetsInPageState extends State<LetsInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Icon(Icons.arrow_back),
            ),
            const SizedBox(height: 20),
            // Illustration image
            SizedBox(
              height: 200,
              child: Image.asset("assets/images/letsin.png"),
            ),
            const SizedBox(height: 30),
            const Text(
              "Let's you in",
              style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            const SocialLoginButton(
              imagePath: 'assets/images/facebook.png',
              text: 'Continue with Facebook',
            ),
            const SizedBox(height: 16),
            const SocialLoginButton(
              imagePath: 'assets/images/google.png',
              text: 'Continue with Google',
            ),
            const SizedBox(height: 16),
            const SocialLoginButton(
              imagePath: 'assets/images/apple.png',
              text: 'Continue with Apple',
            ),
            const SizedBox(height: 20),
            _divider(),
            SizedBox(height: 20.h),
            LongButtonWg(
              title: "Sign in with password",
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.signUpBlankForm);
              },
            ),
          _signIn(),
          ],
        ),
      ),
    );
  }
  Widget _signIn(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(color: Colors.grey),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.letsInPage);
          },
          child: Text(
            'Sign up',
            style: TextStyle(
              color: AppColors.blue,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _divider(){
    return Row(
      children: const [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text("or"),
        ),
        Expanded(child: Divider()),
      ],
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  final String imagePath;
  final String text;

  const SocialLoginButton({
    super.key,
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 24, width: 24),
          SizedBox(width: 12.w),
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
