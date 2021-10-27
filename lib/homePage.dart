import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageApp extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePageApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(
        title: Center(
          child: Text("Home"),
        ),
      ),

      body: Center(
        child: Text(
            "You have signed up successfully"
        ),
      ),
    );
  }
}