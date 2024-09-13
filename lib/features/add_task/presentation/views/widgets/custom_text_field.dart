import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.hintText, required this.controller});

  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: const Color(0xFF8B8686),
      decoration: InputDecoration(
        border: buildUnderlineBorder(),
        enabledBorder: buildUnderlineBorder(),
        focusedBorder: buildUnderlineBorder(),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xFF8B8686),
          fontSize: 16,
          fontFamily: 'Jost',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  UnderlineInputBorder buildUnderlineBorder() {
    return const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xFF8B8686),
      ),
    );
  }
}
