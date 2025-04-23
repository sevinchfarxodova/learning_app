import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:learingn_app/core/constants/strings/app_strings.dart';
import 'package:learingn_app/core/routes/route_names.dart';
import 'package:learingn_app/features/auth/presentation/bloc/register/sign_up_in_bloc.dart';
import 'package:learingn_app/features/auth/presentation/bloc/register/sign_up_in_event.dart';
import 'package:learingn_app/features/auth/presentation/bloc/register/sign_up_in_state.dart';
import 'package:learingn_app/features/splash_page/presentation/widgets/long_button.dart';
import '../../../../core/constants/colors/app_colors.dart';
import '../../../../core/sizes/sizes.dart';
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
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  bool _rememberMe = false;
  bool _obscureText = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode.addListener(() => setState(() {}));
    _confirmPasswordFocusNode.addListener(() => setState(() {}));
    _emailFocusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _emailController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool _isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  String? _validateForm() {
    if (_emailController.text.isEmpty) {
      return 'Please enter your email';
    }
    if (!_isEmailValid(_emailController.text)) {
      return 'Please enter a valid email';
    }
    if (_passwordController.text.isEmpty) {
      return 'Please enter your password';
    }
    if (_passwordController.text.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    if (_confirmPasswordController.text.isEmpty) {
      return 'Please confirm your password';
    }
    if (_passwordController.text != _confirmPasswordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void _handleSignUp() {
    final validationError = _validateForm();
    if (validationError != null) {
      setState(() {
        _errorMessage = validationError;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(validationError),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    setState(() {
      _errorMessage = null;
    });

    context.read<AuthBloc>().add(
      RegisterWithEmailEvent(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
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
                      textEditingController: _confirmPasswordController,
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
                  listener: (context, state) {
                    if (state is AuthSuccessState) {
                      Navigator.pushNamed(
                        context,
                        RouteNames.newPin,
                        arguments: state.registerEntity.userId,
                      );
                    } else if (state is AuthErrorState) {
                      print('Error state: ${state.error}');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.error),
                          backgroundColor: Colors.red,
                        ),
                      );
                      setState(() {
                        _errorMessage = state.error;
                      });
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoadingState) {
                      return Center(child: CircularProgressIndicator());
                    }else if (state is AuthSuccessState) {
                      return const Center(
                        child: Text(
                          'Sign-up successful! Redirecting...',
                          style: TextStyle(color: Colors.green, fontSize: 16),
                        ),

                      );
                    } else {
                      return LongButtonWg(
                        title: AppStrings.signUp,
                        onPressed: _handleSignUp,
                      );
                    }
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
