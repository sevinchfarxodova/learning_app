import 'package:flutter/material.dart';

import '../../../../../../core/constants/colors/app_colors.dart';
import '../../../../domain/entity/section.dart';
import 'course_lesson.dart';

class LessonScreen extends StatefulWidget {
  final List<Section> sections;

  const LessonScreen({super.key, required this.sections});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.sections[0].lessons.length} Lessons",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.black,
                  ),
                ),
                GestureDetector(
                  child: Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.blue,
                    ),
                  ),
                ),
              ],
            ),
            CourseLessonWidget(section: widget.sections),
          ],
        ),
      ),
    );
  }
}