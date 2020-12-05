import 'package:flutter/material.dart';
import 'Input_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
void main() {
  runApp(BMIcalcultor());
}
class BMIcalcultor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Color(0xFF0A0E21),
            accentColor: Colors.purple,
              ),

      home: Inputpage(),);
  }
}
