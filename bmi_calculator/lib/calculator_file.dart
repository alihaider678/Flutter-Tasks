import 'dart:math';

class CalculatorBrain{
  CalculatorBrain({required this.height, required this.weight}) {
    // TODO: implement CalculatorBrain
    throw UnimplementedError();
  }

  final int height;
  final int weight;
  double _bmi;
  String CalculateBMI(){
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25){
      return 'Overweight';
    }
    else if (_bmi > 18.5){
      return 'Normal';
    }
    else{
      return 'UnderWeight';
    }
  }
String getInterpretation(){
    if(_bmi >= 25){
      return 'You have a higher than normal body weight. Try to exercise more.';
    }
    else if(_bmi > 18.5){
      return 'You have a normal body weight. Good Job!';
    }
    else{
      return 'You have a normal than normal body weight. You can eat a bit more.';
    }
}
}
