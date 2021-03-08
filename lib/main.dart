import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'info.dart';
//fluttertoast: ^4.0.0

void main() {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'BMI Calculator',
      theme: new ThemeData.dark(
        //primarySwatch: Colors.blue,
        //primaryColor: const Color(0xFF2196f3),
        //accentColor: const Color(0xFF2196f3),
        //canvasColor: const Color(0xFFfafafa),
      ),
      //darkTheme: ThemeData.dark(),
      home: new MyHomePage(),
      routes: <String, WidgetBuilder>{
          '/info': (BuildContext context) => new Info(),
        }
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
  double _weightSliderValue = 50;
  double _heightSliderValue = 150;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
         actions: <Widget>[
          IconButton(
              icon: Icon(Icons.info),
              tooltip: "Hubungi kami",
              onPressed: () {
                Navigator.of(context).pushNamed('/info');
              })
        ],
        title: new Text('BMI Calculator'),
      ),
      body: ListView(
        children: <Widget>[
          Image(image: AssetImage('assets/flutter-ionic-banner.png')),
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
            child: Slider(
              value: _weightSliderValue,
              min: 0,
              max: 200,
              divisions: 200,
              label: _weightSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                    _weightSliderValue = value;
                    this.weight.text=value.toString();
                    });
                },
              ),
            ),
          Padding(//TextField ID
            padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0),
            child: TextField(
              controller: height,//in meter
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Height (cm)',
              ),
            ),
          ),//number padding
          Padding(//TextField ID
            padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0),
            child: Slider(
              value: _heightSliderValue,
              min: 0,
              max: 200,
              divisions: 200,
              label: _heightSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                    _heightSliderValue = value;
                    this.height.text=value.toString();
                    });
                },
              ),
            ),
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
                double meter=double.parse(height.text)/100;
                //double kg=weight.text;
                //double meter=height.text;
                String category, message;

                //formula BMI=kg/(m*m)
                double BMI=kg/(meter*meter);
                if(BMI<= 18.8){
                  message="You are UNDERWEIGHT";
                  Fluttertoast.showToast(
                    msg: message,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0
                  );
                }
                else if(BMI>=18.8 && BMI<25){
                  message="Your BMI is  NORMAL";
                  Fluttertoast.showToast(
                    msg: message,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                    fontSize: 16.0
                  );
                }
                else if(BMI>=25 && BMI<30){
                  message="Your BMI is  OVERWEIGHT";
                  Fluttertoast.showToast(
                    msg: message,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: Colors.orange,
                    textColor: Colors.white,
                    fontSize: 16.0
                  );
                }
                else if(BMI>=30){
                  message="Your BMI is categorised as OBESITY";
                  Fluttertoast.showToast(
                    msg: message,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                  );
                }//else if
              },//end onPressed
            ),
          ),
        ],
      ),
    );
  }//end Widget build
}//end class _MyHomePageState