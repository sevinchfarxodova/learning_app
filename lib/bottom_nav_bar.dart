import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:learingn_app/features/my_course/presentation/pages/my_course.dart';
import 'package:learingn_app/features/transactions/presentation/pages/transaction_page.dart';
import 'core/constants/colors/app_colors.dart';
import 'features/homepage/presentation/pages/home_page.dart';
import 'features/profile_settings_page/presentation/pages/profile_settings.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  List<Widget> pages = [
    HomePage(),
    MyCourse(),
    MyCourse(),
TransactionPage()  ,
    ProfileSettings(),
  ];

  final List<String> labels = [
    'Home',
    'My Course',
    'Inbox',
    'Transaction',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [], // No shadow
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          // No shadow
          currentIndex: _currentIndex,
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.blue,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          items: List.generate(5, (index) {
            return BottomNavigationBarItem(
              icon: Icon(
                _currentIndex == index
                    ? _getBoldIcon(index)
                    : _getLightIcon(index),
              ),
              label: labels[index],
            );
          }),
        ),
      ),
    );
  }

  IconData _getBoldIcon(int index) {
    switch (index) {
      case 0:
        return IconlyBold.home;
      case 1:
        return IconlyBold.document;
      case 2:
        return IconlyBold.chat;
      case 3:
        return IconlyBold.buy;
      case 4:
        return IconlyBold.profile;
      default:
        return IconlyBold.home;
    }
  }

  IconData _getLightIcon(int index) {
    switch (index) {
      case 0:
        return IconlyLight.home;
      case 1:
        return IconlyLight.document;
      case 2:
        return IconlyLight.chat;
      case 3:
        return IconlyLight.buy;
      case 4:
        return IconlyLight.profile;
      default:
        return IconlyLight.home;
    }
  }
}
