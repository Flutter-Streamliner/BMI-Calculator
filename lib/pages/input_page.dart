import 'package:bmi_calculator/pages/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';

const bottomContainerHeight = 80.0;
const inactiveCardColor = Color(0xFF111328);
const activeCardColor = Color(0xFF1D1E33);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColor = inactiveCardColor;
  Color femaileCardColor = inactiveCardColor;

  // 1 - male, 2 - female
  void _updateColor(int gender) {
    if (gender == 1) {
      if (maleCardColor == inactiveCardColor) {
        maleCardColor = activeCardColor;
        femaileCardColor = inactiveCardColor;
      } else {
        maleCardColor = inactiveCardColor;
      }
    } else {
      if (femaileCardColor == inactiveCardColor) {
        femaileCardColor = activeCardColor;
        maleCardColor = inactiveCardColor;
      } else {
        femaileCardColor = inactiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: GestureDetector(
                    onTap:  () => setState(() => _updateColor(1)),
                    child: ReusableCard(
                      color: maleCardColor,
                      cardChild: IconContent(
                        iconData: FontAwesomeIcons.mars,
                        title: 'MALE',
                      ),
                    ),
                  )),
                  Expanded(child: GestureDetector(
                    onTap: () => setState(() => _updateColor(2)),
                    child: ReusableCard(
                      color: femaileCardColor,
                      cardChild: IconContent(
                        iconData: FontAwesomeIcons.venus,
                        title: 'FEMALE',
                      ),
                    ),
                  )),
                ],
              ),
            ),
            Expanded(child: ReusableCard()),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: ReusableCard()),
                  Expanded(child: ReusableCard()),
                ],
              ),
            ),
            Container(
              color: Color(0xFFEB1555),
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            ),
          ],
        ),
    );
  }
}