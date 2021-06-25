import 'dart:async';
import 'dart:io';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
//import 'package:mus_greet/core/utils/arguments.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/check_box_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/login_screen_text_field_widget.dart';
import 'package:mus_greet/core/widgets/password_field_widget.dart';
import 'package:mus_greet/core/widgets/social_media_button_widget.dart';
import 'package:mus_greet/models/Users.dart';
import 'package:mus_greet/pages/login/login_screen.dart';
import 'package:mus_greet/pages/verify_email_screen/verify_email_screen.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _reTypePasswordController = TextEditingController();
  List<Users> users = [];

  @override
  Widget build(BuildContext context) {
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
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            _getLogoAndBack(),
            CustomSpacerWidget(
              height: 10,
            ),
            _getRegistrationText(),
            CustomSpacerWidget(
              height: 15,
            ),
            _getFirstNameField(),
            CustomSpacerWidget(
              height: 15,
            ),
            _getLastNameField(),
            CustomSpacerWidget(
              height: 15,
            ),
            _getTextField(),
            CustomSpacerWidget(
              height: 15,
            ),
            _getPasswordField(),
            CustomSpacerWidget(
              height: 15,
            ),
            _getReEnterPassword(),
            CustomSpacerWidget(
              height: 5,
            ),
            _getPasswordText(),
            CustomSpacerWidget(
              height: 20,
            ),
            _getCheckBoxText(),
            CustomSpacerWidget(height: 20,),
            _getContinueButton(),
            CustomSpacerWidget(
              height: 30,
            ),
            _getSocialMediaText(),
            CustomSpacerWidget(
              height: 30,
            ),
            _getSocialMediaButton(),
            CustomSpacerWidget(
              height: 30,
            ),
            _getRegisterTextAndButton(),
            CustomSpacerWidget(
              height: 30,
            ),
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
          padding: EdgeInsets.only(top: 30),
          width: MediaQuery.of(context).size.width,
          child: AssetImageWidget(
            image: ImageConstants.IC_LOGIN_LOGO,
            height: 100,
            width: 100,
          ),
        ),
        Positioned(top: 40, left: 10, child: _getBackButton()),
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

  _getRegistrationText() {
    return Container(
      height: 34,
      child: Text(
        AppTexts.REGISTRATION_TEXT,
        style: TextStyle(
          fontSize: 23,
          fontFamily: FontConstants.FONT,
          fontWeight: FontWeight.bold,
          color: AppColors.header_black,
        ),
      ),
    );
  }

  _getFirstNameField() {
    return LoginScreenTextField(
      leadingIcon: ImageConstants.IC_PROFILE,
      controller: _firstNameController,
      hintText: AppTexts.FIRST_NAME,
      isPasswordField: false,
    );
  }

  _getLastNameField() {
    return LoginScreenTextField(
      leadingIcon: ImageConstants.IC_PROFILE,
      controller: _lastNameController,
      hintText: AppTexts.LAST_NAME,
      isPasswordField: false,
    );
  }

  _getTextField() {
    return LoginScreenTextField(
      leadingIcon: ImageConstants.IC_LOGIN_EMAIL,
      controller: _emailController,
      suffixIcon: ImageConstants.IC_VERIFIED,
      hintText: AppTexts.EMAIL,
      isPasswordField: false,
    );
  }

  _getPasswordField() {
    return PasswordFieldWidget(
      leadingIcon: ImageConstants.IC_LOCK,
      controller: _passwordController,
      hintText: AppTexts.PASSWORD_TEXT,
      isPasswordField: true,
    );
  }

  _getReEnterPassword() {
    return PasswordFieldWidget(
      leadingIcon: ImageConstants.IC_LOCK,
      controller: _reTypePasswordController,
      hintText: AppTexts.RE_ENTER_PASSWORD,
      isPasswordField: true,
      isSuffix: false,
    );
  }

  _getPasswordText() {
    return Container(
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width,
      child: Text(
        AppTexts.PASSWORD_DIRECTION,
        style: TextStyle(
          fontSize: 10,
          fontFamily: FontConstants.FONT,
          fontWeight: FontWeight.w500,
          color: AppColors.green,
        ),
      ),
    );
  }

  _getCheckBoxText() {
    return Container(
      padding: EdgeInsets.only(left: 2,right: 2),
      child: CheckBoxWidget(
        callBack: (isChecked) {
          ///update check box status
        },
        textWidget: _getTextWidgetForCheckBox(),
      ),
    );
  }

  _getTextWidgetForCheckBox(){
    return Text.rich(
      TextSpan(
        text: "By signing up, you acknowledge you have read the",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontFamily: FontConstants.FONT,
          fontSize: 12,
          color: AppColors.black,
        ),
        children: [
          TextSpan(
            text: " ",
          ),
          TextSpan(
            text: "Privacy policy",
            style: TextStyle(
              fontSize: 12,
              fontFamily: FontConstants.FONT,
              fontWeight: FontWeight.w600,
              color: AppColors.green,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => _privacyPolicy(),
          ),
          TextSpan(
            text: ", ",
            style: TextStyle(
              fontSize: 12,
              fontFamily: FontConstants.FONT,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          TextSpan(
            text: "Cookie policy",
            style: TextStyle(
              fontSize: 12,
              fontFamily: FontConstants.FONT,
              fontWeight: FontWeight.w600,
              color: AppColors.green,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => _privacyPolicy(),
          ),
          TextSpan(
            text: " and agree to the ",
            style: TextStyle(
              fontSize: 12,
              fontFamily: FontConstants.FONT,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          TextSpan(
            text: "Member Agreement",
            style: TextStyle(
              fontSize: 12,
              fontFamily: FontConstants.FONT,
              fontWeight: FontWeight.w600,
              color: AppColors.green,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => _privacyPolicy(),
          ),
        ],
      ),
      softWrap: true,
    );
  }

  _privacyPolicy() {}

  _getSocialMediaText() {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Text(
        AppTexts.SOCIAL_ACCOUNT_TO_LOGIN,
        style: TextStyle(
          fontSize: 14,
          fontFamily: FontConstants.FONT,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
      ),
    );
  }

  _getSocialMediaButton() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SocialMediaButtonWidget(
            callBack: () {
              //google login
            },
            socialMediaIcon: ImageConstants.IC_FACEBOOK,
          ),
          CustomSpacerWidget(
            width: 30,
          ),
          SocialMediaButtonWidget(
            callBack: () {
              //google login
            },
            socialMediaIcon: ImageConstants.IC_GOOGLE,
          ),
        ],
      ),
    );
  }

  _getContinueButton() {
    return LoginAndRegisterScreenButton(
      text: AppTexts.CONTINUE,
      isFilled: true,
      callBack: () {
        // FutureBuilder(
        //     future: _registerUser(),
        //     builder: (context, snapshot) {
        //       return Text("You will not see this");
        //     });
        _registerUser();
        //Navigation.intentWithClearAllRoutes(context, AppRoutes.VERIFYEMAIL);
      },
    );
  }

  _getRegisterTextAndButton() {
    return Text.rich(
      TextSpan(
          text: AppTexts.HAVE_AN_ACCOUNT,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: FontConstants.FONT,
            fontSize: 14,
            color: AppColors.black,
          ),
          children: [
            TextSpan(
              text: " ",
            ),
            TextSpan(
              text: AppTexts.LOGIN_TEXT,
              style: TextStyle(
                fontSize: 14,
                fontFamily: FontConstants.FONT,
                fontWeight: FontWeight.w500,
                color: AppColors.green,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()..onTap = () => _loginUser(),
            ),
          ]),
    );
  }

  _loginUser() {
    ///register user
  }

  Future<void> _registerUser() async {
    try {
      Map<String, String> userAttributes = {
        'email': _emailController.text,
        'phone_number': '+447448479715',
        // additional attributes as needed
      };
      // SignUpResult res = await Amplify.Auth.signUp(
      //     username: _emailController.text,
      //     password: _passwordController.text,
      //     options: CognitoSignUpOptions(
      //         userAttributes: userAttributes
      //     )
      // );

      //if (res.isSignUpComplete) {
      if (true) {
        print('User registration successful');

        //Add user to DB
        insertUser();

        if (users != null) {
          Navigation.intentWithData(context, AppRoutes.VERIFYEMAIL,RegistrationArgumentClass(users[0]));
        }
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

  Future<void> insertUser() async {
    try{
      final item = Users(
        first_name: _firstNameController.text,
        last_name: _lastNameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        // phone: "",
        // age: "25",
        // gender: "male",
        // parent_email: "",
        // house_number: "117111",
        // street: "NewHam",
        // city: "EastHam",
        // postcode: "E126NA",
        // country: "UK",
        // latitude: "60N",
        // longitude: "40W",
        // parent_consent_form_agree: true,
        // terms_privacy_policy_agree: true,
        // community_promise_agree: true,
        // email_verification: true,
        // phone_verification: true,
        // parent_verification: true,
        // address_verification: true,
        // photo_verification: true,
        // joined_date: TemporalDate.fromString("1970-01-01Z"),
        // active_status: true,
        // User_Posts: [],
        // User_Comments: [],
        // User_PostLikes: [],
        // User_MosqueFollowers: [],
        // User_Friends: [],
        // User_Photos: [],
        // User_Educations: [],
        //User_Profiles: []
      );
      await Amplify.DataStore.save(item);
      Timer(Duration(seconds: 2),() => _getUserDetails());

    } on UsernameExistsException catch (e) {
      print('User already exists');
      print(e);
    }
    catch (e) {
      print('Exception occurred while adding user to DB, error: ' + e);
      //print(e);
    }

  }

  Future<void>_getUserDetails() async{
    try {
      print('Before querying user');
      users = await Amplify.DataStore.query(Users.classType, where:Users.EMAIL.eq(_emailController.text));
      await Future.delayed(Duration(seconds: 2));

      if (users != null) {
        print(users);
        Timer(Duration(seconds: 2),() => _navigateToNextScreen());
        //Navigation.intentWithData(context, AppRoutes.VERIFYEMAIL,RegistrationArgumentClass(users[0]));
      }
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }

  void _navigateToNextScreen() {
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => NearlyFinishedPage()));

    Navigation.intentWithData(context, AppRoutes.VERIFYEMAIL,RegistrationArgumentClass(users[0]));
  }
}

class RegistrationArgumentClass {
  final Users sessionUser;
  RegistrationArgumentClass(this.sessionUser);
}