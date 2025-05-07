import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/constants/colors/app_colors.dart';

class CourseCard extends StatefulWidget {
  final String image;
  final String category;
  final String title;
  final String price;
  final String? oldPrice;
  final String rating;
  final String students;
  final VoidCallback onPressed;

  const CourseCard({
    super.key,
    required this.image,
    required this.category,
    required this.title,
    required this.price,
    this.oldPrice,
    required this.rating,
    required this.students,
    required this.onPressed,

  });

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: (){widget.onPressed();},
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color:  Colors.transparent,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                widget.image,
                width: 110.w,
                height: 100.h,
                fit: BoxFit.cover,
              ),
            ),
             SizedBox(width: 12.w),

            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          widget.category,
                          style: TextStyle(
                            color: AppColors.blue,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                       SizedBox(width: 36.w),

                      IconButton(
                        onPressed: (){},
                        icon: Icon(
                          IconlyLight.bookmark,
                          color: AppColors.blue,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  // Title
                  Text(
                    widget.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 6),

                  // Price
                  Row(
                    children: [
                      Text(
                        widget.price,
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (widget.oldPrice != null) ...[
                        SizedBox(width: 8),
                        Text(
                          widget.oldPrice!,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ]
                    ],
                  ),

                  const SizedBox(height: 6),

                  // Rating and students
                  Row(
                    children: [
                      Icon(IconlyBold.star, color: Color(0xffFB9400), size: 16),
                      const SizedBox(width: 4),
                      Text(
                        widget.rating,
                        style: TextStyle(fontSize: 12),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "|",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "${widget.students} students",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
