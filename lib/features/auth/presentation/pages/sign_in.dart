import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:learingn_app/core/routes/route_names.dart';
import 'package:learingn_app/features/splash_page/presentation/widgets/long_button.dart';
import '../../../../core/constants/colors/app_colors.dart';
import '../widgets/remember_me.dart';
import '../widgets/text_field.dart';

class SignIn extends StatefulWidget {
   const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();

  bool _rememberMe = false;
  bool _obscureText = true;
  bool eye = true;



  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.signUpBlankForm);
                  },
                  icon: Icon(Icons.arrow_back, size: 28),
                ),
                const SizedBox(height: 30),
                Text(
                  'Login to your\nAccount',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 48.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 40),
                TextFiledWidget1(
                  text: 'Email',
                  textEditingController: _emailController,
                  prefixIcon:  IconButton(
                    icon: Icon(
                      IconlyLight.message,
                      color: Colors.grey,
                    ), onPressed: () {  },
                  ), obsecure: false,
                ),
                TextFiledWidget1(
                    obsecure: _obscureText,
                    text: 'Password',
                    textEditingController: _passwordController,
                    prefixIcon:  IconButton(
                      icon: Icon(
                        IconlyLight.lock,
                        color: Colors.grey,
                      ), onPressed: () {  },
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      }, icon: Icon(
                      _obscureText ? IconlyLight.hide : IconlyLight.show,
                    ),
                    )
                ),
                AuthCheckboxWg(
                  rememberMe: _rememberMe,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = value!;
                    });
                  },
                ),
                LongButtonWg(title: "Sign in", onPressed: () {
                  Navigator.pushNamed(context, RouteNames.createProfile);
                }),
                SizedBox(height: 12,),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot the password?",
                      style: TextStyle(color: AppColors.blue),
                    ),
                  ),
                ),
                SizedBox(height: 35.h,),
                Row(
                  children:  [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text("or continue with"),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(height: 24,),

                Padding(
                  padding: EdgeInsets.only(left: 40, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSignUpCard(imgUrl: 'assets/images/facebook.png'),
                      SizedBox(width: 20.w,),
                      _buildSignUpCard(imgUrl: 'assets/images/google.png'),
                      SizedBox(width: 20.w,),
                      _buildSignUpCard(imgUrl: 'assets/images/apple.png'),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account? ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.signUpBlankForm);
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildSignUpCard( {required String imgUrl} ) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 16.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Image.asset(
            imgUrl,
            width: 24,
            height: 24,
          ),
        ],
      ),
    );
  }
}
