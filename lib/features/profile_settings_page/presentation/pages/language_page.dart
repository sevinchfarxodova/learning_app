import 'package:flutter/material.dart';
import '../../../../core/constants/app_bar/action_app_bar_wg.dart';
import '../../../../core/constants/strings/app_strings.dart';
import '../../../../core/enum.dart';
import '../../../../core/utils/responsiveness/app_responsive.dart';
import '../widgets/languager_types_widget.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ActionAppBarWg(
        titleText: AppStrings.language,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: appW(24),
          right: appW(24),
          top: appH(24),
        ),
        child: Column(
          spacing: appH(24),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.suggested,
                  style: TextStyle(
                    color: Colors.grey.shade900,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: appH(8),),
                LanguageRadioWg(
                  language: AppStrings.englishUS,
                  value: Languages.english,
                  groupValue: Languages.english,
                  onChanged: (val) {},
                ),
                LanguageRadioWg(
                  language: AppStrings.englishUK,
                  value: Languages.english,
                  groupValue: Languages.english,
                  onChanged: (val) {},
                ),
              ],
            ),
            Divider(color: Colors.grey.shade200),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: appH(30),
              children: [
                Text(
                  AppStrings.language,
                  style: TextStyle(
                    color: Colors.grey.shade900,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                LanguageRadioWg(
                  language: AppStrings.russian,
                  value: Languages.russian,
                  groupValue: Languages.english,
                  onChanged: (val) {},
                ),
                LanguageRadioWg(
                  language: AppStrings.uzbek,
                  value: Languages.uzbek,
                  groupValue: Languages.english,
                  onChanged: (val) {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
