import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/action_button_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';

class SendRequestDialogWidget extends StatefulWidget {
  @override
  _SendRequestDialogWidgetState createState() =>
      _SendRequestDialogWidgetState();
}

class _SendRequestDialogWidgetState extends State<SendRequestDialogWidget> {
  final TextEditingController _textEditingController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        insetPadding: EdgeInsets.only(left: 30,right: 30),
        elevation: 5,
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getSendToUserAndName(),
              CustomSpacerWidget(
                height: 20,
              ),
              _getMessageHeader(),
              CustomSpacerWidget(
                height: 5,
              ),
              _getMessageField(),
              CustomSpacerWidget(
                height: 5,
              ),
              _getCounterText(),
              CustomSpacerWidget(
                height: 20,
              ),
              _getButtons(),
            ],
          ),
        ),
      ),
    );
  }


  _getSendToUserAndName(){
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: Text.rich(
        TextSpan(
          text: AppTexts.TO_USER,
          style: TextStyle(
            fontFamily: FontConstants.FONT,
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: AppColors.header_black,
          ),
          children: [
            TextSpan(
              text: AppTexts.TO_USER_NAME,
              style: TextStyle(
                fontFamily: FontConstants.FONT,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.header_black,
              ),
            )
          ]
        )
      ),
    );
  }


  _getMessageHeader(){
    return Text(
      AppTexts.MESSAGE_TEXT,
      style:  TextStyle(
        fontFamily: FontConstants.FONT,
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: AppColors.header_black,
      ),
    );
  }


  _getMessageField(){
    return SendRequestMessageBox(
      controller: _textEditingController,
      onChange: (val){
        setState(() {

        });
      },
    );
  }


  _getCounterText(){
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 5),
      width: MediaQuery.of(context).size.width,
      child: Text(
        "${_textEditingController.text.length}/130",
        style: TextStyle(
          fontFamily: FontConstants.FONT,
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: AppColors.black_50,
        ),
      )
    );
  }


  _getButtons(){
    return Container(
      child: Row(
        children: [
          Expanded(
            child: ActionButtonWidget(
              text: AppTexts.CANCEL,
              isFilled: false,
              callBack: (){
                Navigation.back(context);
              },
            ),
          ),
          CustomSpacerWidget(width: 20,),
          Expanded(
            child: ActionButtonWidget(
              text: AppTexts.SEND_TEXT,
              isFilled: true,
              callBack: (){
                Navigation.back(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}



///Message Box on send request


class SendRequestMessageBox extends StatefulWidget {
  final Function(String) onChange;
  final TextEditingController controller;

  const SendRequestMessageBox({Key key, this.onChange,this.controller}) : super(key: key);
  @override
  _SendRequestMessageBoxState createState() => _SendRequestMessageBoxState();
}

class _SendRequestMessageBoxState extends State<SendRequestMessageBox> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.green,width: 0.5)
      ),
      child: TextFormField(
        controller: widget.controller,
        maxLines: 5,
        maxLength: 130,
        maxLengthEnforced: true,
        style: TextStyle(
          fontFamily: FontConstants.FONT,
          fontWeight: FontWeight.w900,
          fontSize: 12,
          color: AppColors.vertical_divider,
        ),
        decoration: InputDecoration(
          labelText: AppTexts.FRIEND_REQUEST_MESSAGE,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          counterText: "",
          contentPadding: EdgeInsets.all(15),
        ),
        onChanged: widget.onChange,
      ),
    );
  }
}
