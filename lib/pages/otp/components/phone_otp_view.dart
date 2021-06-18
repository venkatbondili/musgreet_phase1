
import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/size_config.dart';
import 'package:mus_greet/models/Users.dart';
import 'package:mus_greet/pages/age/age_registration_page.dart';
import 'package:mus_greet/pages/final/nearly_finished_page.dart';
import 'package:mus_greet/pages/login/login_page.dart';
import '../../../main.dart';
import 'otp_form.dart';

import 'package:amplify_flutter/amplify.dart';
//import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

class PhoneOtpView extends StatelessWidget {

List<Users> users;

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AgeRegistrationPage()));
  }

  @override
  Widget build(BuildContext context) {
    userDetailsData();
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
                'Please enter the 6 digit code' ,
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
                      verifyPhoneNumber(context);
                      //_navigateToNextScreen(context);
                      //verify(context);
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

  _showDialog(BuildContext context)
  {
    print("inside the show Dialog");
    return showDialog(
      context :context,
      builder:(context) =>AlertDialog
        (
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
          mainAxisSize: MainAxisSize.min,
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
              height: 5.0,
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
    );
  }

  _showDialogFailed(BuildContext context)
  {
    print("inside the show Dialog");
    return showDialog(
      context :context,
      builder:(context) =>AlertDialog
        (
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
          mainAxisSize: MainAxisSize.min,
          // wrap content in flutter
          children: <Widget>[
            Text(
              '  Your Email Verfication has Failed.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 5.0,
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
    );
  }

  void verifyPhoneNumber(BuildContext context) {

    print("inside the verify button");
   // print('In verify function : ${_codeController.text}');
    //print(_codeController.text);
    try {
      //  SignUpResult res = await Amplify.Auth.confirmSignUp(
      //  username: email,
      //confirmationCode: _codeController.text,
      //);

      if (true) {
        print('Email code verification successful');
        updatePhoneUser();
        //Navigator.of(context)
        //  .push(MaterialPageRoute(builder: (context) => OtpSuccessScreen()));
        // builder:(BuildContext context) =>_buildContent(context);
        _showDialog(context);
      }
      else
      {
        _showDialogFailed(context);
      }
      // setState(() {
      //   //isSignUpComplete = res.isSignUpComplete;
      // }
      //);
    } catch (e) {
      print(e.message);
    }
  }

  void updatePhoneUser()  async{
    final updatedItem = users[0].copyWith(
        phone_verification: true);
    await Amplify.DataStore.save(updatedItem);
  }

  Future<void> userDetailsData() async
  {
    print("getting the data from the users");
    try {
      users = await Amplify.DataStore.query(Users.classType , where:Users.ID.eq("315eca04-ab0d-46f7-b063-d8707d607a18"));
      print(users);
    }
    catch(e)
    {

    }
  }
}
