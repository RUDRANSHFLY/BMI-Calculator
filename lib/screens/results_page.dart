import 'package:bmi/component/bottom_button.dart';
import 'package:bmi/constants.dart';
import 'package:bmi/component/reuseable_card_bmi.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({
    super.key,
    required this.bmiResult,
    required this.bmiResultText,
    required this.bmiScore,
  });

  final String bmiScore;
  final String bmiResult;
  final String bmiResultText;

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'YOUR RESULTS',
                style: TextStyle(
                  fontFamily: 'Handjet',
                  fontSize: 50.0,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: ReuseableCardBMI(
              cardColor: kactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    bmiResult,
                    style: kresultTextStyle,
                  ),
                  Text(
                    bmiScore,
                    style: kBMITextStyle,
                  ),
                  Text(
                    bmiResultText,
                    style: kBMIBodyTestStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonText: 'RE-CALCULATE BMI',
            bottomButtonPress: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
