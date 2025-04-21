import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/colors/app_colors.dart';


class AuthCheckboxWg extends StatelessWidget {
  final bool rememberMe;
  final void Function(bool?)? onChanged;

  const AuthCheckboxWg(
      {super.key, required this.rememberMe, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          side: BorderSide(color: AppColors.blue, width: 2),
          checkColor: AppColors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          activeColor: AppColors.blue,
          value: rememberMe,
          onChanged: onChanged,
        ),
        Text("Remember me",
            style: TextStyle(color: AppColors.black, fontSize: 16.sp)),
      ],
    );
  }
}