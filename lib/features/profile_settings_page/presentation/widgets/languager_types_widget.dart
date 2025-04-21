import 'package:flutter/material.dart';

import '../../../../core/enum.dart';

class LanguageRadioWg extends StatelessWidget {
  final String language;
  final Languages value;
  final Languages? groupValue;
  final void Function(Languages?)? onChanged;

  const LanguageRadioWg({
    super.key,
    required this.language,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          language,
          style: TextStyle(
            color: Colors.grey.shade900,
            fontSize: 18,
          ),
        ),
        Radio<Languages>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
