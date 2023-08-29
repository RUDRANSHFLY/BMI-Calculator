import 'package:bmi/component/round_icon_button.dart';
import 'package:bmi/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../component/bottom_button.dart';
import '../component/reuseable_card_bmi.dart';
import '../component/detail_card.dart';
import '../constants.dart';
import 'package:bmi/brain.dart';

enum Gender {
  male,
  female,
  none,
}
Gender selectedGender = Gender.none;
int hieght = 150;
int weight = 60;
int age = 20;

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
          child: Text(
            'BMI',
            style: TextStyle(
              fontFamily: 'Handjet',
              fontSize: 50,
              letterSpacing: 5,
            ),
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReuseableCardBMI(
                      cardColor: selectedGender == Gender.male
                          ? kactiveCardColor
                          : kinactiveCardColor,
                      cardChild: const DetailCard(
                        setText: 'Male',
                        setIcon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReuseableCardBMI(
                      cardColor: selectedGender == Gender.female
                          ? kactiveCardColor
                          : kinactiveCardColor,
                      cardChild: const DetailCard(
                        setText: 'Female',
                        setIcon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableCardBMI(
              cardColor: kinactiveCardColor,
              cardChild: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Hieght',
                        style: TextStyle(
                          fontFamily: 'Handjet',
                          fontSize: kheadingFontSize,
                          letterSpacing: 2.0,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            hieght.toString(),
                            textAlign: TextAlign.center,
                            style: kBigNumberStyle,
                          ),
                          const Text(
                            'cm',
                            style: kBigNumberStyle,
                          )
                        ],
                      ),
                      Slider(
                        value: hieght.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        activeColor: Colors.white,
                        inactiveColor: Colors.black87,
                        onChanged: (double newValue) {
                          setState(() {
                            hieght = newValue.toInt();
                          });
                        },
                      )
                    ]),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableCardBMI(
                    cardColor: kinactiveCardColor,
                    cardChild: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'WEIGHT',
                            style: TextStyle(
                              fontFamily: 'Handjet',
                              fontSize: 30.0,
                              letterSpacing: 3.0,
                            ),
                          ),
                          Text(
                            weight.toString(),
                            style: kBigNumberStyle,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPress: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPress: () {
                                    setState(() {
                                      if (weight != 0) {
                                        weight--;
                                      }
                                    });
                                  },
                                ),
                              ]),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCardBMI(
                    cardColor: kinactiveCardColor,
                    cardChild: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'AGE',
                            style: TextStyle(
                              fontFamily: 'Handjet',
                              fontSize: 30.0,
                              letterSpacing: 3.0,
                            ),
                          ),
                          Text(
                            age.toString(),
                            style: kBigNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPress: () {
                                    setState(() {
                                      age++;
                                    });
                                  }),
                              const SizedBox(
                                width: 20.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(
                                    () {
                                      if (age != 0) {
                                        age--;
                                      }
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonText: 'CALCULATE BMI',
            bottomButtonPress: () {
              setState(() {
                Brain brain = Brain(hieght: hieght, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                        bmiResult: brain.getBmiResult(),
                        bmiResultText: brain.getBmiResultText(),
                        bmiScore: brain.getBmiScore(),
                      )),
                );
              });
            },
          ),
        ],
      ),
    );
  }
}
