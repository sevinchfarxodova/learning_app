import 'package:flutter/material.dart';

import '../../../../../../core/constants/colors/app_colors.dart';
import '../../../../../../core/utils/responsiveness/app_responsive.dart';
class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;
  final List<String> tabTitles;

  const CustomTabBar({
    super.key,
    required this.tabController,
    required this.tabTitles,
  }) : assert(
  tabTitles.length > 1,
  );

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return TabBar(
      controller: tabController,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorWeight: appH(4),
      dividerHeight: 0,
      indicatorColor: AppColors.blue500,
      labelColor: AppColors.blue500,
      unselectedLabelColor:
      isDarkMode ? Colors.grey.shade400 : Colors.grey,
      labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      tabs:
      tabTitles
          .map((title) => Tab(text: title))
          .toList(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
