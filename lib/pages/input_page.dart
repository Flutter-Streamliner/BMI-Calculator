import 'package:bmi_calculator/pages/results_page.dart';
import 'package:bmi_calculator/widgets/calculate_button.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:bmi_calculator/widgets/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import '../widgets/icon_content.dart';



enum Gender {
  male, female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 183;
  int weight = 60;
  int age = 19;


  void addWeight() => setState((){ weight++; });

  void addAge() => setState((){ age++; });

  void substractWeight() => setState((){ weight <= 0 ? weight = 0 : weight--; });

  void substractAge() => setState((){ age <= 0 ? age = 0 : age--; });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
            Expanded(
              child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT', style: kLabelTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: kNumberTextStyle,),
                        Text('cm', style: kLabelTextStyle,),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: kInactiveSliderColor,
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0x29EB1555),
                        thumbColor: Color(0xFFEB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                      ),
                      child: Slider(
                        min: 120.0,
                        max: 220.0,
                        value: height.toDouble(), 
                        onChanged: (newValue){
                          setState(() {
                            height = newValue.toInt();
                          });
                        }
                      ),
                    )
                  ],
                ), 
                onPressed: (){

                },
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WEIGHT', style: kLabelTextStyle,),
                          Text(weight.toString(), style: kNumberTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: substractWeight,
                              ),
                              const SizedBox(width: 10.0),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: addWeight,
                              ),
                            ],
                          )
                        ],
                      ), 
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE', style: kLabelTextStyle,),
                          Text(age.toString(), style: kNumberTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: substractAge,
                              ),
                              const SizedBox(width: 10.0),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: addAge,
                              ),
                            ],
                          )
                        ],
                      ), 
                    ),
                  ),
                ],
              ),
            ),
            CalculateButton(
              title: 'CALCULATE YOUR BMI',
              onPressed: (){
                Navigator.maybeOf(context).push(MaterialPageRoute(builder: (context) => ResultsPage()));
              }
            ),
          ],
        ),
    );
    
  }

}