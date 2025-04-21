import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:learingn_app/core/utils/responsiveness/app_responsive.dart';
import 'package:learingn_app/features/profile_settings_page/presentation/widgets/language_widget.dart';
import 'package:learingn_app/features/profile_settings_page/presentation/widgets/logout_widget.dart';
import '../../../../core/constants/app_bar/default_app_bar_wg.dart';
import '../../../../core/constants/colors/app_colors.dart';
import '../../../../core/constants/strings/app_strings.dart';
import '../../../../core/routes/route_names.dart';
import '../../../auth/presentation/pages/create_profile/widgets/circle_avatar.dart';
import '../widgets/log_out_bottom.dart';
import '../widgets/settings_info_widget.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:DefaultAppBarWg(
        titleText: AppStrings.profile,
        onMorePressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: appW(24), vertical: appH(12)),
          child: Column(
            spacing: appH(6),
            children: [
              ProfileImagePicker(),
              Text(
                "Andrew Ainsley",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              Text(
                "andrew_ainsley@yourdomain.com",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              Divider(color: Colors.grey.shade200),
              SettingsInfoWidget(
                icon: IconlyLight.profile,
                title: "Edit Profile",
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.editProfile);
                },
              ),
              SettingsInfoWidget(
                icon: IconlyLight.notification,
                title: "Notification",
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.notificationSettings);
                },
              ),
              SettingsInfoWidget(
                icon: IconlyLight.wallet,
                title: "Payment",
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.payment);

                },
              ),
              SettingsInfoWidget(
                icon: IconlyLight.shield_done,
                title: "Security",
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.security);

                },
              ),
              LanguageWidget(
                icon: IconlyLight.more_circle,
                title: "Language",
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.language);

                },
                language: "English (US)",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: appW(25),
                    children: [
                      Icon(IconlyLight.show, size: 28, color: AppColors.black),
                      Text(
                        "Dark Mode",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  Switch.adaptive(
                    value: false,
                    activeColor: Colors.grey.shade300,
                    onChanged: (val) {},
                  ),
                ],
              ),
              SettingsInfoWidget(
                icon: IconlyLight.lock,
                title: "Privacy Policy",
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.privacyPolicy);
                },
              ),
              SettingsInfoWidget(
                icon: IconlyLight.info_square,
                title: "Help Center",
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.helpCenter);

                },
              ),
              SettingsInfoWidget(
                icon: IconlyLight.user_1,
                title: "Invite Friends",
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.inviteFriends);

                },
              ),
              InkWell(
                onTap: () => showLogoutModal(context),
                child: Row(
                  spacing: appW(20),
                  children: [
                    Icon(
                      IconlyLight.logout,
                      size: appH(28),
                      color: AppColors.red,
                    ),
                    Text(
                      AppStrings.logOut,
                      style: TextStyle(
                        color: AppColors.red,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
