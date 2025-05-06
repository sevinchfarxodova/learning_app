import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../../../../core/constants/colors/app_colors.dart';
import '../../../../core/utils/responsiveness/app_responsive.dart';

class CustomChoiceChipWg extends StatelessWidget {
  final int selectedIndex;
  final int index;
  final String label;
  final bool showIcon;
  final void Function(bool)? onSelected;

  const CustomChoiceChipWg({
    super.key,
    required this.index,
    required this.label,
    required this.selectedIndex,
    required this.onSelected,
    this.showIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: appW(12)),
      child: ChoiceChip(
        label: Text(
          label,
          style: TextStyle(
            color:
            selectedIndex == index ? AppColors.white : AppColors.blue,
            fontSize: 16,
          ),
        ),
        selected: selectedIndex == index,
        selectedColor: AppColors.blue,
        backgroundColor: AppColors.white,
        showCheckmark: false,
        avatar: showIcon
            ? Icon(
          IconlyBold.star,
          color: selectedIndex == index
              ? AppColors.white
              : AppColors.blue500,
        )
            : null,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.blue),
          borderRadius: BorderRadius.circular(100),
        ),
        onSelected: onSelected,
      ),
    );
  }
}