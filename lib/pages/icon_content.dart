import 'package:flutter/material.dart';

import '../constants.dart';



class IconContent extends StatelessWidget {

  final IconData iconData;
  final String title;

  const IconContent({
    @required this.iconData,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconData, size: 80.0,),
        const SizedBox(height: 15.0,),
        Text(title, style: kLabelTextStyle,)
      ],
    );
  }
}