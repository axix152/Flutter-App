import 'package:bmi/Input_page.dart';
import 'package:bmi/constant.dart';
import 'package:flutter/material.dart';
import 'Reuseable.dart';
import 'Calculator_brain.dart';
class Result_page extends StatelessWidget {
  Result_page({@required this.bmiresult,@required this.resulttext,@required this.interpretation});
  final String bmiresult;
  final String resulttext;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text("YOUR RESULT",style: Kyourresult,
                ),
              ),
          ),
          Expanded(
            flex: 5,
            child: Resuablecard(
            colour: kActivecolor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(bmiresult, style: KBMIvalue,),
                  Text(resulttext,style:kBMIbodytext,),
                  Text(interpretation,style:kBMIbodytext,textAlign: TextAlign.center,),
                ],
              ),
          ),
          ),
          ButtonButton(ontap: (){
            Navigator.pop(context);
          },
          buttonlable: "RE-CALCULATE"),
        ],
      ),
    );
  }
}
