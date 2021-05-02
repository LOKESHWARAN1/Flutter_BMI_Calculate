import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _height = 100.0;
  double _weight = 50.0;
  int _bmi = 0;
  String _condition = 'Select Data';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            height: size.height * 0.40,
            width: double.infinity,
            color: Colors.blueAccent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "BMI",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Calculator",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "$_bmi",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RichText(
                    text: TextSpan(
                        text: "Condition : ",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w200,
                          color: Colors.white,
                        ),
                        children: [
                      TextSpan(
                        text: "$_condition",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    ])),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(
                  'Choose Data',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.blueAccent),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                RichText(
                    text: TextSpan(
                        text: "Height : ",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w200,
                          color: Colors.blueGrey,
                        ),
                        children: [
                      TextSpan(
                        text: "$_height cm",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      )
                    ])),
                Slider(
                  value: _height,
                  min: 0,
                  max: 250,
                  onChanged: (height) {
                    setState(() {
                      _height = height;
                    });
                  },
                  label: "$_height",
                  divisions: 250,
                  activeColor: Colors.blueAccent,
                  inactiveColor: Colors.blue,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                RichText(
                    text: TextSpan(
                        text: "Weight : ",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w200,
                          color: Colors.blueGrey,
                        ),
                        children: [
                      TextSpan(
                        text: "$_weight kg",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      )
                    ])),
                Slider(
                  value: (_weight).round().toDouble(),
                  min: 0,
                  max: 200,
                  onChanged: (weight) {
                    setState(() {
                      _weight = weight;
                    });
                  },
                  label: "$_weight",
                  divisions: 200,
                  activeColor: Colors.blueAccent,
                  inactiveColor: Colors.blue,
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Container(
                  width: size.width * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          _bmi = (_weight / ((_height / 100) * (_height / 100)))
                              .round()
                              .toInt();
                          if (_bmi >= 18.5 && _bmi <= 25) {
                            _condition = "Normal";
                          } else if (_bmi > 25 && _bmi <= 30) {
                            _condition = "Overweight";
                          } else if (_bmi > 30) {
                            _condition = "Obesity";
                          } else {
                            _condition = "Underweight";
                          }
                        });
                      },
                      child: Text(
                        'Calculate',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
