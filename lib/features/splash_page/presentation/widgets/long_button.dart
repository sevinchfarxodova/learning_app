import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors/app_colors.dart';


class LongButtonWg extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const LongButtonWg({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.h,
      width: 400.w,
      child: FilledButton(
        style: FilledButton.styleFrom(
            backgroundColor: AppColors.blue),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}