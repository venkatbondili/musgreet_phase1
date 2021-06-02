import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/size_config.dart';
import 'package:mus_greet/pages/age/age_registration_page.dart';
import 'package:mus_greet/pages/login/login_page.dart';
import 'otp_form.dart';

import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

class PhoneOtpView extends StatelessWidget {

  Future<void> verify(BuildContext context) async {
    try {
      SignUpResult res = await Amplify.Auth.confirmSignUp(
          username: 'ithubda@gmail.com',
          confirmationCode: '777777',
        //confirmationCode: ctrlPin1.text + ctrlPin2.text + ctrlPin3.text + ctrlPin4.text + ctrlPin5.text + ctrlPin6.text,
      );

      if (res.isSignUpComplete) {
        print('Phone code verification successful');
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LoginPage()));
      }
      else {
        print('Email code verification failed');
      }
      // setState(() {
      //   //isSignUpComplete = res.isSignUpComplete;
      // }
      //);
    } on AuthException catch (e) {
      print('error in phone verification');
      print(e.message);
    }

  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AgeRegistrationPage()));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              SafeArea(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.07),
              MaterialButton(
                onPressed: () {},
                color: Colors.green[800],
                textColor: Colors.white,
                child: Icon(
                  Icons.mobile_friendly,
                  size: 40,
                ),
                padding: EdgeInsets.all(16),
                shape: CircleBorder(),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                'Confirm',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Text(
                'Please enter the 6 digit code',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              OtpForm(),
              buildTimer(),
              SizedBox(height: SizeConfig.screenHeight * 0.07),
              GestureDetector(
                onTap: () {
                  // OTP code resend
                },
                child: Text(
                  "Resend code",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.07),
              Container(
                padding: EdgeInsets.all(20.0),
                child:SizedBox(
                  width: double.infinity, // <-- match_parent
                  child:  RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 7),
                    child: Text(
                      'Verify and Continue',
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
                      //_navigateToNextScreen(context);
                      verify(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.07),
        Text("This code will expire in 10 minutes",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey),),
        /*TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(seconds: 600),
          builder: (_, value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: kPrimaryColor),
          ),
        ),*/
      ],
    );
  }
}
