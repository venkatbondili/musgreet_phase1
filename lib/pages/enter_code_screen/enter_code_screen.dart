import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/check_box_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/otp_field_widget.dart';
import 'package:mus_greet/pages/login/login_screen.dart';

class EnterCodeScreen extends StatefulWidget {
  @override
  _EnterCodeScreenState createState() => _EnterCodeScreenState();
}

class _EnterCodeScreenState extends State<EnterCodeScreen> {
  final TextEditingController _codeController= TextEditingController();
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
        padding: EdgeInsets.only(left: 30, right: 30,top: 10),
        child: Column(
          children: [
            _getLogoAndBack(),
            CustomSpacerWidget(
              height: 25,
            ),
            _getEnterCodeHint(),
            CustomSpacerWidget(
              height: 35,
            ),
            _getOTPField(),
            CustomSpacerWidget(
              height: 0,
            ),
            _getCodeExpireTime(),
            CustomSpacerWidget(
              height: 30,
            ),
            _getResendButton(),
            CustomSpacerWidget(
              height: 30,
            ),
            _getParentalConsentForm(),
            CustomSpacerWidget(
              height: 20,
            ),
            _getCheckBoxText(),
            CustomSpacerWidget(
              height: 20,
            ),
            _getVerifyButton(),
            CustomSpacerWidget(
              height: 10,
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
          padding: EdgeInsets.only(top: 50),
          width: MediaQuery.of(context).size.width,
          child: AssetImageWidget(
            image: ImageConstants.IC_LOGIN_LOGO,
            height: 110,
            width: 100,
          ),
        ),
        Positioned(top: 40, left: 5, child: _getBackButton()),
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

  _getEnterCodeHint(){
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: Text(
        "${AppTexts.ENTER_CODE_HINT}\n ${_getEncryptedEmail("ravi@ailoitte.com")}",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontConstants.FONT,
          fontSize: 16,
          fontWeight: FontWeight.w900,
          color:AppColors.black,
        ),
      ),
    );
  }


  _getOTPField(){
    return Container(
      padding: EdgeInsets.only(left: 40,right: 40),
      child: OTPFieldWidget(
        callBack: (){

        },
        controller: _codeController,
      ),
    );
  }

  _getCodeExpireTime(){
    return Text(
      AppTexts.TIME_LIMIT_CODE,
      style: TextStyle(
        fontFamily: FontConstants.FONT,
        fontWeight: FontWeight.w900,
        fontSize: 14,
        color: AppColors.green_light
      ),
    );
  }

  _getResendButton(){
    return GestureDetector(
      onTap: (){
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
              color: AppColors.black
          ),
        ),
      ),
    );
  }

  _getParentalConsentForm(){
    return  Material(
      elevation: 5,
      shadowColor: AppColors.white,
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius:  BorderRadius.circular(12),
          color: AppColors.white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getHeader(),
            CustomSpacerWidget(height: 10,),
            _getParentalConsentText(),
          ],
        ),
      ),
    );
  }

  _getHeader(){
    return Text(
      AppTexts.PARENTAL_CONSENT_FORM,
      style: TextStyle(
          fontFamily: FontConstants.FONT,
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: AppColors.black
      ),
    );
  }

  _getParentalConsentText(){
    return Text(
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
      style: TextStyle(
        fontFamily: FontConstants.FONT,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.light_grey
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
    return Text(
      AppTexts.PARENT_AGREE,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: FontConstants.FONT,
        fontSize: 12,
        color: AppColors.black,
      ),
    );
  }

  _getVerifyButton() {
    return LoginAndRegisterScreenButton(
      text: AppTexts.VERIFY_AND_CONTINUE,
      isFilled: true,
      callBack: () {
        ///Login call back will
      },
    );
  }

  _getEncryptedEmail(String email){
    var encryptedEmail="";
    int index=email.indexOf("@");
    for(int i=0;i<email.length; i++){
      if(i>=2 && i<index){
        encryptedEmail+="*";
      }else{
        encryptedEmail+=email[i];
      }
    }
    return encryptedEmail;
  }
}
