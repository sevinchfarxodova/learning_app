import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class BuildPinBoxWidget extends StatelessWidget {
  final TextEditingController controller;

  const BuildPinBoxWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: controller,
      length: 4,
      obscureText: true,
      obscuringWidget: const Icon(Icons.circle, size: 12, color: Colors.black),
      defaultPinTheme: PinTheme(
        width: 83,
        height: 61,
        textStyle: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      focusedPinTheme: PinTheme(
        width: 83,
        height: 61,
        textStyle: const TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blue, width: 1.3),
        ),
      ),
      onCompleted: (pin) {
        print("Kiritilgan PIN: $pin");
      },
    );
  }
}
