import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/otp_field_widget.dart';
import 'package:mus_greet/pages/login/login_screen.dart';

class VerifyEmailScreen extends StatefulWidget {
  String email='';

  VerifyEmailScreen({this.email});

  @override
  _VerifyEmailScreenState createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final TextEditingController _codeController = TextEditingController();
  ArgumentClass args;
  String email;

  @override
  Widget build(BuildContext context) {

    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
    args = ModalRoute.of(context).settings.arguments as ArgumentClass;
    email = args.email;

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
      padding: EdgeInsets.only(left: 40, right: 40),
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
    print('In verify function : ${_codeController.text}');
    print(_codeController.text);
    try {
      SignUpResult res = await Amplify.Auth.confirmSignUp(
        username: email,
        confirmationCode: _codeController.text,
      );

      if (res.isSignUpComplete) {
        print('Email code verification successful');
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => OtpSuccessScreen()));
      }
      else {
        print('Email code verification failed');
      }
      // setState(() {
      //   //isSignUpComplete = res.isSignUpComplete;
      // }
      //);
    } on AuthException catch (e) {
      print(e.message);
    }

  }
}

class ArgumentClass {
  final String email;
  ArgumentClass(this.email);
}
