import 'dart:math';

import 'package:bmi/Calculator_brain.dart';
import 'package:bmi/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Icon_contant.dart';
import 'Reuseable.dart';
import 'constant.dart';
import 'result_page.dart';
enum Gender{
  male,
  female,
}
class Inputpage extends StatefulWidget {
  @override
  _InputpageState createState() => _InputpageState();
}

class _InputpageState extends State<Inputpage> {
  Gender selectgender;
  int height=180;
  int weight=60;
  int age=19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Resuablecard(
                  onpress: (){
                    setState(() {
                      selectgender=Gender.male;
                    });
                  },
                  cardchild: IconContant(icon: FontAwesomeIcons.mars,lable: 'MALE',),
                    colour: selectgender==Gender.male ? kActivecolor : kInactivecolor,
                ),
              ),
              Expanded(child:
              Resuablecard(
                onpress: (){
                  setState(() {
                    selectgender=Gender.female;
                  });
                },
                cardchild: IconContant(icon: FontAwesomeIcons.venus,lable: "FEMALE",),
                colour: selectgender==Gender.female ? kActivecolor : kInactivecolor,
              ),
              ),],
          )),
          Expanded(child: Resuablecard(colour: kActivecolor,
          cardchild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("HEIGHT",style: klabelfixedstyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                  height.toString(),
                    style: Klabblefixedstyle,
),
                  Text('Cm',
                  style: klabelfixedstyle,),

                ],
              ),
              
              SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTickMarkColor: Color(0xFF8D8E98),
                      thumbShape:
                      RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                      RoundSliderOverlayShape(overlayRadius: 25.0),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                    ),
                child: Slider(
                  value: height.toDouble(),
                  min: 120.0,
                  max: 220.0,
                  onChanged: (double newvalue){
                   setState(() {
                     height=newvalue.round();
                   });
                },
                ),
              ),
            ],
          ),
          ),),
          Expanded(
            child: Row(
              children: [
                Expanded(child: Resuablecard(colour: kActivecolor,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("WEIGHT",style: klabelfixedstyle,),
                    Text(
                      weight.toString(),style: Klabblefixedstyle,
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(
                        onpressed: (){
                          setState(() {
                            weight--;
                          });
                        },
                        icon: FontAwesomeIcons.minus,),
                      SizedBox(
                        width: 15.0,
                      ),
                      RoundIconButton(
                        onpressed: (){
                          setState(() {
                            weight++;
                          });
                        },
                        icon: FontAwesomeIcons.plus,),
                    ],
                  ),
                  ],
                ),
                )),
                Expanded(child: Resuablecard(
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("AGE",style: klabelfixedstyle,),
                      Text(
                        age.toString(),style: Klabblefixedstyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            onpressed: (){
                              setState(() {
                                age--;
                              });
                            },
                            icon: FontAwesomeIcons.minus,),
                          SizedBox(
                            width: 15.0,
                          ),
                          RoundIconButton(
                            onpressed: (){
                              setState(() {
                                age++;
                              });
                            },
                            icon: FontAwesomeIcons.plus,),
                        ],
                      ),
                    ],
                  ),
                    colour: kActivecolor)),
              ],
            ),
          ),
        ButtonButton(ontap: (){
          Calculator_brain cal=Calculator_brain(height: height,weight: weight);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Result_page(
            bmiresult: cal.calculateBMI(),
            resulttext: cal.getResult(),
            interpretation: cal.getInterpretation(),
          ),),);
        },buttonlable: "CALCULATE",),
        ],
      ),
    );
  }
}

class ButtonButton extends StatelessWidget {

  ButtonButton({@required this.ontap,@required this.buttonlable});
  final Function ontap;
  final String buttonlable;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Center(child: Text(buttonlable,style: Klargebutton,)),
        color: Color(0xFFFB1555),
        padding: EdgeInsets.only(bottom: 10.0),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottemconterheight,
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget{
 RoundIconButton({@required this.icon,@required this.onpressed});
final IconData icon;
final Function onpressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onpressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
