import 'package:flutter/material.dart';
import 'package:mus_greet/pages/home/home.dart';
import 'package:mus_greet/pages/registration/registration_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    /*var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    double fontSize(double size) {
      return size * width / 414;
    }*/
    //print(height);
    return Scaffold(
      body: _buildContent(context),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
    );
  }
}
var login = 0;
void _navigateToNextScreen(BuildContext context) {
  if (login == 1){
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Home()));
  }
  else{
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => RegistrationPage()));
  }
}

Widget _buildContent(BuildContext context) {
  return Center(
      child: Column(
    //crossAxisAlignment: CrossAxisAlignment.stretch,
    //mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SafeArea(
        child: Container(
          //color: Colors.amber,
          padding: EdgeInsets.all(25.0),
          child: Image.asset(
              'assets/images/logo.png',
            width: 100,
            height: 100,),
        ),
      ),
      SizedBox(
        height: 40.0,
      ),
      Text(
        'Login',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 8.0,
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            //border: Border.all(1.0),
            prefixIcon: Icon(
              Icons.email,
              color: Colors.green[800],
            ),
            labelText: 'E-mail',
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7),
        child: TextFormField(
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            //border: Border.all(1.0),
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.green[800],
            ),
            labelText: 'Password',
          ),
        ),
      ),
      Container(
        child: Align(
          alignment: Alignment.centerRight,
          child: FlatButton(
            onPressed: () {},
            child: Text(
              "Forgot Password?",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
      Container(
        padding: EdgeInsets.all(20.0),
        child: SizedBox(
          width: double.infinity, // <-- match_parent
          child:RaisedButton(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 7),
            child: Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            color: Colors.green[800],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                )),
            onPressed: () {
              login =1;
              _navigateToNextScreen(context);
            },
          ),
        ),
      ),
      SizedBox(
        height: 40.0,
      ),
      Expanded(
        child: Container(
          //color: Colors.amber,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Use social account to Login',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
      /*SizedBox(
        height: 8.0,
      ),*/
      Expanded(
        child: Container(
          //color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  //margin: EdgeInsets.only(left: width / 10),
                  child: Image.asset('assets/images/facebook.png')),
              Container(
                width: 25,
              ),
              Container(
                  //margin: EdgeInsets.only(right: width / 10),
                  child: Image.asset('assets/images/google.png'))
            ],
          ),
        ),
      ),
      /*SizedBox(
        height: 8.0,
      ),*/
      Expanded(
        child: Container(
          //color: Colors.amber,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //margin: EdgeInsets.only(left: width / 30),
              Text(
                "Don't have an account?",
                style: TextStyle(
                  //fontWeight: FontWeight.bold, fontSize: fontSize(20)),
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),

              //margin: EdgeInsets.only(right: width / 30),
              FlatButton(
                onPressed: () {
                  login = 0;
                  _navigateToNextScreen(context);
                },
                child: Text(
                  "Register",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green[800]),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ));
}
