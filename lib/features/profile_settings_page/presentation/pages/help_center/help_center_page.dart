import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learingn_app/core/constants/app_bar/action_app_bar_wg.dart';
import 'package:learingn_app/core/constants/strings/app_strings.dart';
import 'package:learingn_app/features/profile_settings_page/presentation/pages/help_center/widgets/contact_us.dart';
import 'package:learingn_app/features/profile_settings_page/presentation/pages/help_center/widgets/faq_tabbar.dart';
import 'package:learingn_app/features/profile_settings_page/presentation/pages/help_center/widgets/tab_bar.dart';

import '../../../../../core/constants/colors/app_colors.dart';
import '../../../../../core/utils/responsiveness/app_responsive.dart';

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedCategory = "All";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ActionAppBarWg(
        onBackPressed: () {
          Navigator.pop(context);
        },
        titleText: AppStrings.helpCenter,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(24)),
        child: Column(
          spacing: appH(24),
          children: [
            CustomTabBar(
              tabController: _tabController,
              tabTitles: [AppStrings.faq, AppStrings.contactUs],
            ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [FaqTab(), ContactUsTab()],
          ),
        )   ],
        ),
      ),
    );
  }
}
