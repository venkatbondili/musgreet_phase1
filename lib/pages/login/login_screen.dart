import 'dart:async';
import 'dart:io';

import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/login_screen_text_field_widget.dart';
import 'package:mus_greet/core/widgets/password_field_widget.dart';
import 'package:mus_greet/core/widgets/social_media_button_widget.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:mus_greet/models/UserProfile.dart';
import 'package:mus_greet/models/Users.dart';
import 'package:mus_greet/pages/address-verification/address_verification_view.dart';
import 'package:mus_greet/pages/age/age_registration_page.dart';
import 'package:mus_greet/pages/final/community_promise_page.dart';
import 'package:mus_greet/pages/final/final_step_page.dart';
import 'package:mus_greet/pages/final/nearly_finished_page.dart';
import 'package:mus_greet/pages/otp/components/phone_otp_view.dart';
import 'package:mus_greet/pages/registration/registration_screen.dart';
import 'package:mus_greet/pages/smile/time_to_smile_page.dart';
import 'package:mus_greet/pages/verify_email_screen/verify_email_screen.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _loginKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  bool _isObscure = true;
  List<Users> users;
  Users loggedUser;
  String emailValidator;
  String passwordValidator;

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
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            CustomSpacerWidget(
              height: 50,
            ),
            _getLogoAndBack(),
            CustomSpacerWidget(
              height: 30,
            ),
            _getLoginText(),
            CustomSpacerWidget(
              height: 25,
            ),
            //_getTextField(),
            // CustomSpacerWidget(
            //   height: 30,
            // ),
            Container(
              child: Form(
                key: _loginKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    _getLoginTextField(),
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
            CustomSpacerWidget(
              height: 5,
            ),
            _getForgotPasswordText(),
            CustomSpacerWidget(
              height: 40,
            ),
            _getLoginButton(),
            CustomSpacerWidget(
              height: 40,
            ),
            _getSocialMediaText(),
            CustomSpacerWidget(
              height: 40,
            ),
            _getSocialMediaButton(),
            CustomSpacerWidget(
              height: 50,
            ),
            _getRegisterTextAndButton(),
            CustomSpacerWidget(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  _getLogoAndBack() {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: AssetImageWidget(
        image: ImageConstants.IC_LOGIN_LOGO,
        height: 125,
        width: 100,
      ),
    );
  }

  _getLoginText() {
    return Flexible(
      child: Container(
        height: 34,
        child: Text(
          AppTexts.LOGIN_TEXT,
          style: TextStyle(
            fontSize: 25,
            fontFamily: FontConstants.FONT,
            fontWeight: FontWeight.bold,
            color: AppColors.header_black,
          ),
        ),
      ),
    );
  }

  _getTextField() {
    return LoginScreenTextField(
      leadingIcon: ImageConstants.IC_LOGIN_EMAIL,
      controller: _emailController,
      hintText: AppTexts.EMAIL,
      isPasswordField: false,
      //formkey: _key,
    );
  }

  _getLoginTextField() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 5,
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
        ],
      ),

    );
  }

  _getPasswordField_old() {
    return PasswordFieldWidget(
      leadingIcon: ImageConstants.IC_LOCK,
      controller: _passwordController,
      hintText: AppTexts.PASSWORD_TEXT,
      isPasswordField: true,
    );
  }

  _getForgotPasswordText() {
    return Container(
      alignment: Alignment.centerRight,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: GestureDetector(
        onTap: () {
          ///Forgot password
        },
        child: Text(
          AppTexts.FORGOT_PASSWORD_TEXT,
          style: TextStyle(
            fontSize: 13,
            fontFamily: FontConstants.FONT,
            fontWeight: FontWeight.w500,
            color: AppColors.green,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  _getSocialMediaText() {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
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
    return Flexible(
      child: Container(
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
      ),
    );
  }

  _getLoginButton() {
    return Flexible(
      child: LoginAndRegisterScreenButton(
        text: AppTexts.LOGIN_TEXT,
        isFilled: true,
        callBack: () {
          _loginUser();
        },
      ),
    );
  }

  _getRegisterTextAndButton() {
    return Text.rich(
      TextSpan(
          text: AppTexts.DO_NOT_HAVE_ACCOUNT,
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
              text: AppTexts.REGISTER_TEXT,
              style: TextStyle(
                fontSize: 14,
                fontFamily: FontConstants.FONT,
                fontWeight: FontWeight.w500,
                color: AppColors.green,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => _registerUser(),
            ),
          ]),
    );
  }

  _registerUser() {
    ///register user
    print('register link clicked');
    Navigation.intentWithClearAllRoutes(context, AppRoutes.REGISTER);
  }

  _loginUser() async {
    print('inside loginuser');
    String emailErrorMessage = '';
    String passwordErrorMessage = '';

    //     //Temporarily disabling Cognito verification
    //     // SignInResult res = await Amplify.Auth.signIn(
    //     //   username: _emailController.text,
    //     //   password: _passwordController.text,
    //     // );

    try {
      print(_emailController.text);
      print(_passwordController.text);

      users = null;

      //if (passwordErrorMessage.length > 0) {
        passwordErrorMessage = '';
        emailErrorMessage = '';
      //   setState(() {
      //     passwordValidator = null;
      //     emailValidator = null;
      //   });
      //}

      //_loginKey.currentState.reset();
      //_passwordKey.currentState.reset();

      //email validation
      if (_emailController.text
          .trim()
          .length == 0) {
        print('email empty case');
        emailErrorMessage = "Email field is required";
      } else {
        users = await Amplify.DataStore.query(
            Users.classType,
            where: Users.EMAIL.eq(_emailController.text.trim()));
        await Future.delayed(Duration(seconds: 1));

        print('after querying db');

        print(users);

        if (users != null) {
          if (users.length > 0) {
            print('users length > 0 case');
            // emailErrorMessage = '';
            // setState(() {
            //   emailValidator = null;
            //   print('inside setState');
            // });

            //valid email exists, let's check for the valid password
            if (_passwordController.text
                .trim()
                .length == 0) {
              passwordErrorMessage = "Password field is required";
            } else {
              users = await Amplify.DataStore.query(
                  Users.classType,
                  where: Users.EMAIL.eq(_emailController.text.trim()).and(
                      Users.PASSWORD.eq(_passwordController.text.trim())));
              await Future.delayed(Duration(seconds: 1));

              if (users != null) {
                if (users.length > 0) {
                  loggedUser = users[0];

                  // setState(() {
                  //   emailValidator = null;
                  //   passwordValidator = null;
                  // });
                  //navigate user to next screen
                  print('navigating user');
                  _navigateUser(loggedUser);
                  return;

                } else {
                  print('invalid pwd case');
                  passwordErrorMessage = "Invalid password, please check";
                }
              } else {
                print('invalid pwd case');
                passwordErrorMessage = "Invalid password, please check";
              }
            }
            if (passwordErrorMessage.length > 0) {
              // setState(() {
              //   this.passwordValidator = passwordErrorMessage;
              // });
              //
              // if (_passwordKey.currentState.validate()) {}
            } else {
              emailErrorMessage =
              "Invalid email or email doesn't exist, please check";
            }
          } else {
            emailErrorMessage =
            "Invalid email or email doesn't exist, please check";
          }
        }
      }
      print('before checking email error msg length');
      if (emailErrorMessage.length > 0) {
        setState(() {
          emailValidator = emailErrorMessage;
        });
      } else {
        emailValidator = null;
      }
      if (_loginKey.currentState.validate()) {}

      if (passwordErrorMessage.length > 0) {
        setState(() {
          this.passwordValidator = passwordErrorMessage;
        });
      } else {
        setState(() {
          this.passwordValidator = null;
        });
      }
      if (_passwordKey.currentState.validate()) {}

    } catch (e) {
      print("Error in _loginUser function");
      print(e.message);
    }
  }

  _navigateUser(Users loggedUser) async{
      //Checking user profile

      List<UserProfile> userProfile = await Amplify.DataStore.query(
          UserProfile.classType,
          where: UserProfile.USERSID.eq(loggedUser.id));
      await Future.delayed(Duration(seconds: 1));

      //email_verification check
      if (loggedUser.email_verification == false) {
        //send email with code and then navigate user to email verification page
        Navigation.intentWithData(context, AppRoutes.VERIFYEMAIL,
            RegistrationArgumentClass(loggedUser));

        //phone_verification check
      } else if (loggedUser.phone_verification == false) {
        Navigation.intentWithData(context, AppRoutes.PHONEINPUT,
            VerifyEmailArgumentClass(loggedUser));

        //age check
      } else if (loggedUser.age == null) {
        Navigation.intentWithData(context, AppRoutes.AGEREGISTER,
            PhoneOTPArgumentClass(loggedUser));

        //parent verification check
      } else if (int.parse(loggedUser.age) < 16 &&
          loggedUser.parent_verification == false) {

        Navigation.intentWithData(context, AppRoutes.PARENTEMAIL,
            AgeRegistrationArgumentClass(loggedUser));

        //address verification check
      } else if (loggedUser.address_verification == false) {

        if (loggedUser.address_verification_mode == 'Manual') {

          if (loggedUser.manual_address_taken_date == null) {
            //send user to address verification screen, so that again he/she can get both manual and auto options
            //Navigation.intentWithData(context, AppRoutes.MANUALADDRESS1,AgeRegistrationArgumentClass(sessionUser));
            Navigation.intentWithData(context, AppRoutes.VERIFYADDRESS,
                AgeRegistrationArgumentClass(loggedUser));
          } else if (loggedUser.manual_address_code_sent_date == null) {
            //user confirmed his/her address manually, but code not yet sent via post by admin user

          } else {
            //Need to allow user to input code sent via post
            Navigation.intentWithData(
                context, AppRoutes.MANUALADDRESSOTP,
                AddressVerificationArgumentClass(loggedUser));
          }
        } else {
          Navigation.intentWithData(context, AppRoutes.VERIFYADDRESS,
              AgeRegistrationArgumentClass(loggedUser));
        }

        //user profile check
      } else if (userProfile.length == 0) {
        //print(userProfile.length);
        Navigation.intentWithData(context, AppRoutes.NEARLYFINISHED,
            AddressVerificationArgumentClass(loggedUser));

        //photo verification check
      } else if (loggedUser.photo_verification == false) {
        Navigation.intentWithData(context, AppRoutes.TIMETOSMILE,
            NearlyFinishedArgumentClass(loggedUser));

        //terms, privacy policy agreement check
      } else if (loggedUser.terms_privacy_policy_agree == null) {
        Navigation.intentWithData(context, AppRoutes.FINALSTEP,
            TimetoSmileArgumentClass(loggedUser));

        //community promise check
      } else if (loggedUser.community_promise_agree == null) {
        //Navigation.intentWithData(context, AppRoutes.FINALSTEP,TimetoSmileArgumentClass(loggedUser));
        Navigation.intentWithData(context, AppRoutes.ACCOUNTSUCCESS,
            FinalStepArgumentClass(loggedUser));
      }
      //if all the verifications are done, then take user to Home screen
      else {
        Navigation.intentWithData(context, AppRoutes.HOME,
            CommunityPromiseArgumentClass(loggedUser));
      }
  }

}

class LoginAndRegisterScreenButton extends StatefulWidget {
  final Function callBack;
  final String text;
  final bool isFilled;
  final double radius;

  LoginAndRegisterScreenButton(
      {this.callBack, this.text, this.isFilled = false, this.radius = 8});

  @override
  _ActionButtonWidgetState createState() => _ActionButtonWidgetState();
}

class _ActionButtonWidgetState extends State<LoginAndRegisterScreenButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.callBack(),
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.background_color),
          borderRadius: BorderRadius.circular(widget.radius),
          color: widget.isFilled ? AppColors.background_color : null,
        ),
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: FontConstants.FONT,
            color:
            widget.isFilled ? AppColors.white : AppColors.background_color,
          ),
        ),
      ),
    );
  }
}

class loginValidator extends TextFieldValidator {
  final String email;
  final String pwd;
  final bool fldEmail;
  List<Users> users;
  Users loggedUser;

  loginValidator({
    String errorText, // = "Email doesn't exist, please check",
    this.email,
    this.pwd,
    this.fldEmail
  }) : super(errorText);

  // return false if you want the validator to return error
  // message when the value is empty.
  @override
  bool get ignoreEmptyValues => false;

  @override
  bool isValid(String value) {
    // return true if the value is valid according to your condition
    //return hasMatch(r'^((+|00)?218|0?)?(9[0-9]{8})$', value);

    print('inside loginvalidator');
    print(value);
    print(this.email);
    print(this.pwd);

    if (this.fldEmail) {
      //server side email validation
    print('only email case');

    //if (loggedUser == null) {
      getUser(this.email, null);
      //Timer(Duration(seconds: 2),() => _checkUserExists());
   // }
    //TemporalDate date=new TemporalDate(DateTime.now());
   // DateFormat('SS').format(date);

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);

    //delaying for 2 seconds
    print('before delay');
    _checkUserExists();
    print(formattedDate);
    //sleep(const Duration(seconds: 4));

    int i = 0;
    while (i < 200000) {
      i+=1;
    }
    i = 0;
    while (i < 200000) {
      i+=1;
    }
    i = 0;
    while (i < 200000) {
      i+=1;
    }
    i = 0;
    while (i < 200000) {
      i+=1;
    }
    i = 0;
    while (i < 200000) {
      i+=1;
    }

    print('after delay');
    DateTime now2 = DateTime.now();
    String formattedDate2 = DateFormat('kk:mm:ss \n EEE d MMM').format(now2);
    print(formattedDate2);



    _checkUserExists();

    if (loggedUser == null) {
      //user doesn't exist in the DB");
      print('null case');
      return false;
    }
    else {
      print('true case');
      return true;
    }

    } else {
      // server side email and password validation
      print('email and pwd case');

      //if (loggedUser == null) {
        getUser(this.email, this.pwd);
        //Timer(Duration(seconds: 2),() => _checkUserExists());
      //}

      sleep(const Duration(seconds: 2));

      //delaying for 2 seconds
      // int i = 0;
      // while (i < 20000) {
      //   i+=1;
      // }



      _checkUserExists();

      if (loggedUser == null) {
        //user doesn't exist in the DB");
        print('after getuser call, loggedUser null case');
        print(users);
        print(loggedUser);
        return false;
      }
      else {
        //user exists with valid credentials
        print('after getuser call, loggedUser null case');
        print(users);
        print(loggedUser);
        return true;
      }
    }

    //return false;
  }

  Future<List<Users>> getUser(email, pwd) async {
    try {
      print('inside getUser');
      if (pwd == null) {
        print(email);
        users = await Amplify.DataStore.query(
            Users.classType, where: Users.EMAIL.eq(email));
        await Future.delayed(Duration(seconds: 1));
        print('after querying db');
        DateTime now2 = DateTime.now();
        String formattedDate2 = DateFormat('kk:mm:ss \n EEE d MMM').format(now2);
        print(formattedDate2);
        print(users);

        if (users != null) {
          print('no data in users');
          print(users);

          if (users.length > 0) {
            // setState(() {
            //   _isUsernameTaken = true;
            //   _usernameErrorString = null;
            // })
            loggedUser = users[0];
            //return true;

          } else {
            //return false;
          }

        } else {
          print(users);
          //return false;
        }

        _checkUserExists();
      } else {
        users = await Amplify.DataStore.query(
            Users.classType, where: Users.EMAIL.eq(this.email).and(Users.PASSWORD.eq(this.pwd)));
        //await Future.delayed(Duration(seconds: 2));

        return users;

      }
    } catch (e) {
      print("Error in getUser method: " + e);
    }



    //Timer(Duration(seconds: 2),() => _checkUserExists());

  }

  bool _checkUserExists() {
    print('Inside checkuser');

    if (users != null) {
      print('no data in users');
      print(users);

      if (users.length > 0) {
        loggedUser = users[0];
        return true;

      } else {
        return false;
      }

    } else {
      print(users);
      return false;
    }
// print('before printing listusers');
//     listUsers();
  }

  Future<void> listUsers() async{
    try {
      print('In list users');
      List<Users> Userss = await Amplify.DataStore.query(Users.classType);
      await Future.delayed(Duration(seconds: 2));
      print(Userss.length);
      print(Userss);
      //print(Userss[0]);
      //print(Userss[0].first_name);
      //print(Userss.first);
      //print(Userss.length);
      //print(Userss[0].first_name);

    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }
}



// class RegistrationArgumentClass {
//   final Users sessionUser;
//   RegistrationArgumentClass(this.sessionUser);
// }

// class PhoneVerificationArgumentClass {
//   final Users sessionUser;
//   PhoneVerificationArgumentClass(this.sessionUser);
// }
//
// class PhoneOTPArgumentClass {
//   final Users sessionUser;
//   PhoneOTPArgumentClass(this.sessionUser);
// }
//
// class AgeRegistrationArgumentClass {
//   final Users sessionUser;
//   AgeRegistrationArgumentClass(this.sessionUser);
// }

// class VerifyEmailArgumentClass {
//   final Users sessionUser;
//   VerifyEmailArgumentClass(this.sessionUser);
// }

// class NearlyFinishedArgumentClass {
//   final Users sessionUser;
//   NearlyFinishedArgumentClass(this.sessionUser);
// }

// class CommunityPromiseArgumentClass {
//   final Users sessionUser;
//   CommunityPromiseArgumentClass(this.sessionUser);
// }