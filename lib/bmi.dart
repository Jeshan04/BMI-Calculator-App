import 'dart:math';

class BMI {
  BMI({required this.height, required this.weight});
  final int height;
  final int weight;

  String res(){
    double _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getRes(){
    double _bmi = weight / pow(height / 100, 2);
    if(_bmi >= 25){
      return 'Overweight';
    }
    else if(_bmi > 18.5){
      return 'Normal';
    }
    else {
      return 'Underweight';
    }
  }
  String Advice(){
    double _bmi = weight / pow(height / 100, 2);
    if(_bmi >= 25){
      return 'Focus on portion control and increasing physical activity to achieve a healthier weight.';
    }
    else if(_bmi > 18.5){
      return 'Maintain a balanced diet and regular exercise routine to sustain your healthy weight.';
    }
    else {
      return 'Incorporate nutrient-dense foods and strength training exercises to build muscle mass and improve overall health.';
    }
  }
}
