import 'dart:math';

class Brain{

  Brain(
        {
          required this.hieght,
          required this.weight,
        }
      );

  final int hieght ;
  final int weight ;


  String getBmiScore(){
    double _bmi ;
    _bmi = weight / pow(hieght / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getBmiResult(){
    double _bmi ;
    _bmi = weight / pow(hieght / 100, 2);
    if(_bmi >= 25){
      return 'OverWeight';
    }else if(_bmi >= 18.5){
      return 'Normal';
    }else{
      return 'UnderWeight';
    }
  }


  String getBmiResultText(){
    double _bmi ;
    _bmi = weight / pow(hieght / 100, 2);
    if(_bmi >= 25){
      return 'You have a higher than normal body weight. Try to exercise more.';
    }else if(_bmi >= 18.5){
      return 'You have a normal body weight Good Job!! ';
    }else {
      return 'You have a lower than normal body weight. You can eat a bit more';
    }
  }



}