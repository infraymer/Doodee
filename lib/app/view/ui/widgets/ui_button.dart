import 'package:flutter/material.dart';

class UiRaisedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const UiRaisedButton({Key key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('$text'),
      onPressed: onPressed,

    );
  }
}
