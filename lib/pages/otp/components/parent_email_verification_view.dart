import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/size_config.dart';
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

Widget _buildContent(context) {
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
                'Please enter the 6 digit code sent to r1*********@gmail.com',
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
                        _navigateToNextScreen(context);
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

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => AddressVerificationScreen()));
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

