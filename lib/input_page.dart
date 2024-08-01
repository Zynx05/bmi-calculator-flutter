// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'results_page.dart';

enum Gender {
  male,
  female
}
double bmi = 0;
int height = 180;
int weight = 60;

int age = 20;

Color malecardColor = Color(0xFF111328);
Color femalecardColor = Color(0xFF111328);

Color inactive = Color(0xFF111328);
Color active = Color(0xFF1D1E33);


Column bottomCards(int type,String name ,Function onPressed1,Function onPressed2){
    return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name, style: TextStyle(color: Colors.grey)),
                  Text(type.toString(), style: TextStyle(fontSize: 50,fontWeight: FontWeight.w900)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      roundButton(icon: Icons.add, onTap: onPressed1),
                      SizedBox(width: 10,),
                      roundButton(icon: Icons.remove, onTap: onPressed2),
                    ],
                  ),
                ],
    );
}



Column genderCard(String gend, IconData gendIc){ 
  return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(gendIc, size: 80.0,),
          SizedBox(height: 15,),
          Text(gend, style: TextStyle(color: Colors.grey),)
        ],
    );
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("BMI CALCULATOR")),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Expanded(child: Row(
          children: [Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedGender = Gender.male;
                });
              },
              child: createCont(
                cardColor: selectedGender == Gender.male? malecardColor = active : malecardColor = inactive,
                cardChild: genderCard("MALE", FontAwesomeIcons.mars)
              ),
            )
            ),
                    Expanded(
            child: GestureDetector(
              onTap: (){
                setState(() {
                  selectedGender = Gender.female;
                });
              },
              child: createCont(
                cardColor: selectedGender == Gender.female? femalecardColor=active: femalecardColor=inactive,
                cardChild: genderCard("FEMALE", FontAwesomeIcons.venus)
              ),
            )),
            ],)),
        Expanded(child: createCont(
          cardColor: Color(0xFF1D1E33),
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("HEIGHT", style: TextStyle(color: Colors.grey)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                Text("$height", style: TextStyle(fontSize: 50,fontWeight: FontWeight.w900)),
                Text("cm" ,style: TextStyle(fontSize: 18)),
              ],),
              Slider(
                min: 120,
                max: 220,
                activeColor: Color(0xFFEB1555),
                inactiveColor: Color(0xFF8D8E98),
                value: height.toDouble(), 
                onChanged: (double value){
                  setState(() {
                    height = value.round();
                  });
              })
              ],
          ),
          )),
        Expanded(child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Expanded(
            child: createCont(
              cardColor: Color(0xFF1D1E33),
              cardChild: bottomCards(weight,"WEIGHT", (){setState(() {
                weight++;
              });
              },(){setState(() {
                weight--;
              });
              }
              ),
              )
            ),
            
                    Expanded(
            child: createCont(
              cardColor: Color(0xFF1D1E33),
              cardChild: bottomCards(age,"Age", (){setState(() {
                age++;
              });}, (){setState(() {
                age--;
              });})
              )),
            ],),
            ),
            GestureDetector(
              onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultsPage())),
              bmi = (weight / (height* height))*10000,
              },
              child: Container(
                color: Color(0xFFEB1555),
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.only(bottom: 15),
                width: double.infinity,
                height: 66,
                child: Center(
                  child: Text("Calculate",
                    style: TextStyle(fontSize: 38,fontWeight: FontWeight.w900)
                  ),
                ),
              ),
            )
      ],),
      
    );
  }
}




class roundButton extends StatelessWidget {
  const roundButton({super.key, required this.icon, required this.onTap});

  final Function onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      constraints: BoxConstraints().tighten(
        width: 56.0,
        height: 56.0
      ),
      onPressed: () => onTap(),
      child: Icon(icon),
    );
  }
}

class createCont extends StatelessWidget {
  const createCont({super.key,@required this.cardColor ,this.cardChild});
  final Color? cardColor;
  final Widget? cardChild;
  @override
  Widget build(BuildContext context) {
      return Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: cardChild,
        );
  }
  }
