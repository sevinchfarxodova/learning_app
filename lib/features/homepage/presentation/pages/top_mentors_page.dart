import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../widgets/mentors_list_widget.dart';

class TopMentorsPage extends StatefulWidget {
  const TopMentorsPage({super.key});

  @override
  State<TopMentorsPage> createState() => _TopMentorsPageState();
}

class _TopMentorsPageState extends State<TopMentorsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Top Mentors",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(IconlyLight.search, size: 25.sp),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NotificationWidget(
              title: 'Jacob Kulikowski',
              subtitle: 'Marketing Analyst',
              imagePath: 'assets/images/jacob.png',
            ),
            NotificationWidget(
              title: 'Claire Ordonez',
              subtitle: 'VP of Sales',
              imagePath: 'assets/images/home_scroll_person.png',
            ),
            NotificationWidget(
              title: 'Priscilla Ehrman',
              subtitle: 'UX Designer',
              imagePath: 'assets/images/jacob.png',
            ),
            NotificationWidget(
              title: 'Jacob Kulikowski',
              subtitle: 'Marketing Analyst',
              imagePath: 'assets/images/jacob.png',
            ),
            NotificationWidget(
              title: 'Priscilla Ehrman',
              subtitle: 'UX Designer',
              imagePath: 'assets/images/jacob.png',
            ),
            NotificationWidget(
              title: 'Jacob Kulikowski',
              subtitle: 'Marketing Analyst',
              imagePath: 'assets/images/jacob.png',
            ),
            NotificationWidget(
              title: 'Priscilla Ehrman',
              subtitle: 'UX Designer',
              imagePath: 'assets/images/jacob.png',
            ),
            NotificationWidget(
              title: 'Jacob Kulikowski',
              subtitle: 'Marketing Analyst',
              imagePath: 'assets/images/jacob.png',
            ),
            NotificationWidget(
              title: 'Priscilla Ehrman',
              subtitle: 'UX Designer',
              imagePath: 'assets/images/jacob.png',
            ),
            NotificationWidget(
              title: 'Jacob Kulikowski',
              subtitle: 'Marketing Analyst',
              imagePath: 'assets/images/jacob.png',
            ),
          ],
        ),
      ),
    );
  }
}
