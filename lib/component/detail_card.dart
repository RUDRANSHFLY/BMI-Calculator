import 'package:flutter/material.dart';
import '../constants.dart';



class DetailCard extends StatelessWidget {
  const DetailCard({
    super.key,
    required this.setText,
    required this.setIcon,
  });

  final String setText ;
  final IconData setIcon ;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            setIcon,
            size: 80.0,
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            setText,
            style: const TextStyle(
              fontSize: kheadingFontSize,
              fontFamily: 'Handjet',
              letterSpacing: 3.0,
            ),
          )
        ],
      ),
    );
  }
}