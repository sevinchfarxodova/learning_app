import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../../../../core/constants/colors/app_colors.dart';
import '../../../../core/utils/responsiveness/app_responsive.dart';

Widget topMentorsWidget(String imagePath, String name) => Container(
  margin: EdgeInsets.only(right: appW(15)),
  child: Column(
    children: [
      Container(
        width: 72,
        height: 72,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.white,
        ),
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: imagePath.isNotEmpty ? imagePath : "https://via.placeholder.com/72",
            fit: BoxFit.cover,
            errorWidget:
                (context, url, error) => Icon(
                  IconlyBold.user_3,
                  color: Colors.grey.shade400,
                  size: appH(50),
                ),
          ),
        ),
      ),

      SizedBox(height: appH(8)),
      Text(name, style: TextStyle(fontSize: 16, color: Colors.grey.shade900)),
    ],
  ),
);
