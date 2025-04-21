import 'package:flutter/material.dart';
import 'package:learingn_app/core/constants/strings/app_strings.dart';

import '../../../../core/constants/colors/app_colors.dart';
import '../../../../core/utils/responsiveness/app_responsive.dart';
import '../widgets/invite_friends_widget.dart';

class InviteFriends extends StatefulWidget {
  const InviteFriends({super.key});

  @override
  State<InviteFriends> createState() => _InviteFriendsState();
}

class _InviteFriendsState extends State<InviteFriends> {
  @override
  Widget build(BuildContext context) {
    bool isInvited = false;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          AppStrings.inviteFriends,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.only(
            left: appW(24),
            right: appW(24),
            top: appH(14),
          ),
          child: ListView.builder(
              itemCount: 13, itemBuilder: (context, index) =>
              BaseContactCardWg(
                imagePath: "assets/images/boy.png",
                name: "Florencio Dorrance",
                subtitle: "+1-202-555-0136",
                trailing: GestureDetector(
                  onTap: () {
                    setState(() {
                      isInvited = !isInvited;
                    });
                  },
                  child: Chip(
                    backgroundColor:
                    isInvited ? AppColors.white : AppColors.blue,
                    shape: StadiumBorder(
                      side: BorderSide(color: AppColors.blue, width: 2, ),
                    ),
                    label: Text(
                      isInvited ? AppStrings.invited : AppStrings.invite,
                      style: TextStyle(
                        color: isInvited ? AppColors.blue : AppColors
                            .white,
                        fontSize: 14,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: appW(10),
                      vertical: appH(7),
                    ),
                  ),
                ),
              ), )
      ),
    );
  }
}
