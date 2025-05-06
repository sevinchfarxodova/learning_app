import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:learingn_app/core/utils/responsiveness/app_responsive.dart';

import '../../../../core/routes/route_names.dart';
import '../../../profile_settings_page/presentation/pages/help_center/widgets/choice_chip.dart';
import '../bloc/category/category_bloc.dart';
import '../bloc/category/category_state.dart';
import '../bloc/courses/course_bloc.dart';
import '../bloc/courses/course_state.dart';
import '../bloc/home_event.dart';
import '../widgets/courses_container.dart';
import '../widgets/courses_scroll.dart';

class PopularCoursesPage extends StatefulWidget {
  const PopularCoursesPage({super.key});

  @override
  State<PopularCoursesPage> createState() => _PopularCoursesPageState();
}

class _PopularCoursesPageState extends State<PopularCoursesPage> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<CoursesBloc>().add(GetPopularCoursesEvent(limit: 2));
    context.read<CategoryBloc>().add(GetCategoriesEvent(limit: 10));
  }
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
              BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is CategoryLoaded) {
                    final category = state.categories;
                    return SizedBox(
                      height: appH(40),
                      child: ListView.builder(
                          itemCount: category.count,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CustomChoiceChipWg(
                              index: index,
                              label: category.results[index].name,
                              selectedIndex: selectedIndex,
                              onSelected: (selected) {
                                setState(() {
                                  selectedIndex =
                                  selected ? index : selectedIndex;
                                });
                              },
                            );
                          }
                      ),
                    );
                  }else if(state is CategoryError){
                    return Center(child: Text('Ошибка: ${state.message}'));
                  }
                  return const SizedBox.shrink();
                },
              ),
              SizedBox(height: appH(14)),
              BlocBuilder<CoursesBloc, CourseState>(
                builder: (context, state) {
                  if (state is CourseLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is CourseLoaded) {
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
                          price: (course.price ?? 0).toString(),
                          oldPrice: "80",
                          rating: "4.8",
                          students: "8289",
                        );
                      },
                    );
                  } else if (state is CourseError) {
                    return Text('Error ${state.message}');
                  } else {
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
