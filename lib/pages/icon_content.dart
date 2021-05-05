import 'package:flutter/material.dart';

const labelTextStyle = TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98));

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
        Text(title, style: labelTextStyle,)
      ],
    );
  }
}