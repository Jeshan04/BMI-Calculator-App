import 'package:flutter/material.dart';

class resuableCard extends StatelessWidget {
  resuableCard({required this.colour, this.cardchild});

  final Color colour;
  final Widget? cardchild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardchild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),

    );
  }
}
