// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'input_page.dart';



String getCond(){
  if(bmi <18.5) {
    return "Underweight";
  }
  if(bmi >= 18.5 && bmi <= 24.9) {
    return "Healthy";
  }
  if(bmi >= 25 && bmi <= 30) {
    return "Overweight";
  }
  if(bmi > 30) {
    return "Obese";
  } else {
    return "Nigger";
  }
}


String getDesc(){
  if(bmi <18.5) {
    return "Lower than normal body weight,\nshould eat a bit more";
  }
  if(bmi >= 18.5 && bmi <= 24.9) {
    return "You have normal body weight.";
  }
  if(bmi >= 25 && bmi <= 30) {
    return "You have higher than normal body weight";
  } else {
    return "You have higher than normal body weight";
  }
}




class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Expanded(child: Text('BMI CALCULATOR',textAlign: TextAlign.justify,)),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        Expanded(
          flex: 2,
          child: Center(
            child: Text('Your Result', 
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900),
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Color(0xFF1D1E33),
            borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                
                Expanded(child: Center(child: 
                  Text(getCond(), style: 
                    TextStyle(color: Colors.green,fontSize: 20, fontWeight: FontWeight.w900),)
                    )
                  ),
                
                Expanded(child: Center(child: 
                  Text(bmi.toStringAsFixed(1), style: 
                    TextStyle(fontSize: 70, fontWeight: FontWeight.w900),)
                    )
                  ),
                
                Expanded(child: Center(child: 
                  Text(getDesc(), style: 
                    TextStyle(fontSize: 14, fontWeight: FontWeight.w800),)
                    )
                  ),
              ],
              ),
          ),
        ),
        GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                color: Color(0xFFEB1555),
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.only(bottom: 15),
                width: double.infinity,
                height: 66,
                child: Center(
                  child: Text("Re-Calculate",
                    style: TextStyle(fontSize: 38,fontWeight: FontWeight.w900)
                  ),
                ),
              ),
            )
        
      ],)
    );
  }
}
