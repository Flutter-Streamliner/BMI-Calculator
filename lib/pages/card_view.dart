import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  final Color color;

  const ReusableCard({this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color ?? Color(0xFF1D1E33),
          borderRadius: BorderRadius.circular(10.0)
        ),
      );
  }
}