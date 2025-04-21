import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:learingn_app/core/routes/route_names.dart';
import 'package:learingn_app/core/utils/responsiveness/app_responsive.dart';
import 'package:learingn_app/features/auth/presentation/widgets/text_field.dart';
import 'package:learingn_app/features/splash_page/presentation/widgets/long_button.dart';
import '../widgets/birthday.dart';
import '../widgets/circle_avatar.dart';
import '../widgets/gender_selection.dart';


class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  DateTime? selectDate;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Fill Your Profile",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(20.0),
          child: Column(
            spacing: 14,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileImagePicker(),
              SizedBox(height: appH(18)),
              TextFiledWidget1(
                text: 'Full name',
                textEditingController: fullNameController,
                obsecure: false,
              ),
              TextFiledWidget1(
                text: "Nickname",
                textEditingController: nickNameController,
                obsecure: false,
              ),
              DateOfBirthPicker(),
              TextFiledWidget1(
                text: "Email",
                textEditingController: emailController,
                obsecure: false,
                suffixIcon: IconButton(
                  onPressed: (){},
                  icon: const Icon(IconlyLight.message,
                    color: Colors.grey,)
                ),
              ),
              _country(),
              GenderSelection(),
              SizedBox(height: 48.h),
              LongButtonWg(title: "Continue", onPressed: (){
                Navigator.pushNamed(context, RouteNames.newPin);
              }),


            ],
          ),
        ),
      ),
    );
  }


Widget _country(){
     return TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: 'Phone Number',
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.grey.shade400,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text('🇺🇸', style: TextStyle(fontSize: 18)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: const Color(0xffFAFAFA),
      ),
    );
}




}
