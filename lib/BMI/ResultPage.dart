import 'package:flutter/material.dart';
import 'package:flutter7plus/Comonents/ReusableComponents.dart';
class ResultPage extends StatelessWidget {
  ResultPage(this.bmi){
    if(bmi < 18.0){
      messege = "UNDER WEIGHT";
      messegeColor = Colors.yellow;
    }
    else if(bmi > 24){
      messege = 'OVER WEIGHT';
      messegeColor = Colors.red;
    }
    else{
      messege = 'NORMAL';
      messegeColor = Colors.green;
    }
  }
  String? messege;
  double bmi;
  Color? messegeColor;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Text("TOTAL RESULT",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 50
          ),),
          Expanded(flex: 7,
              child: buildContainer(containerColor: Colors.grey,myChild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text(messege!,style: TextStyle(color: messegeColor,fontSize: 25),)),
                  Center(
                    child: Text(bmi.toStringAsFixed(1),style: TextStyle(
                      fontSize: 75,
                      color: Colors.white
                    ),),
                  )
                ],
              ))),
          Expanded(
            flex: 1,
              child: buildMyButton(btnText: "RE-CALCULATE",fun: (){
                Navigator.pop(context);
              }))
        ],
      ),
    );
  }
}
