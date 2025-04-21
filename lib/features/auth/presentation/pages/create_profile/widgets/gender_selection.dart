import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key});

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  String? selectGender;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      icon: const Icon(IconlyBold.arrow_down_2),
      value: selectGender,
      decoration: InputDecoration(
        hintText: "Gender",
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.grey.shade400,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: const Color(0xffFAFAFA),
      ),
      items: ['Male', 'Female', 'Other'].map((String gender) {
        return DropdownMenuItem(
          value: gender,
          child: Text(
            gender,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectGender = value;
        });
      },
    );
  }
}
