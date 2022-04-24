import 'package:e_warong/app/themes/app_colors.dart';
import 'package:e_warong/app/themes/app_text.dart';
import 'package:flutter/material.dart';

class CustomSubmitButton extends StatelessWidget {
  final Widget? icon;
  final String text;
  final Color? color;
  final Function onSubmit;
  final bool isLoading;

  const CustomSubmitButton({
    Key? key,
    this.icon,
    this.color = secondaryColor,
    required this.text,
    required this.onSubmit,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isLoading ? Colors.grey[300] : color,
      child: InkWell(
        onTap: () => onSubmit(),
        splashColor: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (isLoading) CircularProgressIndicator(),
                if (!isLoading) ...[
                  if (icon != null) ...[icon!, const SizedBox(width: 8)],
                  Text(
                    text,
                    style: boldTextStyle.copyWith(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
