import 'package:flutter/material.dart';

class UiShadows {
  static final main = BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 1,
    blurRadius: 1,
    offset: Offset(1, 2),
  );

  static final marker = BoxShadow(
    color: Colors.black45,
    spreadRadius: 2,
    blurRadius: 2,
    offset: Offset(1, 2),
  );

  static final button = BoxShadow(
    color: Color.fromRGBO(50, 157, 156, 0.21),
    blurRadius: 11,
    offset: Offset(4, 4),
  );
}
