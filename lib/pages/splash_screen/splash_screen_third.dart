import 'package:flutter/material.dart';
import 'package:mus_greet/pages/login/login_screen.dart';
//import 'package:musgreet/constants.dart';
//import 'package:musgreet/size_config.dart';
//import 'package:musgreet/pages/login_screen.dart';

class SplashScreenThird extends StatefulWidget {
  @override
  _SplashScreenThirdState createState() => _SplashScreenThirdState();
}

class _SplashScreenThirdState extends State<SplashScreenThird> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
      children: [
        SizedBox(
          height: 20.0,
        ),
        SafeArea(
          child: Container(
            //color: Colors.amber,
            padding: EdgeInsets.all(20.0),
            child: Image.asset(
              'assets/images/splash03.png',
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          'You can donate to your\n favourite mosque',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been industry.',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
                fontWeight: FontWeight.w100)),
        SizedBox(
          height: 60.0,
        ),
        Image.asset(
          'assets/images/splash-page-3.png',
        ),
        SizedBox(
          height: 40.0,
        ),
        SizedBox(
          width: double.infinity, // <-- match_parent
          child:RaisedButton(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 7),
            child: Text(
              'Get Started',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            color: Colors.green[800],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                )),
            onPressed: () {
              _navigateToNextScreen(context);
            },
          ),
        ),
        SizedBox(
          height: 40.0,
        ),
        /*Text('Skip',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
                fontWeight: FontWeight.w100)),*/
      ],
              ),
    )));
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
