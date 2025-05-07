import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:learingn_app/core/constants/colors/app_colors.dart';
import 'package:learingn_app/core/routes/route_names.dart';
import '../../../../domain/entity/course.dart';

class AboutScreen extends StatefulWidget {
  final Course course;

  const AboutScreen({super.key, required this.course});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mentor',
            style: TextStyle(
              fontSize: 26,
              color: AppColors.black,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RouteNames.topMentors);
            },
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(
                  IconlyBold.user_3,
                  size: 30,
                  color: AppColors.white,
                ),
              ),
              title: Text(
                widget.course.instructor,
                style: TextStyle(
                  fontSize: 19,
                  color: AppColors.black,
                ),
              ),
              subtitle: Text(
                'Senior UI/UX Designer at Google',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.grey500,
                ),
              ),
              trailing: Icon(IconlyLight.chat, size: 23, color: AppColors.blue),
            ),
          ),
          Text(
            'About Course',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.course.description,
            style: TextStyle(
              fontSize: 16,
              color: AppColors.grey500,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Tools',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Image.asset('assets/images/boy.png'),
              const SizedBox(width: 5),
              Text(
                "Figma",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}