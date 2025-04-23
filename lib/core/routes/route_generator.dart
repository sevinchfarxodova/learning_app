import 'package:flutter/material.dart';
import 'package:learingn_app/bottom_nav_bar.dart';
import 'package:learingn_app/core/routes/route_names.dart';
import 'package:learingn_app/features/auth/presentation/pages/forget_password/OTP.dart';
import 'package:learingn_app/features/auth/presentation/pages/forget_password/forgot_password.dart';
import 'package:learingn_app/features/auth/presentation/pages/forget_password/new_password.dart';
import 'package:learingn_app/features/auth/presentation/pages/lets_in_page.dart';
import 'package:learingn_app/features/auth/presentation/pages/sign_in.dart';
import 'package:learingn_app/features/auth/presentation/pages/sign_up_blank_form.dart';
import 'package:learingn_app/features/homepage/presentation/pages/bookmark.dart';
import 'package:learingn_app/features/homepage/presentation/pages/home_page.dart';
import 'package:learingn_app/features/homepage/presentation/pages/notification_page.dart';
import 'package:learingn_app/features/homepage/presentation/pages/popular_courses_page.dart';
import 'package:learingn_app/features/homepage/presentation/pages/top_mentors_page.dart';
import 'package:learingn_app/features/profile_settings_page/presentation/pages/edit_profile_page.dart';
import 'package:learingn_app/features/profile_settings_page/presentation/pages/help_center/help_center_page.dart';
import 'package:learingn_app/features/profile_settings_page/presentation/pages/invite_friends.dart';
import 'package:learingn_app/features/profile_settings_page/presentation/pages/language_page.dart';
import 'package:learingn_app/features/profile_settings_page/presentation/pages/notification_page.dart';
import 'package:learingn_app/features/profile_settings_page/presentation/pages/payment_pages/add_new_card_page.dart';
import 'package:learingn_app/features/profile_settings_page/presentation/pages/payment_pages/payment_page.dart';
import 'package:learingn_app/features/profile_settings_page/presentation/pages/privacy_policy.dart';
import 'package:learingn_app/features/profile_settings_page/presentation/pages/profile_settings.dart';
import 'package:learingn_app/features/profile_settings_page/presentation/pages/security_page.dart';
import 'package:learingn_app/features/splash_page/presentation/pages/screen1.dart';
import 'package:learingn_app/features/splash_page/presentation/pages/screen2.dart';
import 'package:learingn_app/features/transactions/presentation/pages/transaction_page.dart';

import '../../features/auth/presentation/pages/create_profile/pages/new_pin.dart';
import '../../features/auth/presentation/pages/create_profile/pages/profile.dart';
import '../../features/auth/presentation/pages/create_profile/pages/set_fingerprint.dart';



class AppRoute {
  BuildContext context;

  AppRoute({required this.context});

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.screen2:
        return MaterialPageRoute(builder: (_) => Screen2());

      case RouteNames.screen1:
        return MaterialPageRoute(builder: (_) => Screen1());

      case RouteNames.letsInPage:
        return MaterialPageRoute(builder: (_) => LetsInPage());

      case RouteNames.signUpBlankForm:
        return MaterialPageRoute(builder: (_) => SignUpBlankForm());

      case RouteNames.signIn:
        return MaterialPageRoute(builder: (_) => SignIn());


    case RouteNames.createProfile:
        return MaterialPageRoute(builder: (_) => CreateProfile());

      case RouteNames.newPin:
        final userId = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => CreateNewPinPage(userId: userId),
        );


      case RouteNames.fingerPrint:
        return MaterialPageRoute(builder: (_) => FingerPrintPage());

      case RouteNames.forgotPassword:
        return MaterialPageRoute(builder: (_) => ForgotPassword());

      case RouteNames.otp:
        return MaterialPageRoute(builder: (_) => OTP());

      case RouteNames.newPassword:
        return MaterialPageRoute(builder: (_) => NewPassword());


      case RouteNames.homePage:
        return MaterialPageRoute(builder: (_) => HomePage());

      case RouteNames.bottomNavBar:
        return MaterialPageRoute(builder: (_) => BottomNavBar());


      case RouteNames.notificationPage:
        return MaterialPageRoute(builder: (_) => NotificationPage());

      case RouteNames.bookmark:
        return MaterialPageRoute(builder: (_) => Bookmark());

      case RouteNames.topMentors:
        return MaterialPageRoute(builder: (_) => TopMentorsPage());

      case RouteNames.popularCoursesPage:
        return MaterialPageRoute(builder: (_) => PopularCoursesPage());


        // profile settings

      case RouteNames.profile:
        return MaterialPageRoute(builder: (_) => ProfileSettings());

      case RouteNames.privacyPolicy:
        return MaterialPageRoute(builder: (_) => PrivacyPolicy());

      case RouteNames.payment:
        return MaterialPageRoute(builder: (_) => PaymentPage());

      case RouteNames.addNewCard:
        return MaterialPageRoute(builder: (_) => AddNewCardPage());


      case RouteNames.editProfile:
        return MaterialPageRoute(builder: (_) => EditProfilePage());

      case RouteNames.notificationSettings:
        return MaterialPageRoute(builder: (_) => NotificationSettingsPage());

      case RouteNames.security:
        return MaterialPageRoute(builder: (_) => SecurityPage());

      case RouteNames.language:
        return MaterialPageRoute(builder: (_) => LanguagePage());

      case RouteNames.inviteFriends:
        return MaterialPageRoute(builder: (_) => InviteFriends());


      case RouteNames.helpCenter:
        return MaterialPageRoute(builder: (_) => HelpCenterPage());


      case RouteNames.transactions:
        return MaterialPageRoute(builder: (_) => TransactionPage());

      default:
        return _errorRoute("error");
    }
  }

  Route<dynamic> _errorRoute(String s) {
    return MaterialPageRoute(
      builder:
          (_) => Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: const Center(child: Text('Page not found')),
          ),
    );
  }
}
