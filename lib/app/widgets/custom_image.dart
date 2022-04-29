import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class CustomImage extends StatelessWidget {
  final String? foto;
  final double size;
  final Widget empty;
  final double borderRadius;

  const CustomImage({
    Key? key,
    this.foto,
    this.size = 100,
    this.empty = const Icon(LineIcons.image),
    this.borderRadius = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: size,
        height: size,
        color: Colors.grey[300],
        child: foto != null
            ? Image.network(
                foto!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.amber,
                    alignment: Alignment.center,
                    child: empty,
                  );
                },
              )
            : empty,
      ),
    );
  }
}
