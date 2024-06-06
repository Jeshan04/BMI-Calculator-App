import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reuseable.dart';
import 'constants.dart';
import 'Result.dart';
import 'button.dart';
import 'bmi.dart';

enum GENDER{
  male,female
}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GENDER? selected;
  int height = 180;
  int weight = 70;
  int age = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: (){
                      setState(() {
                          selected = GENDER.male;
                      });
                  },
                  child: resuableCard(
                    colour: selected == GENDER.male ? kActiveCardColor : kBackgroundCardColor,
                    cardchild: iconContent(icon: FontAwesomeIcons.mars,label:'MALE',),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selected = GENDER.female;
                    });
                  },
                  child: resuableCard(
                    colour: selected == GENDER.female ? kActiveCardColor : kBackgroundCardColor,
                    cardchild: iconContent(icon: FontAwesomeIcons.venus,label:'FEMALE',),
                  ),
                ),
              ),
            ],
          )),
          Expanded(child: resuableCard( colour: kBackgroundCardColor,
            cardchild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('HEIGHT',style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.ideographic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style:kNumberStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 90.0,
                    max: 270.0,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue){
                      setState(() {
                      height = newValue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
            ),
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: resuableCard(
                  colour: kBackgroundCardColor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('WEIGHT',
                      style: kLabelTextStyle,),
                      Text(
                        weight.toString(),
                        style: kNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          roundButton(icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState((){
                              weight--;
                              });
                              }),
                          SizedBox(width: 10.0,),
                          roundButton(icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState((){
                                  weight++;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: resuableCard(
                  colour: kBackgroundCardColor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('AGE',
                        style: kLabelTextStyle,),
                      Text(
                        age.toString(),
                        style: kNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          roundButton(icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState((){
                                  age--;
                                });
                              }),
                          SizedBox(width: 10.0,),
                          roundButton(icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState((){
                                  age++;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
          BottomButton(onTap: (){
            BMI obj = BMI(height: height, weight: weight);

            Navigator.push(context,
            MaterialPageRoute(builder: (context)=>Result(
              BMIres: obj.res(),
              resultText: obj.getRes(),
              Advice: obj.Advice(),
            )));
          },
          buttonTitle: "CALCULATE",),
        ],
      )
    );
  }
}





