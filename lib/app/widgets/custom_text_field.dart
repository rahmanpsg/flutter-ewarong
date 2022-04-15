import 'package:e_warong/app/themes/app_colors.dart';
import 'package:e_warong/app/themes/app_text.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
        border: Border.all(
          color: primaryColor,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: TextField(
          obscureText: obscureText,
          onChanged: (text) {},
          keyboardType: keyboardType,
          controller: controller,
          decoration: InputDecoration(
            hintStyle: primaryTextStyle,
            border: InputBorder.none,
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}
