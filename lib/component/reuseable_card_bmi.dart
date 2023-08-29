import 'package:flutter/material.dart';

class ReuseableCardBMI extends StatelessWidget {
  const ReuseableCardBMI(
        {
          super.key,
          required this.cardChild,
          required this.cardColor,
        }
      );

  final Widget cardChild ;
  final Color cardColor ;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: cardChild,
    );
  }
}