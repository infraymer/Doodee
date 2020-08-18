import 'package:flutter/material.dart';

import 'accept_button.dart';

class WelcomeWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const WelcomeWidget({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 2, color: Theme.of(context).accentColor),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 16, 40, 16),
          child: Column(children: [
            Text('Welcome!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black54)),
            SizedBox(height: 10),
            Text('Place Enable Your Location',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black54)),
            SizedBox(height: 20),
            SizedBox(
                width: 150,
                height: 45,
                child: AccentButton(
                    onPressed: onPressed,
                    cornerRadius: 16,
                    title: Text('Enable',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold)))),
          ]),
        ),
      ),
    );
  }
}
