import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:learingn_app/core/constants/app_bar/action_app_bar_wg.dart';
import 'package:learingn_app/core/utils/responsiveness/app_responsive.dart';
import '../../../../core/constants/app_bar/default_app_bar_wg.dart';
import '../../../../core/constants/strings/app_strings.dart';
import '../../../../core/routes/route_names.dart';
import '../../../auth/presentation/pages/create_profile/widgets/birthday.dart';
import '../../../auth/presentation/pages/create_profile/widgets/gender_selection.dart';
import '../../../auth/presentation/widgets/text_field.dart';
import '../../../splash_page/presentation/widgets/long_button.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ActionAppBarWg(
        titleText: AppStrings.editProfile,
          onBackPressed: (){
          Navigator.pop(context);
          }),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            right: appW(24),
            left: appW(24),
            top: appH(24),
            bottom: appH(48),
          ),
          child: Column(
            spacing: appH(18),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _blankContainer(Text("Andrew Ainsley", style: TextStyle(fontSize: 15))),
              _blankContainer(Text("Andrew", style: TextStyle(fontSize: 15))),
              DateOfBirthPicker(),
              TextFiledWidget1(
                text: "Email",
                textEditingController: emailController,
                obsecure: false,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(IconlyLight.message, color: Colors.grey),
                ),
              ),
              _blankContainer(Text("United States", style: TextStyle(fontSize: 15))),
              _country(),
              GenderSelection(),
              _blankContainer(Text("Student", style: TextStyle(fontSize: 15))),
              SizedBox(height: appH(66)),
              LongButtonWg(
                title: "Update",
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.newPin);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _country() {
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

  Widget _blankContainer(Widget widget) => Container(
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.symmetric(horizontal: appW(20)),
    width: double.infinity,
    height: appH(56),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.grey.shade50,
    ),
    child: widget,
  );
}
