import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../../../../../../core/constants/colors/app_colors.dart';
import '../../../../../../core/utils/responsiveness/app_responsive.dart';

class HelpCenterContainerWg extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const HelpCenterContainerWg({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: appH(72),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: appW(24), vertical: appH(24)),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade900,
              fontSize: 18,
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              IconlyBold.arrow_down_2,
              color: AppColors.blue,
              size: appH(24),
            ),
          ),
        ],
      ),
    );
  }
}
