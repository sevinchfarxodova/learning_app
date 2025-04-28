import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:learingn_app/features/auth/presentation/bloc/reset_new_password/new_passw_bloc.dart';
import 'package:learingn_app/features/auth/presentation/bloc/sign_up_in_event.dart';
import '../../../../../core/constants/colors/app_colors.dart';
import '../../../../../core/routes/route_names.dart';
import '../../../../splash_page/presentation/widgets/long_button.dart';
import '../../bloc/reset_new_password/new_passw_state.dart';
import '../../widgets/remember_me.dart';
import '../../widgets/text_field.dart';
import '../create_profile/widgets/alert_dialog.dart';

class NewPassword extends StatefulWidget {
final String token;
  const NewPassword({super.key, required this.token,});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPassword = TextEditingController();
  bool _rememberMe = false;
  bool _obscureText = true;
  bool _obscureText2 = true;


  void createNewPass() {
    String password = _passwordController.text.trim();
    String repeatPassword = _repeatPassword.text.trim();

    if(password.isEmpty || repeatPassword.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please, fill in all fields!!!"),
          backgroundColor: AppColors.red,
        ),
      );
      return;
    }
    context.read<NewPasswordBloc>().add(
        ResetNewPasswordEvent(newPassword: password, token: widget.token));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Create New Password",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Center(child: Image.asset("assets/images/create_new_pin.png")),
              SizedBox(height: 22.h),
              Text(
                "Create Your New Password",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 22.h),
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
              SizedBox(height: 12.h),
              TextFiledWidget1(
                obsecure: _obscureText,
                text: 'Password',
                textEditingController: _repeatPassword,
                prefixIcon: IconButton(
                  icon: Icon(IconlyLight.lock, color: Colors.grey),
                  onPressed: () {},
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText2 = !_obscureText2;
                    });
                  },
                  icon: Icon(
                    _obscureText2 ? IconlyLight.hide : IconlyLight.show,
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              AuthCheckboxWg(
                rememberMe: _rememberMe,
                onChanged: (value) {
                  setState(() {
                    _rememberMe = value!;
                  });
                },
              ),
              SizedBox(height: 50.h),

              BlocConsumer<NewPasswordBloc, ResetNewPasswordState>(
                listener: (context, state) {
                  if (state is ResetNewPasswordSuccess) {
                    Navigator.pushNamed(context, RouteNames.homePage);
                  } else if (state is ResetNewPasswordError) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.message)));
                  }
                },
                builder: (context, state) {
                  if (state is ResetNewPasswordLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return   LongButtonWg(
                    title: "Continue",
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          Future.delayed(const Duration(seconds: 1), () {
                            Navigator.pushNamed(context, RouteNames.homePage);
                          });
                          return CustomAlertDialog(
                            imagePath: 'assets/images/alert2.png',
                            title: 'Congratulations!',
                            subtitle:
                            'Your account is ready to use. You will be redirected to the Home page in a few seconds..',
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
