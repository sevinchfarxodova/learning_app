import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learingn_app/features/profile_settings_page/presentation/widgets/notif_widget.dart';

import '../../../../core/constants/app_bar/action_app_bar_wg.dart';
import '../../../../core/constants/strings/app_strings.dart';
import '../../../../core/utils/responsiveness/app_responsive.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  @override
  Widget build(BuildContext context) {
    bool value = true;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ActionAppBarWg(
        titleText: AppStrings.notification,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(24), vertical: appH(24)),
        child: Column(
          spacing: appH(40),
          children: [
            NotifWidget(
              text: AppStrings.generalNotification,
              switchValue: value,
              onChanged: (bool val) {
                setState(() {
                  value = val;
                });
              },
            ),
            NotifWidget(
              text: AppStrings.sound,
              switchValue: value,
              onChanged: (bool val) {
                setState(() {
                  value = val;
                });
              },
            ),
            NotifWidget(
              text: AppStrings.vibrate,
              switchValue: value,
              onChanged: (bool val) {
                setState(() {
                  value = val;
                });
              },
            ),
            NotifWidget(
              text: AppStrings.specialOffers,
              switchValue: value,
              onChanged: (bool val) {
                setState(() {
                  value = val;
                });
              },
            ),
            NotifWidget(
              text: AppStrings.promoDiscount,
              switchValue: value,
              onChanged: (bool val) {
                setState(() {
                  value = val;
                });
              },
            ),
            NotifWidget(
              text: AppStrings.payments,
              switchValue: value,
              onChanged: (bool val) {
                setState(() {
                  value = val;
                });
              },
            ),
            NotifWidget(
              text: AppStrings.cashback,
              switchValue: value,
              onChanged: (bool val) {
                setState(() {
                  value = val;
                });
              },
            ), NotifWidget(
              text: AppStrings.appUpdates,
              switchValue: value,
              onChanged: (bool val) {
                setState(() {
                  value = val;
                });
              },
            ), NotifWidget(
              text: AppStrings.newServiceAvailable,
              switchValue: value,
              onChanged: (bool val) {
                setState(() {
                  value = val;
                });
              },
            ),
            NotifWidget(
              text: AppStrings.newTipsAvailable,
              switchValue: value,
              onChanged: (bool val) {
                setState(() {
                  value = val;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
