import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:learingn_app/core/constants/strings/app_strings.dart';
import 'package:learingn_app/core/routes/route_names.dart';
import 'package:learingn_app/features/auth/presentation/bloc/register/sign_up_in_bloc.dart';
import 'package:learingn_app/features/auth/presentation/bloc/register/sign_up_in_state.dart';
import 'package:learingn_app/features/splash_page/presentation/widgets/long_button.dart';
import '../../../../core/constants/colors/app_colors.dart';
import '../../../../core/sizes/sizes.dart';
import '../bloc/register/sign_up_in_event.dart';
import '../widgets/remember_me.dart';
import '../widgets/text_field.dart';

class SignUpBlankForm extends StatefulWidget {
  const SignUpBlankForm({super.key});

  @override
  State<SignUpBlankForm> createState() => _SignUpBlankFormState();
}

class _SignUpBlankFormState extends State<SignUpBlankForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  bool _rememberMe = false;
  bool _obscureText = true;
  bool _useEmail = false;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode.addListener(() => setState(() {}));
    _emailFocusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _emailController.dispose();
    super.dispose();
  }

  String? _validateForm() {
    if (_emailController.text.trim().isEmpty) {
      return _useEmail ? 'Email is required' : 'Phone number is required';
    }
    if (_useEmail && !_emailController.text.contains('@')) {
      return 'Invalid email format';
    }
    if (!_useEmail && _emailController.text.length < 10) {
      return 'Invalid phone number';
    }
    if (_passwordController.text.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  void _submitSignup(BuildContext context) {
    final errorMessage = _validateForm();

    if (errorMessage == null) {
      context.read<AuthBloc>().add(
        RegisterWithEmailEvent(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        ),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(errorMessage)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: scaffoldPadding24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.letsInPage);
                  },
                  icon: Icon(Icons.arrow_back, size: 28),
                ),
                const SizedBox(height: 30),
                Text(
                  'Create your\nAccount',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 48.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 40),
                Column(
                  spacing: 20,
                  children: [
                    TextFiledWidget1(
                      text: AppStrings.email,
                      textEditingController: _emailController,
                      prefixIcon: IconButton(
                        icon: Icon(IconlyLight.message, color: Colors.grey),
                        onPressed: () {},
                      ),
                      obsecure: false,
                    ),
                    TextFiledWidget1(
                      obsecure: _obscureText,
                      text: 'Password',
                      textEditingController: _passwordController,
                      prefixIcon: IconButton(
                        icon: Icon(IconlyLight.lock, color: Colors.grey),
                        onPressed: () {},
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(
                          _obscureText ? IconlyLight.hide : IconlyLight.show,
                        ),
                      ),
                    ),
                    TextFiledWidget1(
                      obsecure: _obscureText,
                      text: 'Confirm Password',
                      textEditingController: _passwordController,
                      prefixIcon: IconButton(
                        icon: Icon(IconlyLight.lock, color: Colors.grey),
                        onPressed: () {},
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(
                          _obscureText ? IconlyLight.hide : IconlyLight.show,
                        ),
                      ),
                    ),
                  ],
                ),


                AuthCheckboxWg(
                  rememberMe: _rememberMe,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = value!;
                    });
                  },
                ),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is AuthLoadingState) {
                      return CircularProgressIndicator();
                    }
                    return LongButtonWg(
                      title: AppStrings.signUp,
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.createProfile);
                      },
                    );
                  },
                ),

                SizedBox(height: 48.h),
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text("or continue with"),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.only(left: 40, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSignUpCard(imgUrl: 'assets/images/facebook.png'),
                      SizedBox(width: 20.w),
                      _buildSignUpCard(imgUrl: 'assets/images/google.png'),
                      SizedBox(width: 20.w),
                      _buildSignUpCard(imgUrl: 'assets/images/apple.png'),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.signIn);
                      },
                      child: Text(
                        'Sign in',
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

  Widget _buildSignUpCard({required String imgUrl}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 16.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(children: [Image.asset(imgUrl, width: 24, height: 24)]),
    );
  }
}
