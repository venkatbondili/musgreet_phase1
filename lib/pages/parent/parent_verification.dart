import 'package:flutter/material.dart';
import 'package:mus_greet/pages/otp/parent_verification_code_screen.dart';

class ParentVerificationPage extends StatefulWidget {
  @override
  _ParentVerificationPageState createState() => _ParentVerificationPageState();
}

class _ParentVerificationPageState extends State<ParentVerificationPage> {
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

void _navigateToNextScreen(BuildContext context) {
  Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ParentVerificationCodeScreen()));
}

bool checked = true;

Widget _buildContent(BuildContext context) {
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
          height: 40.0,
        ),
        Container(
          child: Text(
            'Parent Verification',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          child: Text(
            'A parent or guardian must help manage your\n mus greet account until you turn 16',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey),
          ),
        ),
        SizedBox(
          height: 40.0,
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 27, vertical: 7),
            child: Text(
              'Enter your parent/guardian email address',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
          ),
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
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7),
          child: Text(
            'Please make sure your parents have access to their '
                'email before clicking next',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
        //SizedBox(height: SizeConfig.screenHeight * 0.07),
        SizedBox(height: 150),
        Container(
          padding: EdgeInsets.all(20.0),
          child: SizedBox(
              width: double.infinity, // <-- match_parent
              child: RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 7),
                child: Text(
                  'Send me a code',
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
        ),
      ],
    ),
  );
}
