import 'package:flutter/material.dart';
//import 'package:toast/toast.dart';
import 'main.dart';

class Info extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text('Hubungi kami')),
      body: ListView(
        children: <Widget>[
          Image(image: AssetImage('assets/flutter-ionic-banner.png')),
        ],
      ),
    );
  }
}
