import 'dart:math';

import 'package:bmi_calculator/container.dart';
import 'package:bmi_calculator/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'calculator.dart';


class  ResultPage extends StatelessWidget {

  ResultPage(this.bmi, this.result, this.obs);

  final String bmi;
  final String result;
  final String obs;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
     appBar:  AppBar(
        title: Text("BMI  Calculator"),
      ),
      body: Column(
         children:<Widget> [
             Expanded(
               child: Padding(
                 padding: const EdgeInsets.all(18.0),
                 child: Text(
                  "YOUR RESULT",
                   style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                   ),
                 ),
               ),
             ),

           Expanded(
             flex: 4,
             child: ReusableCard(
                containerColor,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                         Text(
                            bmi,
                        style: TextStyle(   color: Colors.white,
                           fontSize: 40.0,
                           fontWeight: FontWeight.bold,
                           ),
                         ),


                     Text(
                       result,
                       style: TextStyle(
                         fontSize: 40.0,
                         fontWeight: FontWeight.bold,
                         color: Colors.green,
                       ),
                     ),


                     Text(
                       obs,
                       style: TextStyle(   color: Colors.white,
                         fontSize: 30.0,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ],
                )
             )
           ),


           GestureDetector(
             onTap: (){
               Navigator.pop(context);
             },
             child: Container(
               margin: EdgeInsets.only(top: 10.0),
               height:80.0,
               child: Padding(
                 padding: const EdgeInsets.all(18.0),
                 child: Text("Re-Calculate  BMI",
                   style: TextStyle(
                     fontSize: 20.0,
                     color: Colors.white,
                     fontWeight: FontWeight.bold,
                   ),
                   textAlign: TextAlign.center,
                 ),
               ),
               width:double.infinity,
               color: Colors.pink,
             ),
           ),

         ],
      ),
    );
  }
}



