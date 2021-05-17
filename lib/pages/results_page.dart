import 'package:bmi_calculator/pages/input_page.dart';
import 'package:bmi_calculator/widgets/calculate_button.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 16.0),
              child: Text('Your Result', style: kTitleTextStyle,),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('OVERWEIGHT', style: kResultTextStyle,),
                  Text('18.3', style: kBMITextStyle,),
                  Text('Your BMI result is quite low, you should eat more!', style: kBodyTextStyle, textAlign: TextAlign.center,),
                ],
              ),
            ),
          ),
          CalculateButton(
            title: 'RE-CALCULATE',
            onPressed: () {
              Navigator.maybeOf(context).pop();
            }
          ),
        ],
      ),
    );
  }
}