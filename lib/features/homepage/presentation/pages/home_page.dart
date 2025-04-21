import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:learingn_app/features/auth/presentation/widgets/text_field.dart';
import 'package:learingn_app/features/homepage/presentation/widgets/courses_container.dart';
import '../../../../core/constants/colors/app_colors.dart';
import '../../../../core/routes/route_names.dart';
import '../widgets/courses_scroll.dart';
import '../widgets/home_appBar.dart';
import '../widgets/top_mentors_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myappBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Search
              TextFiledWidget1(
                text: "Search",
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    IconlyLight.filter,
                    color: AppColors.blue,
                    size: 16.h,
                  ),
                ),
                prefixIcon: IconButton(
                  icon: Icon(IconlyLight.search, size: 16.h),
                  onPressed: () {

                  },
                ),
              ),
              // image
              Image.asset(
                "assets/images/reklama_home.png",
                height: 190.h,
                width: 380.w,
                fit: BoxFit.cover,
              ),
              // Top Mentors
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Mentors",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.topMentors);
                      },
                      child: Text(
                        "See All",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Mentors
              TopMentorsCoursesWidget(),
              // Popular Courses
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Most Popular Courses",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RouteNames.popularCoursesPage,
                        );
                      },
                      child: Text(
                        "See All",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CoursesWidget(),
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
                onPressed: () {

                },
              ),
              CourseCard(
                image: 'assets/images/course4.png',
                category: 'UI/UX Design',
                title: 'Learn UX User Persona',
                price: '\$42',
                oldPrice: '\$75',
                rating: '4.7',
                students: '9,938',
                onPressed: () {

                },
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
