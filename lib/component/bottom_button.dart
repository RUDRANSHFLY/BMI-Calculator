import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.buttonText,
    required this.bottomButtonPress,
  });

  final String buttonText;
  final VoidCallback bottomButtonPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: bottomButtonPress,
      child: Container(
        color: kbootomContainerColor,
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kbootomButtonHieght,
        child: Center(
          child: Text(
            buttonText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Handjet',
              fontSize: 30.0,
              letterSpacing: 3.0,
            ),
          ),
        ),
      ),
    );
  }
}