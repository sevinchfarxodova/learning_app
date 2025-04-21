import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learingn_app/core/routes/route_names.dart';
import '../../../../core/constants/colors/app_colors.dart';
import '../widgets/long_button.dart';
import '../widgets/onBoarding_widget.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  Screen2State createState() => Screen2State();
}

class Screen2State extends State<Screen2> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> texts = [
    "We provide the best learning courses & great mentors!",
    "Learn anytime and anywhere easily and conveniently",
    "Let's improve your skills together with Elera right now!",
  ];

  final List<Widget> images = [
    Image.asset("assets/images/Frame-2.png"),
    Image.asset("assets/images/Frame-3.png"),
    Image.asset("assets/images/Frame-4.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 2),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: texts.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) => BoardingWidget(
                    text: texts[index],
                    image: images[index],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                List.generate(texts.length, (index) => _buildDot(index)),
              ),
              SizedBox(height: 30.h,),
              LongButtonWg(
                  title: _currentPage == texts.length - 1
                      ? "Get Started"
                      : "Next",
                  onPressed: () {
                    if (_currentPage < texts.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                    if (_currentPage == texts.length - 1) {
                      Navigator.pushNamed(context, RouteNames.letsInPage);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDot(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.h),
      width: _currentPage == index ? 32.w : 8.h,
      height: 8.h,
      decoration: BoxDecoration(
        color: _currentPage == index
            ? AppColors.blue
            : AppColors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}