import 'package:bmi_calculator/pages/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import 'icon_content.dart';



enum Gender {
  male, female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;

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
                  Expanded(
                    child: ReusableCard(
                      onPressed: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      color: selectedGender == Gender.male ? kActiveCardColor : kInkActiveCardColor,
                      cardChild: IconContent(
                        iconData: FontAwesomeIcons.mars,
                        title: 'MALE',
                      ),
                  )),
                  Expanded(
                    child: ReusableCard(
                      onPressed: (){
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      color: selectedGender == Gender.female ? kActiveCardColor : kInkActiveCardColor,
                      cardChild: IconContent(
                        iconData: FontAwesomeIcons.venus,
                        title: 'FEMALE',
                      ),
                  )),
                ],
              ),
            ),
            Expanded(child: ReusableCard(cardChild: Container(), onPressed: (){},)),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: ReusableCard(cardChild: Container(), onPressed: (){},)),
                  Expanded(child: ReusableCard(cardChild: Container(), onPressed: (){},)),
                ],
              ),
            ),
            Container(
              color: Color(0xFFEB1555),
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
            ),
          ],
        ),
    );
  }
}