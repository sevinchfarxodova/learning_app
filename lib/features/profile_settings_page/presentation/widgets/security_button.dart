import 'package:flutter/material.dart';

import '../../../../core/constants/colors/app_colors.dart';
import '../../../../core/utils/responsiveness/app_responsive.dart';


class SecurityButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const SecurityButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: appH(58),
      width: double.infinity,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.blue100,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: AppColors.blue,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
