//import 'package:amplify_api/amplify_api.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/models/UserProfile.dart';
import 'package:mus_greet/models/Users.dart';
//import 'package:mus_greet/pages/home_screen/home_screen.dart';
//import 'package:mus_greet/pages/splash_screen/splash_screen_second.dart';
import 'dart:async';
import 'package:mus_greet/pages/splash_screen/splash_screen_second.dart';
import 'package:amplify_flutter/amplify.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => SplashScreenFirst())));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.0,
              ),
              Image.asset(
                'assets/images/splash.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SplashScreenFirst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('In splash screen');
    return SafeArea(
        child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child:Column(
      children: [
          SizedBox(
            height: 20.0,
          ),
          SafeArea(
            child: Container(
              //color: Colors.amber,
              padding: EdgeInsets.all(20.0),
              child: Image.asset(
                'assets/images/splash01.png',
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Welcome to mus greet\n unity in the community',
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
            'assets/images/splash-page-1.png',
          ),
          SizedBox(
            height: 40.0,
          ),
          SizedBox(
              width: double.infinity, // <-- match_parent
              child: RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 7),
                child: Text(
                  'Next',
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
          Text('Skip',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.w100)),
      ],
                ),
    )),
        )));
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SplashScreenSecond()));
  }
}
