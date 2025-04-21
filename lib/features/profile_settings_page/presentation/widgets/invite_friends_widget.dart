import 'package:flutter/material.dart';
import '../../../../core/utils/responsiveness/app_responsive.dart';

class BaseContactCardWg extends StatelessWidget {
  final String imagePath;
  final String name;
  final String subtitle;
  final Widget trailing;

  const BaseContactCardWg({
    super.key,
    required this.imagePath,
    required this.name,
    required this.subtitle,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: appH(60),
      width: double.infinity,
      margin: EdgeInsets.only(bottom: appH(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: appW(20),
            children: [
              CircleAvatar(
                radius: appH(30),
                backgroundImage: AssetImage(imagePath),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade900,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ],
          ),
          trailing,
        ],
      ),
    );
  }
}
