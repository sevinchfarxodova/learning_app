import 'package:flutter/material.dart';
import '../../../../../core/constants/colors/app_colors.dart';
import '../../../../../core/utils/responsiveness/app_responsive.dart';

class NotFoundPage extends StatefulWidget {
  const NotFoundPage({super.key});

  @override
  _NotFoundPageState createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  String? selectedButton = 'Courses';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: appW(20), right: appW(14)),
        child: Column(
          children: [
            SizedBox(height: appH(60)),
            Image.asset('assets/images/boy.png'),
            SizedBox(height: 20),
            Text(
              'Not Found',
              style: TextStyle(
                fontSize: 24,
                color: AppColors.grey900,
              ),
            ),
            Text(
              'Sorry, the keyword you entered cannot be\n found, please check again or search with\n another keyword.',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.grey900,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}