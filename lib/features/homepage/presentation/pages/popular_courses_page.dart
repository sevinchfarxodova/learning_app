import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../widgets/courses_container.dart';
import '../widgets/courses_scroll.dart';

class PopularCoursesPage extends StatefulWidget {
  const PopularCoursesPage({super.key});

  @override
  State<PopularCoursesPage> createState() => _PopularCoursesPageState();
}

class _PopularCoursesPageState extends State<PopularCoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Most Popular Courses",
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CoursesWidget(),
              SizedBox(height: 14.h),
              CourseCard(
                image: 'assets/images/course.png',
                category: '3D Design',
                title: '3D Design Illustration',
                price: '\$48 ',
                oldPrice: '\$80',
                rating: '4.8',
                students: '7,938',
                onPressed: () {},
              ),
              CourseCard(
                image: 'assets/images/Mask Group.png',
                category: 'Entrepreneurship',
                title: 'Digital Entrepreneurship',
                price: '\$39',
                rating: '4.9',
                students: '6,182',
                onPressed: () {},
              ),
              CourseCard(
                image: 'assets/images/course4.png',
                category: 'UI/UX Design',
                title: 'Learn UX User Persona',
                price: '\$42',
                oldPrice: '\$75',
                rating: '4.7',
                students: '9,938',
                onPressed: () {},
              ),
              CourseCard(
                image: 'assets/images/course3.png',
                category: 'Programming',
                title: 'Flutter Mobile Apps',
                price: '\$44 ',
                oldPrice: '\$72',
                rating: '4.8',
                students: '8,938',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
