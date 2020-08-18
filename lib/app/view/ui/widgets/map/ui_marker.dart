import 'package:dudi/app/view/assets/ui_shadows.dart';
import 'package:flutter/material.dart';

class UiMarker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.white, width: 2),
        color: Theme.of(context).accentColor,
        boxShadow: [UiShadows.marker]
      ),
      child: Icon(Icons.store, color: Colors.white),
    );
  }
}
