import 'dart:ui';
//import 'package:intl/intl.dart'; // un comment this line
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/action_button_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/models/FriendRequest.dart';
import 'package:mus_greet/models/Users.dart';

class SendRequestDialogWidget extends StatefulWidget {

  final Users userObject;
 // DateTimeFormat dateTimeFormat;
  final String loginUserId;
  SendRequestDialogWidget({this.userObject, this.loginUserId});

  @override
  _SendRequestDialogWidgetState createState() =>
      _SendRequestDialogWidgetState();
}

class _SendRequestDialogWidgetState extends State<SendRequestDialogWidget> {
   TextEditingController _textEditingController=TextEditingController();
  TemporalDate temporalDate=new TemporalDate(DateTime.now());
   DateTime date=new DateTime.now();

   // @override
   // void initState()
   // {
   //   super.initState();
   //   _textEditingController=TextEditingController(text: initialText);
   // }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        insetPadding: EdgeInsets.only(left: 30,right: 30),
        elevation: 5,
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
            //borderRadius: BorderRadius.all(Radius.circular(20.0)) ///uncomment this line
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
              text: widget.userObject.first_name + " "+ widget.userObject.last_name,
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
        print(val);
        print("Send Request Message Box");
        setState(() {
          //print(initialText);
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
                print("click on send text");
                print(widget.userObject);
                updateFriendsTable();
                Navigation.back(context);
              },
            ),
          ),
        ],
      ),
    );
  }



  Future<void> updateFriendsTable()  async {
    String message="";
    if(_textEditingController.text.isEmpty)
      {
        message= AppTexts.MESSAGE_TEXT;
      }else
        {
          message=_textEditingController.text;
        }

    final item = FriendRequest(
        request_date: temporalDate,
        request_from_id: widget.loginUserId,
        request_to_id: widget.userObject.id,
        request_message: message,
        request_status: "Sent");
        //request_status_date: TemporalDate.fromString("1970-01-01Z"),
        //unfriend_date: TemporalDate.fromString("1970-01-01Z"));
    await Amplify.DataStore.save(item);
    print(item);
    print("updating the FriendsTable");
  }
}



///Message Box on send request


class SendRequestMessageBox extends StatefulWidget {
  final Function(String) onChange;
   final TextEditingController controller;
  //String initalText=AppTexts.FRIEND_REQUEST_MESSAGE;

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
          //labelText: AppTexts.FRIEND_REQUEST_MESSAGE,
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
