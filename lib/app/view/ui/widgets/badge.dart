import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {
  final int count;
  final double size;
  final double fontSize;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final Color textColor;

  const BadgeWidget({
    Key key,
    this.count = 0,
    this.size = 25,
    this.fontSize = 12,
    this.backgroundColor = Colors.red,
    this.borderColor = Colors.white,
    this.borderWidth = 0,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: Center(
        child: Text(
          count.toString(),
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: textColor ?? Colors.white,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(width: borderWidth, color: borderColor),
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: backgroundColor,
      ),
    );
  }
}
