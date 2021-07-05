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
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

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
  bool _isObscure = true;
  final _firstnameKey = GlobalKey<FormState>();
  final _lastnameKey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  final _retypepasswordKey = GlobalKey<FormState>();
  String firstnameValidator;
  String lastnameValidator;
  String emailValidator;
  String passwordValidator;
  String retypepasswordValidator;

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
            Container(
              child: Form(
                key: _firstnameKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    _getFirstNameField(),
                  ],
                ),
              ),
            ),
            Container(
              child: Form(
                key: _lastnameKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    _getLastNameField(),
                  ],
                ),
              ),
            ),
            Container(
              child: Form(
                key: _emailKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    _getEmailField(),
                  ],
                ),
              ),
            ),
            Container(
              child: Form(
                key: _passwordKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    _getPasswordField(),
                  ],
                ),
              ),
            ),
            Container(
              child: Form(
                key: _retypepasswordKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    _getReEnterPassword(),
                  ],
                ),
              ),
            ),
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
    // return LoginScreenTextField(
    //   leadingIcon: ImageConstants.IC_PROFILE,
    //   controller: _firstNameController,
    //   hintText: AppTexts.FIRST_NAME,
    //   isPasswordField: false,
    // );

    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            child: TextFormField(
              controller: _firstNameController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                return firstnameValidator;
              },
              // validator: MultiValidator(
              //     [
              //       RequiredValidator(errorText: 'Email field is required'),
              //       EmailValidator(errorText: 'Please enter valid email'),
              //       loginValidator(
              //           errorText: "Email doesn't exist, please check",
              //           email: _emailController.text,
              //           pwd: _passwordController.text,
              //           fldEmail: true
              //       ),
              //     ]
              // ),
              decoration: InputDecoration(
                  border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(12.0),
                      ),
                      borderSide:
                      BorderSide(color: AppColors.green_light, width: 2.0)),

                  //contentPadding: EdgeInsetsDirectional.only(bottom: 7),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),

                  prefixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 10, end: 20, top: 0, bottom: 3),
                    child: AssetImageWidget(
                      image: ImageConstants.IC_PROFILE,
                      height: 25,
                      width: 25,
                    ),
                  ),

                  hintText: 'First Name',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: AppColors.light_grey,
                  )
              ),
            ),
          ),
        ],
      ),

    );
  }

  _getLastNameField() {
    // return LoginScreenTextField(
    //   leadingIcon: ImageConstants.IC_PROFILE,
    //   controller: _lastNameController,
    //   hintText: AppTexts.LAST_NAME,
    //   isPasswordField: false,
    // );

    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            child: TextFormField(
              controller: _lastNameController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                return lastnameValidator;
              },
              // validator: MultiValidator(
              //     [
              //       RequiredValidator(errorText: 'Email field is required'),
              //       EmailValidator(errorText: 'Please enter valid email'),
              //       loginValidator(
              //           errorText: "Email doesn't exist, please check",
              //           email: _emailController.text,
              //           pwd: _passwordController.text,
              //           fldEmail: true
              //       ),
              //     ]
              // ),
              decoration: InputDecoration(
                  border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(12.0),
                      ),
                      borderSide:
                      BorderSide(color: AppColors.green_light, width: 2.0)),

                  //contentPadding: EdgeInsetsDirectional.only(bottom: 7),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),

                  prefixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 10, end: 20, top: 0, bottom: 3),
                    child: AssetImageWidget(
                      image: ImageConstants.IC_PROFILE,
                      height: 25,
                      width: 25,
                    ),
                  ),

                  hintText: 'Last Name',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: AppColors.light_grey,
                  )
              ),
            ),
          ),
        ],
      ),

    );
  }

  _getEmailField() {
    // return LoginScreenTextField(
    //   leadingIcon: ImageConstants.IC_LOGIN_EMAIL,
    //   controller: _emailController,
    //   suffixIcon: ImageConstants.IC_VERIFIED,
    //   hintText: AppTexts.EMAIL,
    //   isPasswordField: false,
    // );

    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            child: TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                return emailValidator;
              },
              // validator: MultiValidator(
              //     [
              //       RequiredValidator(errorText: 'Email field is required'),
              //       EmailValidator(errorText: 'Please enter valid email'),
              //       loginValidator(
              //           errorText: "Email doesn't exist, please check",
              //           email: _emailController.text,
              //           pwd: _passwordController.text,
              //           fldEmail: true
              //       ),
              //     ]
              // ),
              decoration: InputDecoration(
                  border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(12.0),
                      ),
                      borderSide:
                      BorderSide(color: AppColors.green_light, width: 2.0)),

                  //contentPadding: EdgeInsetsDirectional.only(bottom: 7),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),

                  prefixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 10, end: 20, top: 0, bottom: 3),
                    child: AssetImageWidget(
                      image: ImageConstants.IC_LOGIN_EMAIL,
                      height: 25,
                      width: 25,
                    ),
                  ),

                  hintText: 'Email',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: AppColors.light_grey,
                  )
              ),
            ),
          ),
        ],
      ),

    );
  }

  _getPasswordField() {
    // return PasswordFieldWidget(
    //   leadingIcon: ImageConstants.IC_LOCK,
    //   controller: _passwordController,
    //   hintText: AppTexts.PASSWORD_TEXT,
    //   isPasswordField: true,
    // );

    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            child: TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.emailAddress,
              obscureText: _isObscure,
              validator: (value) {
                return passwordValidator;
              },

              // validator: loginValidator(
              //     errorText: "Invalid credentials, please try again",
              //     email: _emailController.text,
              //     pwd: _passwordController.text,
              //     fldEmail: false
              // ),
              // validator: loginValidator(
              //   errorText: "Email doesn't exist, please check",
              //   email: _emailController.text
              // ),
              // validator: MultiValidator(
              //     [
              //       RequiredValidator(errorText: 'Password field is required'),
              //       //PasswordV(errorText: 'Please enter valid password')
              //     ]
              // ),
              decoration: InputDecoration(
                  border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(12.0),
                      ),
                      borderSide:
                      BorderSide(color: AppColors.green_light, width: 2.0)),

                  //contentPadding: EdgeInsetsDirectional.only(bottom: 7),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),

                  prefixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 10, end: 20, top: 0, bottom: 3),
                    child: AssetImageWidget(
                      image: ImageConstants.IC_LOCK,
                      height: 20,
                      width: 20,
                    ),
                  ),

                  suffixIcon: true
                      ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    child: Padding(
                      padding:
                      EdgeInsetsDirectional.only(start: 6, end: 20, top: 5),
                      child: AssetImageWidget(
                        image: _isObscure
                            ? ImageConstants.IC_INVISIBLE
                            : ImageConstants.IC_VISIBLE,
                        height: 10,
                        width: 10,
                      ),
                    ),
                  )
                      : Container(
                    height: 10,
                    width: 10,
                  ),

                  hintText: 'Password',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: AppColors.light_grey,
                  )
              ),
            ),
          ),
          new SizedBox(
            height: 5,
          ),
          new FlutterPwValidator(
            controller: _passwordController,
            minLength: 8,
            uppercaseCharCount: 1,
            numericCharCount: 1,
            specialCharCount: 1,
            width: 400,
            height: 140,
            onSuccess: () {
              print("Matched");
              // Scaffold.of(context).showSnackBar(new SnackBar(
              //     content: new Text("Password is matched")));
            },
          ),
        ],
      ),

    );
  }

  _getReEnterPassword() {
    // return PasswordFieldWidget(
    //   leadingIcon: ImageConstants.IC_LOCK,
    //   controller: _reTypePasswordController,
    //   hintText: AppTexts.RE_ENTER_PASSWORD,
    //   isPasswordField: true,
    //   isSuffix: false,
    // );

    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            child: TextFormField(
              controller: _reTypePasswordController,
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              validator: (value) {
                return retypepasswordValidator;
              },
              // validator: loginValidator(
              //     errorText: "Invalid credentials, please try again",
              //     email: _emailController.text,
              //     pwd: _passwordController.text,
              //     fldEmail: false
              // ),
              // validator: loginValidator(
              //   errorText: "Email doesn't exist, please check",
              //   email: _emailController.text
              // ),
              // validator: MultiValidator(
              //     [
              //       RequiredValidator(errorText: 'Password field is required'),
              //       //PasswordV(errorText: 'Please enter valid password')
              //     ]
              // ),
              decoration: InputDecoration(
                  border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(12.0),
                      ),
                      borderSide:
                      BorderSide(color: AppColors.green_light, width: 2.0)),

                  //contentPadding: EdgeInsetsDirectional.only(bottom: 7),
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),

                  prefixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 10, end: 20, top: 0, bottom: 3),
                    child: AssetImageWidget(
                      image: ImageConstants.IC_LOCK,
                      height: 20,
                      width: 20,
                    ),
                  ),

                  hintText: 'Re-Type Password',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: AppColors.light_grey,
                  )
              ),
            ),
          ),
        ],
      ),

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
    print('inside registeruser');
    String firstnameErrorMessage = '';
    String lastnameErrorMessage = '';
    String emailErrorMessage = '';
    String passwordErrorMessage = '';
    String retypepasswordErrorMessage = '';


    try {
      print(_emailController.text);
      print(_passwordController.text);

      users = null;

      _firstnameKey.currentState.reset();
      _lastnameKey.currentState.reset();
      _emailKey.currentState.reset();
      _passwordKey.currentState.reset();
      _retypepasswordKey.currentState.reset();

      if (_firstNameController.text.trim().length == 0) {
        print('firstname empty case');
        firstnameErrorMessage = "First name field is required";

      } else if (_lastNameController.text.trim().length == 0) {
        print('lastname empty case');
        lastnameErrorMessage = "Last name field is required";

      } else if (_emailController.text.trim().length == 0) {
        print('email empty case');
        emailErrorMessage = "Email field is required";

      // } else if (_passwordController.text.trim().length == 0) {
      //   print('password empty case');
      //   passwordErrorMessage = "Password field is required";

      } else { //other checks
        //bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_emailController.text.trim());
        bool emailValid = RegExp(
            r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(
            _emailController.text.trim());
        print('email check case');
        print(emailValid);
        if (!emailValid) {
          //invalid email case
          emailErrorMessage = "Please provide valid email";

        } else if (_passwordController.text.trim().length == 0) {
            print('password empty case');
            passwordErrorMessage = "Password field is required";

        } else if (_passwordController.text.trim() !=
            _reTypePasswordController.text.trim()) {
          //password and retype password do not match case
          retypepasswordErrorMessage = "Password and re-type password do not match";

        } else {
          //email already exist
          //valid password

          users = await Amplify.DataStore.query(
              Users.classType,
              where: Users.EMAIL.eq(_emailController.text.trim()));
          await Future.delayed(Duration(seconds: 1));

          print('after querying db');

          print(users);

          if (users != null) {
            if (users.length > 0) {
              //user already exists case
              emailErrorMessage = "Email already exists";
            } else {
              //all validations succeeded
              print('length zero case');

              //signing up user in Cognito
              Map<String, String> userAttributes = {
                'email': _emailController.text.trim(),
                'phone_number': '+447448479715',
                // additional attributes as needed
              };

              SignUpResult res = await Amplify.Auth.signUp(
                  username: _emailController.text.trim(),
                  password: _passwordController.text.trim(),
                  options: CognitoSignUpOptions(
                      userAttributes: userAttributes
                  )
              );

              if (res.isSignUpComplete) {
                print('User registration successful');
                //Add user to DB
                insertUser();

                if (users != null) {
                  Navigation.intentWithData(context, AppRoutes.VERIFYEMAIL,RegistrationArgumentClass(users[0]));
                  return;
                }
              }
            }
          } else {
            //all validations succeeded
            print('null case');
            //Add user to DB
            insertUser();

            if (users != null) {
              Navigation.intentWithData(context, AppRoutes.VERIFYEMAIL,RegistrationArgumentClass(users[0]));
              return;
            }
          }
        }
      }
      print('before checking email error msg length');


      if (firstnameErrorMessage.length > 0) {
        setState(() {
          firstnameValidator = firstnameErrorMessage;
        });

        if (_firstnameKey.currentState.validate()) {}
      }
      if (lastnameErrorMessage.length > 0) {
        setState(() {
          lastnameValidator = lastnameErrorMessage;
        });

        if (_lastnameKey.currentState.validate()) {}
      }
      if (emailErrorMessage.length > 0) {
        setState(() {
          emailValidator = emailErrorMessage;
        });

        if (_emailKey.currentState.validate()) {}
      }
      if (passwordErrorMessage.length > 0) {
        print(_passwordController.text.trim().length);
        setState(() {
          print(passwordErrorMessage);
          passwordValidator = passwordErrorMessage;
        });

        if (_passwordKey.currentState.validate()) {}
      }
      if (retypepasswordErrorMessage.length > 0) {
        setState(() {
          retypepasswordValidator = retypepasswordErrorMessage;
        });

        if (_retypepasswordKey.currentState.validate()) {}
      }

    } catch (e) {
      print("Error in _registerUser function");
      print(e.message);
    }



    // try {
    //
    //
    //   //if (res.isSignUpComplete) {
    //   if (true) {
    //     print('User registration successful');
    //
    //     //Add user to DB
    //     insertUser();
    //
    //     if (users != null) {
    //       Navigation.intentWithData(context, AppRoutes.VERIFYEMAIL,RegistrationArgumentClass(users[0]));
    //     }
    //   }
    //   else {
    //     print('User registration failed');
    //   }
    //   // setState(() {
    //   //   //isSignUpComplete = res.isSignUpComplete;
    //   // }
    //   //);
    // } catch (e) {
    //   print(e.message);
    // }

  }

  Future<void> insertUser() async {
    try{
      final item = Users(
        first_name: _firstNameController.text,
        last_name: _lastNameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        email_verification: false,
        phone_verification: false,
        parent_verification: false,
        address_verification: false,
        photo_verification: false,
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