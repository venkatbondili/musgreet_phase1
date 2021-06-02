import 'package:flutter/material.dart';
import 'package:mus_greet/pages/home/home.dart';
import 'package:mus_greet/pages/otp/email_otp_screen.dart';
//import 'package:musgreet/pages/otp/email_otp_screen.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

final ctrlFistName = TextEditingController();
final ctrlLastName = TextEditingController();
final ctrlEmail = TextEditingController();
final ctrlPwd = TextEditingController();

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
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

Future<void> register(BuildContext context) async {
  try {
    Map<String, String> userAttributes = {

      'email': ctrlEmail.text,
      'phone_number': '+447448479715',
      // additional attributes as needed
    };
    SignUpResult res = await Amplify.Auth.signUp(
        username: ctrlEmail.text,
        password: ctrlPwd.text,
        options: CognitoSignUpOptions(
            userAttributes: userAttributes
        )
    );

    if (res.isSignUpComplete) {
      print('User registration successful');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => OtpScreen()));
    }
    else {
      print('User registration failed');
    }
    // setState(() {
    //   //isSignUpComplete = res.isSignUpComplete;
    // }
    //);
  } on AuthException catch (e) {
    print(e.message);
  }

}

void _navigateToNextScreen(BuildContext context) {
  Navigator.of(context)
     .push(MaterialPageRoute(builder: (context) => OtpScreen()));
      //Home()

}

bool checked = true;

Widget _buildContent(context) {
  return Center(
      child: Column(
    //crossAxisAlignment: CrossAxisAlignment.stretch,
    //mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SafeArea(
        child: Container(
          //color: Colors.amber,
          padding: EdgeInsets.all(10.0),
          child: Image.asset(
            'assets/images/logo.png',
            width: 100,
            height: 100,
          ),
        ),
      ),
      SizedBox(
        height: 2.0,
      ),
      Text(
        'Registration',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7),
        child: TextFormField(
          controller: ctrlFistName,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            //border: Border.all(1.0),
            prefixIcon: Icon(
              Icons.person,
              color: Colors.green[800],
            ),
            labelText: 'First Name',
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7),
        child: TextFormField(
          controller: ctrlLastName,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            //border: Border.all(1.0),
            prefixIcon: Icon(
              Icons.person,
              color: Colors.green[800],
            ),
            labelText: 'Last Name',
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7),
        child: TextFormField(
          controller: ctrlEmail,
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
          controller: ctrlPwd,
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
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7),
        child: TextFormField(
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            //border: Border.all(1.0),
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.green[800],
            ),
            labelText: 'Confirm Password',
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Checkbox(
                checkColor: Colors.white,
                activeColor: Colors.green[800],
                value: checked,
                onChanged: (bool value) {
                  checked = value;
                },
              ),
            ),
            Expanded(
              flex: 9,
              child: Align(
                child: RichText(
                  text: TextSpan(
                    text: "By Signing up, you acknowledge you have read the ",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: "Privacy policy, Cookie policy ",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.green[800],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: "and agree to the\n",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: "Member Agreement",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.green[800],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        //padding: EdgeInsets.all(20.0),
        child: SizedBox(
          width: 350, // <-- match_parent
          child:RaisedButton(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 7),
            child: Text(
              'Continue',
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
              register(context);
              //_navigateToNextScreen(context);
            },
          ),
        ),
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
                onPressed: () {},
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
