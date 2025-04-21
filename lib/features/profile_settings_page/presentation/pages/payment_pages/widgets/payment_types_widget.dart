import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learingn_app/core/constants/colors/app_colors.dart';
import 'package:learingn_app/core/utils/responsiveness/app_responsive.dart';


class PaymentTypesWidget extends StatelessWidget {
  final String image;
  final String text;
  final String? status;

  const PaymentTypesWidget({
    super.key,
    required this.image,
    required this.text,
    this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: appH(80),
      padding: EdgeInsets.symmetric(horizontal: appW(24), vertical: appH(24)),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 2,
              offset: const Offset(0, 1),
            )
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: appW(12),
            children: [
              Image.asset(image, height: appH(32), width: appW(32)),
              Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 19,
                ),
              ),
            ],
          ),
          Text(
            status ?? "",
            style: TextStyle(
              color: AppColors.blue,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
