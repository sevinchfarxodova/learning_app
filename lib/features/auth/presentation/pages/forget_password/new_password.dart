import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../../../../splash_page/presentation/widgets/long_button.dart';
import '../../widgets/remember_me.dart';
import '../../widgets/text_field.dart';
import '../create_profile/widgets/alert_dialog.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _obscureText = true;
  bool eye = true;
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
              SizedBox(height: 12.h),
              TextFiledWidget1(
                  obsecure: _obscureText,
                  text: 'Password',
                  textEditingController: _passwordController,
                  prefixIcon:   IconButton(
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
              LongButtonWg(title: "Continue", onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    Future.delayed(const Duration(seconds: 1), () {
                      Navigator.of(context).pop();
                    });
                    return CustomAlertDialog(
                      imagePath: 'assets/images/alert2.png',
                      title: 'Congratulations!',
                      subtitle:
                      'Your account is ready to use. You will be redirected to the Home page in a few seconds..',
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
