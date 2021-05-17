import 'package:flutter/material.dart';

import '../constants.dart';

class CalculateButton extends StatelessWidget {
  final Function onPressed;
  final String title;

  const CalculateButton({@required this.onPressed, @required this.title});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: Color(0xFFEB1555),
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Text(title, textAlign: TextAlign.center , style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 24,),),
      ),
    );
  }
}