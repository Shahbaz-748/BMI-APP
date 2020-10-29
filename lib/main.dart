import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'container.dart';
import 'button.dart';
import 'calculator.dart';

const containerColor=Color(0xFF272A4D);
const activeColor= Colors.black12;
const inactiveColor= Color(0xFF272A4D);
int height=180;
int weight=50;
int age =12;


void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          accentColor: Colors.deepPurple,
        scaffoldBackgroundColor:  Color(0xff11163A),
        appBarTheme: AppBarTheme(
          color: Color(0xff11152A)
        ),
        textTheme: TextTheme(
          body1: TextStyle(
            color: Colors.white,
          )
        )
      ),
     home: InputPage(),
     
    );
  }
}


  class InputPage extends StatefulWidget {
   @override
   InputPageState createState() => InputPageState();
   }

   Color maleColor=containerColor;
   Color femaleColor= containerColor;

//m=male,f=female
   void changeColor(String c){
   if(c == "m"){
   maleColor=activeColor;
   femaleColor=containerColor;
   }



   else if(c == "f"){
   femaleColor=activeColor;
   maleColor=containerColor;
 }


class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Center(
            child: Text('BMI CALCULATOR')
        ),
      ),
      body: Column(
        children: <Widget>[

          Expanded(
              child: Row(
                 children:<Widget> [

                   Expanded(
                     child: GestureDetector(
                       onTap: (){
                         setState(() {

                           changeColor("m");
                         });
                       },
                       child: ReusableCard(
                         maleColor,
                         IconWidgets(FontAwesomeIcons.mars, "MALE")
                       ),
                     ),
                   ),

                   Expanded(
                     child: GestureDetector(
                       onTap: (){
                         setState(() {

                           changeColor("f");
                         });
                       },
                       child: ReusableCard(
                           femaleColor,
                         IconWidgets(FontAwesomeIcons.venus, "FEMALE")
                       ),
                     ),
                   ),
                 ],
              ),
          ),

          Expanded(
              child: Row(

                children: [
                  Expanded(
                    child: ReusableCard(
                     containerColor ,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:<Widget> [
                          Text("HEIGHT",
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color:Colors.white,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              height.toString()+" cm",
                              style: TextStyle(
                                fontSize: 35.0,
                                fontWeight: FontWeight.bold,
                                color:Colors.white,
                              ),
                            ),
                          ),
                         SliderTheme(
                           data: SliderThemeData(
                               thumbColor: Colors.pink,
                               thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                             overlayShape: RoundSliderOverlayShape( overlayRadius: 24.0),
                             overlayColor: Colors.white30,
                             activeTrackColor: Colors.pinkAccent,
                              inactiveTrackColor: Colors.white30,
                           ),
                           child: Slider(
                             value: height.toDouble(),
                               onChanged: (double newValue){
                             setState(() {
                               height=newValue.toInt();
                             });

                               },

                             min: 120.0,
                             max: 220.0,
                           ),
                         )
                        ],
                      ),
                    ),
                  ),
                ],
              )
          ),
          Expanded(
              child: Row(
                children: [

                  Expanded(
                    child: ReusableCard(
                     containerColor,
                     Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text(
                           "WEIGHT",
                           style: TextStyle(
                             fontSize: 30.0,
                             fontWeight: FontWeight.bold,
                             color:Colors.white,
                           ),
                         ),
                         SizedBox(
                           height: 15,
                         ),
                         Text(
                            weight.toString(),
                           style: TextStyle(
                             fontSize: 30.0,
                             fontWeight: FontWeight.bold,
                             color:Colors.white,
                           ),

                         ),

                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [

                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: ButtonRound(Icons.add, (){
                                 setState(() {
                                   weight++;
                                 });
                               }),
                             ),

                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: ButtonRound(Icons.remove, (){
                                 setState(() {
                                   weight--;
                                 });
                               }),
                             ),
                           ],
                         )
                       ],
                     ),
                     ),
                  ),

                  Expanded(
                    child: ReusableCard(
                      containerColor,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "AGE",
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color:Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              age.toString(),
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color:Colors.white,
                              ),

                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ButtonRound(Icons.add, (){
                                    setState(() {
                                        age++;
                                    });
                                  }),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ButtonRound(Icons.remove, (){
                                    setState(() {
                                      age--;
                                    });
                                  }),
                                ),
                              ],
                            )
                          ],
                        ),
                    ),
                  ),
                ],
              ),
          ),

          GestureDetector(
            onTap: (){
              Calculator calc= Calculator(height,weight);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultPage(calc.bmiCalc(),calc.bmiRange(),calc.bmiObs()) ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(top: 10.0),
               height:80.0,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("Calculate Your BMI",
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
      )
    );
  }
}


class IconWidgets extends StatelessWidget {

  IconWidgets(this.icon,this.text);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children:<Widget> [
            Icon(
                icon,
              size: 75.0,
              color: Colors.grey,
              ),

              SizedBox(
                 height: 25.0,
              ),

            Text(
              text,
              style: TextStyle(
                 fontSize:20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


