import 'package:flutter/material.dart';
import 'package:mus_greet/pages/otp/phone_verification_screen.dart';

class OtpSuccessScreen extends StatefulWidget {
  @override
  _OtpSuccessScreenState createState() => _OtpSuccessScreenState();
}

class _OtpSuccessScreenState extends State<OtpSuccessScreen> {
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
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => PhoneVerificationScreen()));
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
          padding: EdgeInsets.all(20.0),
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
      AlertDialog(
        title: MaterialButton(
          onPressed: () {},
          color: Colors.green[800],
          textColor: Colors.white,
          child: Image.asset(
            'assets/images/mail.png',
            //width: 100,
            //height: 100,
          ),
          /*child: Icon(
            Icons.email,
            size: 40,
          ),*/
          padding: EdgeInsets.all(16),
          shape: CircleBorder(),
        ),
        content: Column(
          // wrap content in flutter
          children: <Widget>[
            Text(
              '  You have successfully verified your email',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            FlatButton(
              onPressed: () {
                //Navigator.of(ctx).pop();
              },
              child: SizedBox(
                      width: double.infinity, // <-- match_parent
                      child:  RaisedButton(
    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 7),
    child: Text(
      'Continue',
      textAlign: TextAlign.center,
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
        actions: <Widget>[],
      ),
    ],
  ));
}
