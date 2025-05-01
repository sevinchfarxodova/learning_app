import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/constants/colors/app_colors.dart';
import '../../../../core/utils/responsiveness/app_responsive.dart';

class ChatsWidget extends StatelessWidget {
  final String imagePath;
  final String name;
  final String jobTitle;

  const ChatsWidget({
    super.key,
    required this.imagePath,
    required this.name,
    required this.jobTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Container(
              width: appW(72),
              height: appH(72),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
              ),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: imagePath,
                  fit: BoxFit.cover,
                  errorWidget:
                      (context, url, error) => Icon(
                    IconlyBold.user_3,
                        color: Colors.grey.shade400,
                    size: appH(50),
                  ),
                  placeholder:
                      (context, url) =>
                      Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
            SizedBox(width: appW(20)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade900,
                  ),
                ),
                Text(
                  jobTitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(
                IconlyLight.chat,
                color: AppColors.blue500,
                size: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}