import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TopMentorsCoursesWidget extends StatefulWidget {
  const TopMentorsCoursesWidget({super.key});

  @override
  State<TopMentorsCoursesWidget> createState() => _TopMentorsCoursesWidgetState();
}

class _TopMentorsCoursesWidgetState extends State<TopMentorsCoursesWidget> {
  final List<Map<String, String>> instructors = [
    {"name": "Jacob", "image": "assets/images/jacob.png"},
    {"name": "Claire", "image": "assets/images/home_scroll_person.png"},
    {"name": "Priscilla", "image": "assets/images/jacob.png"},
    {"name": "Priscilla", "image": "assets/images/home_scroll_person.png"},
    {"name": "Wade", "image": "assets/images/jacob.png"},
    {"name": "Kathryn", "image": "assets/images/home_scroll_person.png"},
  ];

  String selectedCategory = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // mentors
        SizedBox(
          height: 102,
          child: ListView.separated(
            padding: EdgeInsets.only(left: 24),
            scrollDirection: Axis.horizontal,
            itemCount: instructors.length,
            separatorBuilder: (_, __) => SizedBox(width: 16),
            itemBuilder: (context, index) {
              final person = instructors[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundImage: AssetImage(person["image"]!),
                  ),
                  Text(
                    person["name"]!,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
