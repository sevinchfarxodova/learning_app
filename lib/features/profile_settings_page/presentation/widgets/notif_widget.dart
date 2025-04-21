import 'package:flutter/material.dart';

import '../../../../core/constants/colors/app_colors.dart';
import '../../../../core/utils/responsiveness/app_responsive.dart';

class NotifWidget extends StatelessWidget {
  final String text;
  final bool switchValue;
  final void Function(bool)? onChanged;

  const NotifWidget({
    super.key,
    required this.text,
    required this.switchValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style:TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: appH(12),
          width: appW(44),
          child: Switch.adaptive(
            activeColor: AppColors.white,
            thumbColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                AppColors.blue;
              }
              return AppColors.white;
            }),
            activeTrackColor: AppColors.blue,
            inactiveThumbColor: AppColors.white,
            inactiveTrackColor: Colors.grey.shade200,
            value: switchValue,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
