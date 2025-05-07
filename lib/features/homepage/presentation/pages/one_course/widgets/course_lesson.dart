import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../../../core/constants/colors/app_colors.dart';
import '../../../../../../core/utils/responsiveness/app_responsive.dart';
import '../../../../domain/entity/section.dart';

class CourseLessonWidget extends StatelessWidget {
  final List<Section> section;

  const CourseLessonWidget({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: section.length,
      itemBuilder: (context, sectionIndex) {
        final currentSection = section[sectionIndex];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  currentSection.title,
                  style: TextStyle(
                    color: AppColors.grey500,
                    fontSize: appH(18),
                  ),
                ),
                Text(
                  "${currentSection.lessons.length} lessons",
                  style: TextStyle(
                    color: AppColors.blue500,
                    fontSize: appH(16),
                  ),
                ),
              ],
            ),
            SizedBox(height: appH(12)),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: currentSection.lessons.length,
              itemBuilder: (context, lessonIndex) {
                final lesson = currentSection.lessons[lessonIndex];
                return Container(
                  margin: EdgeInsets.only(bottom: appH(12)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(appH(18)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: appH(12),
                        offset: Offset(0, appH(4)),
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.blue200.withOpacity(
                        0.2,
                      ),
                      radius: appH(24),
                      child: Text(
                        "${lessonIndex + 1}",
                        style: TextStyle(
                          color: AppColors.blue500,
                          fontSize: appH(18),
                        ),
                      ),
                    ),
                    title: Text(
                      lesson.title,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: appH(18),
                      ),
                    ),
                    subtitle: Text(
                      lesson.videoUrl != null ? "Video lesson" : "Text content",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: appH(16),
                      ),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        if (lesson.videoUrl != null) {
                          // Navigator.push(...);
                        }
                      },
                      child: Icon(
                        lesson.videoUrl == null
                            ? IconlyLight.lock
                            : IconlyBold.play,
                        size: appH(28),
                        color:
                        lesson.videoUrl == null
                            ? AppColors.grey500
                            : AppColors.blue500,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}