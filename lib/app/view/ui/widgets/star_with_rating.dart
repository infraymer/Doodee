import 'package:flutter/material.dart';

import 'custom_oval.dart';

class StarWithRating extends StatelessWidget {
  final String value;
  const StarWithRating({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          CustomOval(
              size: 36,
              child: Container(
                  color: Colors.yellow[600],
                  child: Icon(Icons.star, color: Colors.white, size: 20))),
          Container(
            transform: Matrix4.translationValues(8.0, -4.0, 0.0),
            child: CustomOval(
                size: 24,
                child: Container(
                    color: Colors.yellow[600],
                    child: Center(
                        child: Text(value ?? '0.0',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(fontSize: 8))))),
          )
        ],
      ),
    );
  }
}
