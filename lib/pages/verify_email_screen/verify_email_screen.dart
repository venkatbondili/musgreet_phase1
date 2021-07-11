//import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'dart:async';
import 'dart:convert';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_session/flutter_session.dart';
import 'package:mus_greet/core/config/navigation.dart';
//import 'package:mus_greet/core/utils/arguments.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/otp_field_widget.dart';
import 'package:mus_greet/models/Users.dart';
import 'package:mus_greet/pages/login/login_screen.dart';
import 'package:mus_greet/pages/otp/otp_success_screen.dart';
import 'package:mus_greet/pages/otp/phone_verification_screen.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:mus_greet/pages/registration/registration_screen.dart';

class VerifyEmailScreen extends StatefulWidget {
  String email='';

  VerifyEmailScreen({this.email});

  @override
  _VerifyEmailScreenState createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final TextEditingController _codeController = TextEditingController();
  RegistrationArgumentClass args;
  String email;
  List<Users> users;
  Users sessionUser;

  @override build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
    args = ModalRoute.of(context).settings.arguments as RegistrationArgumentClass;
    sessionUser = args.sessionUser;
    email = sessionUser.email;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: _getBody(),
      ),
    );
  }

  _getBody() {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _getLogoAndBack(),
            _getVerifyEmailAndLogoText(),
            _getOTPTextField(),
            _getResendButton(),
            _getVerifyButton(),
          ],
        ),
      ),
    );
  }

  _getLogoAndBack() {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          child: AssetImageWidget(
            image: ImageConstants.IC_LOGIN_LOGO,
            height: 110,
            width: 100,
          ),
        ),
        Positioned(top: 10, left: 5, child: _getBackButton()),
      ],
    );
  }

  _getBackButton() {
    return GestureDetector(
      onTap: () {
        ///Handle back here
      },
      child: AssetImageWidget(
        image: ImageConstants.IC_BACK,
        height: 18,
        width: 18,
      ),
    );
  }

  _getVerifyEmailAndLogoText() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _getEmailLogo(),
        _getVerifyEmailText(),
        CustomSpacerWidget(
          height: 10,
        ),
        _getEnterCodeHint(),
      ],
    );
  }

  _getEmailLogo() {
    return AssetImageWidget(
      image: ImageConstants.IC_VERIFY_EMAIL,
      height: 150,
      width: 150,
    );
  }

  _getVerifyEmailText() {
    return Text(
      AppTexts.VERIFY_EMAIL_TEXT,
      style: TextStyle(
        fontSize: 18,
        fontFamily: FontConstants.FONT,
        fontWeight: FontWeight.bold,
        color: AppColors.header_black,
      ),
    );
  }

  _getEnterCodeHint() {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: Text(
        "${AppTexts.ENTER_CODE_HINT}\n ${_getEncryptedEmail(email)}",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontConstants.FONT,
          fontSize: 16,
          fontWeight: FontWeight.w900,
          color: AppColors.black,
        ),
      ),
    );
  }

  _getOTPTextField() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _getOTPField(),
        //_getCodeExpiredText(),
      ],
    );
  }

  _getCodeExpiredText() {
    return Text(
      AppTexts.CODE_EXPIRED_TEXT,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontFamily: FontConstants.FONT,
          fontWeight: FontWeight.w900,
          fontSize: 14,
          color: AppColors.red_shade),
    );
  }

  _getOTPField() {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: OTPFieldWidget(
        callBack: () {},
        controller: _codeController,
      ),
    );
  }

  _getResendButton() {
    return GestureDetector(
      onTap: () {
        ///Handle Resend OTP button pressed
      },
      child: Container(
        padding: EdgeInsets.all(5),
        child: Text(
          AppTexts.RESEND_CODE_TEXT,
          style: TextStyle(
              fontFamily: FontConstants.FONT,
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: AppColors.black),
        ),
      ),
    );
  }

  _getVerifyButton() {
    return LoginAndRegisterScreenButton(
      text: AppTexts.VERIFY_TEXT,
      isFilled: true,
      callBack: () {
        print("clicking on verify button");
        verify();
      },
    );
  }

  _getEncryptedEmail(String email) {
    var encryptedEmail = "";
    int index = email.indexOf("@");
    for (int i = 0; i < email.length; i++) {
      if (i >= 2 && i < index) {
        encryptedEmail += "*";
      } else {
        encryptedEmail += email[i];
      }
    }
    return encryptedEmail;
  }

  Future<void> verify() async {
    print("inside the verify button");
    print('In verify function : ${_codeController.text}');
    print(_codeController.text);
    try {
     SignUpResult res = await Amplify.Auth.confirmSignUp(
       username: email,
       confirmationCode: _codeController.text,
      );

     if (res.isSignUpComplete) {
       //String emailCode = '123456';

       //if (_codeController.text == emailCode) {
         print('Email code verification successful');
         updateEmailUser();
         //Navigator.of(context)
         //  .push(MaterialPageRoute(builder: (context) => OtpSuccessScreen()));
         // builder:(BuildContext context) =>_buildContent(context);
         _showDialog();
       //}
     }
    else {
    _showDialogFailed();
    }
      // setState(() {
      //   //isSignUpComplete = res.isSignUpComplete;
      // }
      //);
    } catch (e) {
      print(e.message);
    }
  }

  updateEmailUser() async {
    try {
      if (sessionUser != null) {
        final updatedItem = sessionUser.copyWith(
            email_verification: true);
        await Amplify.DataStore.save(updatedItem);
        sessionUser = updatedItem;

        // users = await Amplify.DataStore.query(Users.classType, where:Users.ID.eq(sessionUser.id));
        // await Future.delayed(Duration(seconds: 2));
        // //Timer(Duration(seconds: 2),() => _getUserDetails());
        // if (users != null) {
        //   sessionUser = users[0];
        // }
      }
    }
    catch(e) {
      print(e.message);
    }
  }

   _showDialog() {
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
              'You have successfully verified your email',
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
                    Timer(Duration(seconds: 2),() => _navigateToNextScreen(context));
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

  _showDialogFailed() {
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
              'Your email verification has failed.',
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
                    'Resend code',
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
                    Navigator.pop(context);
                    //_navigateToNextScreen(context);
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

  void _navigateToNextScreen(BuildContext context) {
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => PhoneVerificationScreen()));
    Navigation.intentWithData(context, AppRoutes.PHONEINPUT,VerifyEmailArgumentClass(sessionUser));
  }
}

class VerifyEmailArgumentClass {
  final Users sessionUser;
  VerifyEmailArgumentClass(this.sessionUser);
}