import 'package:flutter/material.dart';
import 'package:learingn_app/features/profile_settings_page/presentation/widgets/security_button.dart';

import '../../../../core/constants/app_bar/action_app_bar_wg.dart';
import '../../../../core/constants/strings/app_strings.dart';
import '../../../../core/utils/responsiveness/app_responsive.dart';
import '../widgets/notif_widget.dart';
import '../widgets/profile_row_widget.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ActionAppBarWg(
        titleText: AppStrings.security,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(24), vertical: appH(24)),
        child: Column(
          spacing: appH(32),
          children: [
            NotifWidget(
              text: AppStrings.rememberMe,
              switchValue: value,
              onChanged: (bool val) {
                setState(() {
                  value = val;
                });
              },
            ),
            NotifWidget(
              text: AppStrings.faceId,
              switchValue: value,
              onChanged: (bool val) {
                setState(() {
                  value = val;
                });
              },
            ),
            NotifWidget(
              text: AppStrings.biometricId,
              switchValue: value,
              onChanged: (bool val) {
                setState(() {
                  value = val;
                });
              },
            ),
            ProfileSettingRowWg(
              title: AppStrings.googleAuthenticator,
              onPressed: () {},
            ),
            Column(
              spacing: appH(24),
              children: [
                SecurityButton(
                  title: AppStrings.changePin,
                  onPressed: () {},
                ),
                SecurityButton(
                  title: AppStrings.changePassword,
                  onPressed: () {},
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
