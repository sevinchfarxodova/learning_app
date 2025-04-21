import 'package:flutter/material.dart';
import 'package:learingn_app/core/utils/responsiveness/app_responsive.dart';


class ProfileBlankContainerWg extends StatelessWidget {
  final Widget widget;

  const ProfileBlankContainerWg({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: appW(20)),
      width: double.infinity,
      height: appH(56),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color:Colors.grey.shade50,
      ),
      child: widget,
    );
  }
}
