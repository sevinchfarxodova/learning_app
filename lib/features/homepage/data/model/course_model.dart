import 'package:learingn_app/features/homepage/domain/entity/section.dart';

import '../../domain/entity/course.dart';

class CourseModel extends Course {
  CourseModel({
    required super.id,
    required super.title,
    required super.description,
    required super.price,
    required super.isPublished,
    required super.createdAt,
    required super.instructor,
    required super.sections,
    required super.category,
    required super.image,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      price: json['price'] ?? 0.0,
      image: json['image'] ?? '',
      isPublished: json['is_published'] ?? false,
      createdAt: json['created_at'] ?? '',
      instructor: json['instructor'] ?? '',
      sections:
          (json['sections'] as List?)
              ?.map((e) => Section.fromJson(e))
              .toList() ??
          [],
    );
  }
}
