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

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
              height: 60,
            ),
            _getLoginText(),
            CustomSpacerWidget(
              height: 37,
            ),
            _getTextField(),
            CustomSpacerWidget(
              height: 30,
            ),
            _getPasswordField(),
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
    try {
      //Temporarily disabling Cognito verification
    // SignInResult res = await Amplify.Auth.signIn(
      //   username: _emailController.text,
      //   password: _passwordController.text,
      // );

      print('hi');
      //if (res.isSignedIn) {
      if (true) {
        print("Sign in succeeded");

        List<Users> users = await Amplify.DataStore.query(
            Users.classType, where: Users.EMAIL.eq(_emailController.text));
        await Future.delayed(Duration(seconds: 2));

        if (users != null) {
          print(users);

          Users loggedUser = users[0];

          //Checking user profile

          List<UserProfile> userProfile = await Amplify.DataStore.query(UserProfile.classType,where: UserProfile.USERSID.eq(loggedUser.id));
          await Future.delayed(Duration(seconds: 2));

          // Users x = Users(first_name: 'Venkat');
          // UserProfile c = UserProfile(sect: sect, usersID: x.id);

            //email_verification check
          if (loggedUser.email_verification == false) {

            //send email with code and then navigate user to email verification page
            Navigation.intentWithData(context, AppRoutes.VERIFYEMAIL,RegistrationArgumentClass(users[0]));

            //phone_verification check
          } else if (loggedUser.phone_verification == false) {

              Navigation.intentWithData(context, AppRoutes.PHONEINPUT,VerifyEmailArgumentClass(loggedUser));

            //age check
          } else if (loggedUser.age == null) {

            Navigation.intentWithData(context, AppRoutes.AGEREGISTER,PhoneOTPArgumentClass(loggedUser));

            //parent verification check
          } else if (int.parse(loggedUser.age) < 16 && loggedUser.parent_verification == false) {

            //if (loggedUser.age as int < 16) {
              Navigation.intentWithData(context, AppRoutes.PARENTEMAIL,AgeRegistrationArgumentClass(loggedUser));
              // } else {
              //   Navigation.intentWithData(context, AppRoutes.VERIFYADDRESS,AgeRegistrationArgumentClass(loggedUser));
              // }
            //}
            //address verification check
          } else if (loggedUser.address_verification == false) {

              if (loggedUser.address_verification_mode == 'Manual') {

                if (loggedUser.manual_address_taken_date == null) {
                  //send user to address verification screen, so that again he/she can get both manual and auto options
                  //Navigation.intentWithData(context, AppRoutes.MANUALADDRESS1,AgeRegistrationArgumentClass(sessionUser));
                  Navigation.intentWithData(context, AppRoutes.VERIFYADDRESS,AgeRegistrationArgumentClass(loggedUser));

                } else if (loggedUser.manual_address_code_sent_date == null) {
                  //user confirmed his/her address manually, but code not yet sent via post by admin user

                } else {
                  //Need to allow user to input code sent via post
                  Navigation.intentWithData(context, AppRoutes.MANUALADDRESSOTP,AddressVerificationArgumentClass(loggedUser));

                }
              } else {
                Navigation.intentWithData(context, AppRoutes.VERIFYADDRESS,AgeRegistrationArgumentClass(loggedUser));
              }

            //user profile check
          } else if (userProfile.length == 0) {
            //print(userProfile.length);
            Navigation.intentWithData(context, AppRoutes.NEARLYFINISHED,AddressVerificationArgumentClass(loggedUser));

            //photo verification check
          } else if (loggedUser.photo_verification == false) {

            Navigation.intentWithData(context, AppRoutes.TIMETOSMILE,NearlyFinishedArgumentClass(loggedUser));

            //terms, privacy policy agreement check
          } else if (loggedUser.terms_privacy_policy_agree == null) {

            Navigation.intentWithData(context, AppRoutes.FINALSTEP,TimetoSmileArgumentClass(loggedUser));

            //community promise check
        } else if (loggedUser.community_promise_agree == null) {

            //Navigation.intentWithData(context, AppRoutes.FINALSTEP,TimetoSmileArgumentClass(loggedUser));
            Navigation.intentWithData(context, AppRoutes.ACCOUNTSUCCESS,FinalStepArgumentClass(loggedUser));
          }
          //if all the verifications are done, then take user to Home screen
          else {
            Navigation.intentWithData(context, AppRoutes.HOME,CommunityPromiseArgumentClass(loggedUser));
          }

        }
        else {
          //user doesn't exist in the DB");
        }
      }
      else {
        //applies only when using cognito: user exists in cognito but not yet confirmed
        print("Sign in failed");
      }
    } catch (e) {
      print("Error in Sign in function");
      print(e.message);
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
        width: MediaQuery.of(context).size.width,
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