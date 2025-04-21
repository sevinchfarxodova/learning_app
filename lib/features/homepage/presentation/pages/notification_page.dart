import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../widgets/notification_widget.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Notification",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(IconlyLight.more_circle, size: 25.sp),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Today", style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),),
              NotificationWidget(
                title: 'Payment Successful!',
                subtitle: 'You have made a course payment',
                imagePath: "assets/images/notific1.png",
              ),
              NotificationWidget(
                title: 'Today’s Special Offers!',
                subtitle: 'You get a special promo today!',
                imagePath: "assets/images/notific2.png",
              ),
              SizedBox(height: 14.h,),
              Text("Yesterday", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600
              ),),
              NotificationWidget(
                title: 'New Category Courses!!',
                subtitle: 'Now the 3D design course is available',
                imagePath: "assets/images/notifix3.png",
              ),
              NotificationWidget(
                title: 'Credit Card Connected!!',
                subtitle: 'Credit Card has been linked!',
                imagePath: "assets/images/notific1.png",
              ),
              SizedBox(height: 14.h,),
              Text("December 22, 2024", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600
              ),),
              NotificationWidget(
                title: 'Account Setup Successful!!',
                subtitle: 'Your account has been created!',
                imagePath: "assets/images/notific4.png",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
