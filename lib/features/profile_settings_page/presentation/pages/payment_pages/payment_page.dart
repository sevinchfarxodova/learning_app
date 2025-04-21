import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:learingn_app/core/constants/app_bar/action_app_bar_wg.dart';
import 'package:learingn_app/core/constants/strings/app_strings.dart';
import 'package:learingn_app/core/routes/route_names.dart';
import 'package:learingn_app/features/profile_settings_page/presentation/pages/payment_pages/widgets/payment_types_widget.dart';
import 'package:learingn_app/features/splash_page/presentation/widgets/long_button.dart';

import '../../../../../core/utils/responsiveness/app_responsive.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ActionAppBarWg(
        titleText: AppStrings.payment,
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
                PaymentTypesWidget(
                  image: "assets/images/paypal.png",
                  text: AppStrings.payPal,
                  status: AppStrings.connected,
                ),
                PaymentTypesWidget(
                  image: "assets/images/google.png",
                  text: AppStrings.googlePay,
                  status: AppStrings.connected,
                ),
                PaymentTypesWidget(
                  image: "assets/images/apple.png",
                  text: AppStrings.applePay,
                  status: AppStrings.connected,
                ),
                PaymentTypesWidget(
                  image: "assets/images/world_card.png",
                  text: "•••• •••• •••• •••• 4679",
                  status: AppStrings.connected,
                ),
              ],
            ),
            LongButtonWg(title: AppStrings.addNewCard, onPressed: (){
              Navigator.pushNamed(context, RouteNames.addNewCard);
            })
          ],
        ),
      ),
    );
  }
}
