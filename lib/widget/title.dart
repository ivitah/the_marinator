import 'package:flutter/material.dart';
import 'package:themarinator/widget/commons.dart';

class customtext extends StatelessWidget {
  final String text;
  final double size;
  final Color colors;
  final FontWeight weight;


  customtext({@required this.text, this.size, this.colors, this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontSize: size??16,fontWeight: weight??FontWeight.normal,color: colors ??black),);
  }
}
