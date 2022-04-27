import 'package:e_warong/app/themes/app_colors.dart';
import 'package:e_warong/app/themes/app_text.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        hintStyle: primaryTextStyle,
        border: InputBorder.none,
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: secondaryColor,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      validator: validator,
    );
  }
}
