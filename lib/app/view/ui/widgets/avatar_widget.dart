import 'package:flutter/material.dart';

import 'custom_oval.dart';



class AvatarWidget extends StatelessWidget {
  final String imageUrl;
  const AvatarWidget({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomOval(
      child: Image.network(
        imageUrl ?? '',
        fit: BoxFit.cover,
      ),
    );
  }
}
