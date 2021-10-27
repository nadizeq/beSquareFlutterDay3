import 'package:flutter/material.dart';
import 'homePage.dart';

void main() {
  runApp(MyApp());
}

//Main page in planning
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MainPageApp(),
    );
  }
}

class MainPageApp extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPageApp> {

  String optionSelected="Male";
  List genderList = [
    "Male","Female","Other","Rather not to say",
  ];

  @override
  Widget build(BuildContext context) {

    Padding padTop = Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0));

    AppBar header = new AppBar(
      title: Center(
        child: Text("Sign Up Screen",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    Text topText = new Text(
      'Welcome Nadiah',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );

    Container containImage = new Container(
      width: 200.0,
      height: 200.0,
      alignment: Alignment.center,
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: AssetImage('pictures/littlePuff.jpeg'),
          fit: BoxFit.fill,

        ),
      ),
    );

    TextField inputName = new TextField(
      decoration: InputDecoration(
        hintText: 'Enter Name',
        border: OutlineInputBorder(),
        icon: Icon(Icons.send_sharp),
      ),
    );

    TextField inputEmail = new TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Enter Email Address',
        border: OutlineInputBorder(),
        icon: Icon(Icons.email),
      ),
    );

    TextField inputPassword = new TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Enter Password',
        border: OutlineInputBorder(),
        icon: Icon(Icons.password),
      ),
    );

    DropdownButton selectGender = new DropdownButton(
      hint: Text("Select your gender"),
      icon: Icon(
        Icons.arrow_drop_down_circle,
        color: Colors.green,),
      iconSize: 30,
      isExpanded: true,
      style: TextStyle(color: Colors.black, fontSize: 18),
      value: optionSelected,
      onChanged: (newValue){
        setState(() {
          optionSelected = newValue;
        });
      },
      items: genderList.map((genderItem) {
        return DropdownMenuItem(
          value: genderItem,
          child: Text(genderItem),
        );
      }).toList(),
    );

    Column buttonHome = new Column(
      children: [
        new Row(
          children: [
            new Expanded(child: OutlinedButton(
              child: new Text(
                "Main Page",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: (){
                //Navigator.of(context).push(_goToHomePage());
                final snackBar = SnackBar(
                  content: const Text('You have signed up successfully!'),
                  action: SnackBarAction(
                    label: 'OK', onPressed: () {
                    Navigator.of(context).push(_goToHomePage());
                  },
                  ),
                );

                // Find the ScaffoldMessenger in the widget tree
                // and use it to show a SnackBar.
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.all(10),
                  side: BorderSide(
                    width: 1.0,
                    color: Colors.black,
                    style: BorderStyle.solid,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),
            ),
            ),
          ],
        )
      ],
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: header,
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            topText,
            containImage,
            padTop,
            inputName,
            inputEmail,
            inputPassword,
            padTop,
            selectGender,
            padTop,
            buttonHome,
          ],
        ),
      ),

    );
  }
}

Route _goToHomePage(){
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageApp(),
    );
  }
}

