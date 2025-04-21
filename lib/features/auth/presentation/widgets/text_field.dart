import 'package:flutter/material.dart';
import '../../../../core/constants/colors/app_colors.dart';
import '../../../../core/utils/responsiveness/app_responsive.dart';

class TextFiledWidget1 extends StatelessWidget {
  final String text;
  final TextEditingController? textEditingController;
  final IconButton? prefixIcon;
  final bool   obsecure;
  final IconButton? suffixIcon;

  const TextFiledWidget1({
    super.key,
    required this.text,
    this.textEditingController,
    this.prefixIcon,
    this.suffixIcon,
    this.obsecure=false,
  }
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: appW(1)),
          child: TextField(
            obscureText: obsecure,
            controller: textEditingController,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              hintText: text,
              hintStyle: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey.shade400,
              ),
              prefixIcon: prefixIcon,
              filled: true,
              fillColor: Color(0xffFAFAFA),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.blue,),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            style:  TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black, ),
          ),
        ),
      ],
    );
  }
}
