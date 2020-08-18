import 'package:dudi/app/view/assets/ui_shadows.dart';
import 'package:flutter/material.dart';

class CustomOval extends StatelessWidget {
  final Widget child;
  final double size;

  const CustomOval({
    Key key,
    this.child,
    this.size = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          child: ClipOval(child: child),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(size/2 - 10))),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(size / 2)),
          color: Colors.white,
          boxShadow: [UiShadows.main]),
    );
  }
}
