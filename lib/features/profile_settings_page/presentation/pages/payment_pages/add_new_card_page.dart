import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:learingn_app/core/constants/app_bar/action_app_bar_wg.dart';
import 'package:learingn_app/core/constants/strings/app_strings.dart'
    show AppStrings;
import 'package:learingn_app/core/routes/route_names.dart';
import 'package:learingn_app/core/utils/responsiveness/app_responsive.dart';
import 'package:learingn_app/features/profile_settings_page/presentation/pages/payment_pages/widgets/add_card_info.dart';

import '../../../../../core/constants/colors/app_colors.dart';
import '../../../../splash_page/presentation/widgets/long_button.dart';

class AddNewCardPage extends StatefulWidget {
  const AddNewCardPage({super.key});

  @override
  State<AddNewCardPage> createState() => _AddNewCardPageState();
}

class _AddNewCardPageState extends State<AddNewCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ActionAppBarWg(
        titleText: AppStrings.addNewCard,
        onBackPressed: () {
          Navigator.pop(context);
        },
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(IconlyLight.more_circle, size: appH(28)),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: appW(24),
          right: appW(24),
          top: appH(24),
          bottom: appH(48),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: appH(24),
              children: [
                Image.asset(
                  "assets/images/newCard.png",
                  height: appH(239),
                  width: double.infinity,
                ),
                _customLayout(
                  title: AppStrings.cardName,
                  widget: ProfileBlankContainerWg(
                    widget: Text(
                      "Andrew Ainsley",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                _customLayout(
                  title: AppStrings.cardNumber,
                  widget: ProfileBlankContainerWg(
                    widget: Text(
                      "2672 4738 7837 7285",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Row(
                  spacing: appH(24),
                  children: [
                    Expanded(
                      child: _customLayout(
                        title: AppStrings.expiryDate,
                        widget: ProfileBlankContainerWg(
                          widget: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("08/12/2028", style: TextStyle()),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(IconlyLight.calendar),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: _customLayout(
                        title: AppStrings.cvv,
                        widget: ProfileBlankContainerWg(
                          widget: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("777", style: TextStyle()),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            LongButtonWg(
              title: AppStrings.addNewCard,
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.profile);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _customLayout({required String title, required Widget widget}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: appH(12),
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.grey.shade900, fontSize: 18,
            fontWeight: FontWeight.w600),
          ),
          widget,
        ],
      );
}
