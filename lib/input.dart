import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reuseable.dart';

const bottomButtonHeight = 80.0;
const backgroundCardColor = Color(0xFF1D1E33);
const activeCardColor = Color(0xFF00B13B);

enum GENDER{
  male,female
}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GENDER? selected;

  // Color maleCardColor = backgroundCardColor;
  // Color femaleCardColor = backgroundCardColor;
  // void updateColor(GENDER gender){
  //   if(gender == GENDER.male){
  //     if(maleCardColor == backgroundCardColor) {
  //       maleCardColor = activeCardColor;
  //       femaleCardColor = backgroundCardColor;
  //     }
  //     else
  //       maleCardColor = backgroundCardColor;
  //   }
  //   if(gender == GENDER.female){
  //     if(femaleCardColor == backgroundCardColor) {
  //       femaleCardColor = activeCardColor;
  //       maleCardColor = backgroundCardColor;
  //     } else
  //       femaleCardColor = backgroundCardColor;
  //   }
  //
  //
  // }
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
                    colour: selected == GENDER.male ? activeCardColor : backgroundCardColor,
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
                    colour: selected == GENDER.female ? activeCardColor : backgroundCardColor,
                    cardchild: iconContent(icon: FontAwesomeIcons.venus,label:'FEMALE',),
                  ),
                ),
              ),
            ],
          )),
          Expanded(child: resuableCard( colour: backgroundCardColor,),),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: resuableCard( colour: backgroundCardColor,),),
              Expanded(child: resuableCard( colour: backgroundCardColor,),),
            ],
          )),
          Container(
            color: Color(0xFFEB1555),
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomButtonHeight,
          )
        ],
      )
    );
  }
}



