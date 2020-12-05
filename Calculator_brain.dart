import 'dart:math';
 class Calculator_brain{
   Calculator_brain({this.height,this.weight});
  final int height;
  final int weight;
  double _bmi;
  String calculateBMI(){
     _bmi= weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if(_bmi>=25)
      {
        return "Overweight";
      }else if(_bmi>18.5)
        {
          return "Normal";
        }
    else {
      return "Underweight";
    }
  }
  String getInterpretation(){
    if(_bmi>=25)
    {
      return "Ohhh your weight is more then normal try to get exercise daily..";
    }else if(_bmi>18.5)
    {
      return "Weldone your weight is normal ...EnJOY!!";
    }
    else {
      return "Your weight is less then the Normal try to eat more ..!";
    }
 }
 }