import 'package:e_warong/app/themes/app_colors.dart';
import 'package:e_warong/app/themes/app_text.dart';
import 'package:flutter/material.dart';

class CustomSubmitButton extends StatelessWidget {
  final Widget? icon;
  final String text;
  final Function onSubmit;

  const CustomSubmitButton({
    Key? key,
    this.icon,
    required this.text,
    required this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: secondaryColor,
      child: InkWell(
        onTap: () => onSubmit(),
        splashColor: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: primaryColor,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (icon != null) icon!,
                if (icon != null) const SizedBox(width: 8),
                Text(
                  text,
                  style: boldTextStyle.copyWith(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
