import 'package:flutter/material.dart';
import '../../../../core/constants/colors/app_colors.dart';

class CoursesWidget extends StatefulWidget {
  const CoursesWidget({super.key});

  @override
  State<CoursesWidget> createState() => _CoursesWidgetState();
}

class _CoursesWidgetState extends State<CoursesWidget> {

  final List<Map<String, dynamic>> categories = [
    {"label": "All", "icon": "🔥", "color": Colors.orange},
    {"label": "3D Design", "icon": "💡", "color": Colors.blue},
    {"label": "Business", "icon": "💰", "color": Colors.amber},
    {"label": "Marketing", "icon": "📈", "color": Colors.purple},
  ];

  String selectedCategory = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Filter Buttons
        SizedBox(
          height: 45,
          child: ListView.separated(
            padding: EdgeInsets.only(left: 24),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (_, __) => SizedBox(width: 10),
            itemBuilder: (context, index) {
              final item = categories[index];
              final isSelected = item["label"] == selectedCategory;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategory = item["label"];
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.blue : Colors.white,
                    border: Border.all(color: AppColors.blue),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Text(item["icon"]),
                      SizedBox(width: 6),
                      Text(
                        item["label"],
                        style: TextStyle(
                          color: isSelected ? Colors.white : AppColors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
