class Calculator{

  final int height;
  final int weight;

  Calculator (this.height,this.weight);

  double _bmi;

  String bmiCalc(){
    _bmi= weight/(height/100 * height/100);
    return _bmi.toStringAsFixed(1);
  }


  String bmiRange() {
    if (_bmi < 18.5) {
      return "UNDERWEIGHT ";
    }
    else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return " NORMAL RANGE ";
    }
    else {
      return "OVERWEIGHT";
    }
  }

  String bmiObs(){
    if (_bmi < 18.5) {
      return "You need to increase weight as you are in the underweight category ";
    }
    else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return "Your bmi is in normal range ,try maintaining this range ";
    }
    else {
      return "Control your diet and exercise everyday";
    }
  }
}