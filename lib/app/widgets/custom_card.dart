import 'package:e_warong/app/themes/app_colors.dart';
import 'package:e_warong/app/themes/app_text.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class CustomCard extends StatelessWidget {
  final String? fotoUrl;
  final String title;
  final String subtitle;
  final Function() onTap;

  const CustomCard(
      {Key? key,
      this.fotoUrl,
      required this.title,
      required this.subtitle,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                fotoUrl != null
                    ? Image.network(
                        fotoUrl!,
                        fit: BoxFit.cover,
                      )
                    : Positioned(
                        left: 0,
                        right: 0,
                        // top: boxConstraints.minHeight * 0.1,
                        top: -50,
                        bottom: 0,
                        child: Icon(
                          LineIcons.image,
                          size: 80,
                          color: primaryColor,
                        ),
                      ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    color: Colors.black.withOpacity(0.5),
                    child: Column(
                      children: [
                        Text(
                          title,
                          style: primaryTextStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          subtitle,
                          style: boldTextStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
