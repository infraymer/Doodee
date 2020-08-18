import 'package:flutter/material.dart';

class UiDecorations {
  static const topBottomSheet = const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
  );
}
