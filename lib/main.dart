import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'BMI Calculator',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('BMI Calculator'),
      ),
      body: ListView(
        children: <Widget>[
          Image(image: AssetImage('assets/bannerBMI.png')),
          Padding(//TextField ID
            padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0),
            child: TextField(
                controller: weight,//in kg
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Weight (kg)',
              ),
            ),
          ),//padding name
          Padding(//TextField ID
            padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0),
            child: TextField(
              controller: height,//in meter
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Height (meter)',
              ),
            ),
          ),//number padding
          Padding(
            padding: EdgeInsets.all(16.0),
            child:RaisedButton(
              textColor: Colors.white,
              color: Colors.green,
              child: const Text(
                  'Calculate BMI',
                  style: TextStyle(fontSize: 20)
              ),
              onPressed: () {
                /* BMI calculation process
                formula BMI=kg/(m*m)
                BMI Categories:
                  Underweight = <18.5
                  Normal weight = 18.5–24.9
                  Overweight = 25–29.9
                  Obesity = BMI of 30 or greater
                */
                double kg=double.parse(weight.text);
                double meter=double.parse(height.text);
                //formula BMI=kg/(m*m)
                double BMI=kg/(meter*meter);
              },//end onPressed
            ),
          ),
        ],

      ),
    );
  }
}