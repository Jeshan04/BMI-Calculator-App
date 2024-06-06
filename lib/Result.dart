import 'package:bmi_calculator/reuseable.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'button.dart';
class Result extends StatelessWidget {
  const Result({Key? key, required this.BMIres, required this.resultText, required this.Advice}) ;

  final String BMIres;
  final String resultText;
  final String Advice;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            child: Text('YOUR RESULT',style:kTitleResult,
                textAlign: TextAlign.center,),
          ),
          ),
          Expanded(
            flex: 5,
            child: resuableCard(
              colour: kBackgroundCardColor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText.toUpperCase(),style: kResultText,),
                  Text(
                    BMIres,
                    style: kResultBMI,
                  ),

                  Text(Advice,textAlign: TextAlign.center, style: kLabelTextStyle,)
                ],
              ),
            ),
          ),
          BottomButton(onTap: (){
            Navigator.pop(context);
          }, buttonTitle: 'RECALCULATE')
        ],
      ),
    );
  }
}
