import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap, required this.buttonTitle});

  final onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(buttonTitle,style: kSubmitButton,
        ),
        ),
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomButtonHeight,
      ),
    );
  }
}

class roundButton extends StatelessWidget {
  roundButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      shape: CircleBorder(),
      onPressed: onPressed,
      elevation: 6.0,
      fillColor: Color(0xFF4C4F5D),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}

