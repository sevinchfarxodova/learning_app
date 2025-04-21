import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:learingn_app/core/routes/route_names.dart';

import '../../../../core/constants/colors/app_colors.dart';

PreferredSizeWidget myappBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    title:
    Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/images/boy.png'),
        ),

        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Good Morning 👋',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Andrew Ainsley',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        // Two icons on the right
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                IconlyLight.notification,
                color: AppColors.black,
                size: 28,
              ),
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.notificationPage);
              },
            ),
            IconButton(
              icon: Icon(
                IconlyLight.bookmark,
                color: AppColors.black,
                size: 28.sp,
              ),
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.bookmark);

              },
            ),
          ],
        ),
      ],
    ),
  );
}
