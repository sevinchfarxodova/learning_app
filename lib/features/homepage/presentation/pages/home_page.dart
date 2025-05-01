import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:learingn_app/features/auth/presentation/widgets/text_field.dart';
import 'package:learingn_app/features/homepage/presentation/bloc/courses/course_bloc.dart';
import 'package:learingn_app/features/homepage/presentation/bloc/courses/course_state.dart';
import 'package:learingn_app/features/homepage/presentation/bloc/home_event.dart';
import 'package:learingn_app/features/homepage/presentation/bloc/top_mentors/top_mentors_bloc.dart';
import 'package:learingn_app/features/homepage/presentation/bloc/top_mentors/top_mentors_state.dart';
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
  void initState() {
    super.initState();
    context.read<TopMentorsBloc>().add(TopMentorsEvent(limit: 10));
    context.read<CoursesBloc>().add(GetPopularCoursesEvent(limit: 4));
  }

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
                  onPressed: () {},
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
              BlocBuilder<TopMentorsBloc, TopMentorsState>(
                builder: (context, state) {
                  if (state is TopMentorsLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is TopMentorsLoaded) {
                    final mentors = state.mentors.results;
                    return mentors.isEmpty
                        ? Center(child: Text('No mentors available'))
                        : SizedBox(
                      height: 120.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.mentors.count,
                        itemBuilder: (context, index) {
                          final mentor = mentors[index];
                          final image = mentor.avatarUrl ?? "";
                          return topMentorsWidget(image, mentor.fullName);
                        },
                      ),
                    );
                  } else if (state is TopMentorsError) {
                    return Center(child: Text('Error: ${state.message}'));
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),

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

              BlocBuilder<CoursesBloc, CourseState>(
                builder: (context, state) {
                  if (state is CourseLoading) {
                    return Center(child: CircularProgressIndicator());
                  }else if (state is CourseLoaded) {
                    final courses = state.courses;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: courses.results.length,
                      itemBuilder: (context, index) {
                        final course = courses.results[index];
                        return CourseCard(
                          onPressed: () {
                            Navigator.pushNamed(context, RouteNames.topMentors);
                          },
                          image: course.image!,
                          category: course.category.toString(),
                          title: course.title,
                          price:  (course.price ?? 0).toString(),
                          oldPrice: "80",
                          rating: "4.8",
                          students: "8289",
                        );
                      },
                    );
                  }
                  else if(state is CourseError){
                    return Text('Error ${state.message}');
                  }else{
                    return SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
