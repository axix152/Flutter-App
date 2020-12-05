import 'package:bmi/constant.dart';
import 'package:flutter/material.dart';
class IconContant extends StatelessWidget {
  IconContant({this.icon,this.lable});
  final IconData icon;
  final String lable;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          lable,
          style: klabelfixedstyle,
        ),
      ],
    );
  }
}
