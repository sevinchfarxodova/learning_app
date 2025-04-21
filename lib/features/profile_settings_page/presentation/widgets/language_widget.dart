import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/constants/colors/app_colors.dart';

class LanguageWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String language;
  final VoidCallback onTap;

   LanguageWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon,  size: 26),
            SizedBox(width: 18.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),

            ),
            Text(
              language,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            SizedBox(width: 12.w,),
            Icon(IconlyLight.arrow_right_2, color: Colors.black, size: 22, ),

          ],
        ),
      ),
    );
  }
}
