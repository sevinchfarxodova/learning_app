import 'package:flutter/material.dart';
import 'package:learingn_app/core/routes/route_names.dart';
import '../../../../core/constants/colors/app_colors.dart';
import '../../../../core/constants/strings/app_strings.dart';
import '../../../../core/sizes/sizes.dart';
import '../../../../core/utils/responsiveness/app_responsive.dart';

void showLogoutModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
    ),
    backgroundColor: AppColors.white,
    builder: (context) => Padding(
      padding: scaffoldPadding48,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: appH(20),
        children: [
          Text(
            AppStrings.logOut,
            style:TextStyle(
              color: AppColors.red,
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
          Divider(thickness: 1, color: Colors.grey.shade200),
          Text(
            AppStrings.wantToLogOut,
            style: TextStyle(
              color: Colors.grey.shade800,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: appH(54),
                  child: FilledButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.blue100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      AppStrings.cancel,
                      style: TextStyle(
                        color: AppColors.blue,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: appW(12)),
              Expanded(
                child: SizedBox(
                  height: appH(44),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.signIn);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      AppStrings.yesLogOut,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
