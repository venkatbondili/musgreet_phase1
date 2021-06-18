import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/size_config.dart';
import 'package:mus_greet/models/Users.dart';
import 'package:mus_greet/pages/address-verification/address_verification_screen.dart';

import 'otp_form.dart';

class ParentEmailVerificationView extends StatefulWidget {
  @override
  _ParentEmailVerificationViewState createState() => _ParentEmailVerificationViewState();
}

class _ParentEmailVerificationViewState extends State<ParentEmailVerificationView> {

  @override
  Widget build(BuildContext context) {
    /*var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    double fontSize(double size) {
      return size * width / 414;
    }*/
    //print(height);
    return Scaffold(
      body: _buildContent(context),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
    );
  }
}
List<Users> users;
Widget _buildContent(context) {
  userDetailsData();
//class ParentEmailVerificationView extends StatelessWidget {
  bool checked = false;

/*  @override
  Widget build(BuildContext context) {*/
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              SafeArea(
                child: Container(
                  padding: EdgeInsets.all(1.0),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Text(
                'Please enter the 6 digit code sent to ' ,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              OtpForm(),
              buildTimer(),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              GestureDetector(
                onTap: () {
                  // OTP code resend
                },
                child: Text(
                  "Resend code",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Container(
                //color: Colors.grey[300],
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                child: Column(children: [
                  Text(
                    'Parental consent form                                                                                ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.01),
                  Text(
                    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed\n'
                    'Diam nonumy eirmod tempor invidunt ut labore et dolore\n'
                    'magna aliquyam erat, sed diam voluptua. At vero eos et\n'
                    'accusam et justo duo dolores et ea rebum. Stet clita kasd\n'
                    'gubergren, no sea takimata sanctus est Lorem ipsum dolor sit\n'
                    'amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr\n,'
                    'sed diam nonumy eirmod tempor  invidunt ut labore at dolore\n'
                    'magna aliquyam erat, sed diam voluptua. At vero eos et\n'
                    'accusam et justo duo dolores et ea rebum. Stet clita kasd\n'
                    'gubergren, no sea takimata santctus est Lorem ipsum dolor sit\n'
                    'amet.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 11.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[400]),
                  )
                ]),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Checkbox(
                        checkColor: Colors.grey,
                        activeColor: Colors.white,
                        value: checked,
                        //onChanged: (bool value) {},
                        onChanged: (bool value) {
                          checked = value;
                        },
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: Align(
                        child: RichText(
                          text: TextSpan(
                            text:
                                "My parent/gardian and myself agree to the parent "
                                "consent form",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.00),
              Container(
                padding: EdgeInsets.all(20.0),
                child: SizedBox(
                    width: double.infinity, // <-- match_parent
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 7),
                      child: Text(
                        'Verify and continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Colors.green[800],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          )),
                      onPressed: () {
                        verifyParentVerification(context);
                        //_navigateToNextScreen(context);
                      },
                    ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

void verifyParentVerification(BuildContext context) {

  print("inside the verify button");
  //print('In verify function : ${_codeController.text}');
  //print(_codeController.text);
  try {
    //  SignUpResult res = await Amplify.Auth.confirmSignUp(
    //  username: email,
    //confirmationCode: _codeController.text,
    //);

    if (true) {
      print('Email code verification successful');
      updateParentVerification();
      //Navigator.of(context)
      //  .push(MaterialPageRoute(builder: (context) => OtpSuccessScreen()));
      // builder:(BuildContext context) =>_buildContent(context);
      _showDialog(context);
    }
    else
    {
      _showDialogFailed();
    }
    // setState(() {
    //   //isSignUpComplete = res.isSignUpComplete;
    // }
    //);
  } catch (e) {
    print(e.message);
}


}

Row buildTimer() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(height: SizeConfig.screenHeight * 0.07),
      Text("This code will expire in 10 minutes"),
      /*      TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(seconds: 1800),
          builder: (_, value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
        Text(" mins."),*/
    ],
  );
}


Future<void> updateParentVerification() async {

  final updatedItem = users[0].copyWith(
    parent_consent_form_agree: true,
      parent_verification: true);
  await Amplify.DataStore.save(updatedItem);
}

_showDialog(BuildContext context)
{
  print("inside the show Dialog");
  return showDialog(
    context :context,
    builder:(context) =>AlertDialog
      (
      title: MaterialButton(
        onPressed: () {},
        color: Colors.green[800],
        textColor: Colors.white,
        child: Image.asset(
          'assets/images/mail.png',
          //width: 100,
          //height: 100,
        ),
        /*child: Icon(
            Icons.email,
            size: 40,
          ),*/
        padding: EdgeInsets.all(16),
        shape: CircleBorder(),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        // wrap content in flutter
        children: <Widget>[
          Text(
            '  You have successfully verified your email',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          FlatButton(
            onPressed: () {
              //Navigator.of(ctx).pop();
            },
            child: SizedBox(
              width: double.infinity, // <-- match_parent
              child:  RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 7),
                child: Text(
                  'Continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: Colors.green[800],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    )),
                onPressed: () {
                  print("inside the on press ");
                  updatePhoneVerfication();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddressVerificationScreen()));
                },
              ),
            ),

          ),
        ],
      ),
      actions: <Widget>[],
    ),
  );
}

_showDialogFailed()
{
  print("inside the show Dialog");
  return showDialog(
   // context :context,
    builder:(context) =>AlertDialog
      (
      title: MaterialButton(
        onPressed: () {},
        color: Colors.green[800],
        textColor: Colors.white,
        child: Image.asset(
          'assets/images/mail.png',
          //width: 100,
          //height: 100,
        ),
        /*child: Icon(
            Icons.email,
            size: 40,
          ),*/
        padding: EdgeInsets.all(16),
        shape: CircleBorder(),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        // wrap content in flutter
        children: <Widget>[
          Text(
            '  Your Email Verfication has Failed.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          FlatButton(
            onPressed: () {
              //Navigator.of(ctx).pop();
            },
            child: SizedBox(
              width: double.infinity, // <-- match_parent
              child:  RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 7),
                child: Text(
                  'Continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: Colors.green[800],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    )),
                onPressed: () {
                  updatePhoneVerfication();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddressVerificationScreen()));
                },
              ),
            ),

          ),
        ],
      ),
      actions: <Widget>[],
    ),
  );
}

void updatePhoneVerfication()  async{
  final updatedItem = users[0].copyWith(
      parent_verification: true,
      parent_consent_form_agree: true);
  await Amplify.DataStore.save(updatedItem);
}

Future<void> userDetailsData() async
{
  print("getting the data from the users");
  try {
    users = await Amplify.DataStore.query(Users.classType , where:Users.ID.eq("315eca04-ab0d-46f7-b063-d8707d607a18"));
    print(users);
  }
  catch(e)
  {

  }
}