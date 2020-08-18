import 'package:flutter/material.dart';

class AccentButton extends StatelessWidget {
  final Widget title;
  final Color color;
  final double cornerRadius;
  final Function onPressed;
  const AccentButton(
      {Key key, this.title, this.color, this.cornerRadius = 15, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cornerRadius)),
        color: color ?? Theme.of(context).accentColor,
        disabledColor:
            (color ?? Theme.of(context).accentColor).withOpacity(0.7),
        onPressed: onPressed,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 10, 8, 10), child: title));
  }
}
