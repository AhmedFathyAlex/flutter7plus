import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter7plus/Comonents/ReusableComponents.dart';

import 'ResultPage.dart';

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  bool isMale = true;
  int age = 20;
  int weight = 50;
  int height = 150;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            isMale = true;
                          });
                        },
                        child: buildContainer(
                           containerColor: isMale? Colors.blue:Colors.grey,
                            myChild: buildGenderColumn(
                                iconData: Icons.male, txt: "male")),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            isMale = false;
                          });
                        },
                        child: buildContainer(
                            containerColor: !isMale? Colors.blue:Colors.grey,
                            myChild: buildGenderColumn(
                                iconData: Icons.female, txt: "female")),
                      )),
                ],
              )),
          Expanded(flex: 3, child: buildContainer(
            myChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HEIGHT',style: labelTextStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(height.toString(),style: NumberTextStyle,),
                    Text('cm',style: labelTextStyle,)
                  ],
                ),
                SliderTheme(
                  data: SliderThemeData(),
                  child: Slider(value: height.roundToDouble(), onChanged: (value){
                    setState(() {
                      height = value.toInt();
                    });
                  },min: 130,
                    max: 220,
                  activeColor: Colors.orange,),
                )

              ],
            )
          )),
          Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                      child: buildContainer(
                          myChild: buildLastColumn(
                              label: "Weight",
                              Num: weight,
                              decrement: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              increment: () {
                                setState(() {
                                  weight++;
                                });
                              }))),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: buildContainer(
                          myChild: buildLastColumn(
                              label: "Age",
                              Num: age,
                              decrement: () {
                                setState(() {
                                  age--;
                                });
                              },
                              increment: () {
                                setState(() {
                                  age++;
                                });
                              }))),
                ],
              )),
          Expanded(
              flex: 1,
              child: buildMyButton(
                  btnText: 'CALCULATE',
                  fun: () {
                    var bmi = weight / pow(height/100, 2);
                    Navigator.push(context,MaterialPageRoute(builder: (context){
                      var bmi = weight / pow((height/100), 2);
                      return ResultPage(bmi);
                    }));
                  })),
        ],
      ),
    );
  }
}
