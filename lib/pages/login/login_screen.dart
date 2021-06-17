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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
          ],
        ),
      ),
    );
  }

  _getLogoAndBack() {
    return Container(
      width: MediaQuery.of(context).size.width,
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
      width: MediaQuery.of(context).size.width,
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
          Navigation.intentWithClearAllRoutes(context, AppRoutes.HOME);
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
              recognizer: TapGestureRecognizer()..onTap = () => _registerUser(),
            ),
          ]),
    );
  }

  _registerUser() {
    ///register user
    print('register link clicked');
    Navigation.intentWithClearAllRoutes(context, AppRoutes.REGISTER);
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
