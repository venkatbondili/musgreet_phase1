import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class OTPFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final Function callBack;

  const OTPFieldWidget({Key key, this.controller, this.callBack}) : super(key: key);
  @override
  _OTPFieldWidgetState createState() => _OTPFieldWidgetState();
}

class _OTPFieldWidgetState extends State<OTPFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      textStyle: TextStyle(
          color: AppColors.black,
          fontSize: 14
      ),

      onChanged: (value) {

      },
      appContext: context,
      length: 6,
      controller: widget.controller,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        activeColor: AppColors.GREY_KIND,
        inactiveColor: AppColors.GREY_KIND,
        selectedColor: AppColors.GREY_KIND,
        borderWidth: 1,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
      ),
      animationType: AnimationType.fade,
      enablePinAutofill: true,
      obscureText: false,
      keyboardType: TextInputType.number,
      animationDuration: Duration(milliseconds: 300),
      onCompleted: (pin) {
        widget.callBack(pin);
      },
      beforeTextPaste: (text) {
        return true;
      },
    );
  }
}
