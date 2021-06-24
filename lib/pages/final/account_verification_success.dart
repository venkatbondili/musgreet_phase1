import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/utils/size_config.dart';
import 'package:mus_greet/models/Users.dart';
//import 'package:international_phone_input/international_phone_input.dart';
import 'package:mus_greet/pages/otp/phone_otp_screen.dart';
import 'package:mus_greet/pages/final/community_promise_page.dart';

import 'final_step_page.dart';

class AccountVerificationSuccessPage extends StatefulWidget {
  @override
  _AccountVerificationSuccessPageState createState() => _AccountVerificationSuccessPageState();
}

class _AccountVerificationSuccessPageState extends State<AccountVerificationSuccessPage> {

  FinalStepArgumentClass args;
  Users sessionUser;
  
  @override
  Widget build(BuildContext context) {

    args = ModalRoute.of(context).settings.arguments as FinalStepArgumentClass;
    sessionUser = args.sessionUser;
    
    /*var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    double fontSize(double size) {
      return size * width / 414;
    }*/
    //print(height);
    return Scaffold(
      body: _buildContent(context),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60.0,
                ),
                SafeArea(
                  child: Container(
                    //color: Colors.amber,
                    padding: EdgeInsets.all(25.0),
                    child: MaterialButton(
                      onPressed: () {},
                      color: Colors.green[800],
                      textColor: Colors.white,
                      child: Icon(
                        Icons.verified_user_sharp,
                        size: 60,
                      ),
                      padding: EdgeInsets.all(16),
                      shape: CircleBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                //SizedBox(height: SizeConfig.screenHeight * 0.05),
                Text(
                  'Your account has been verified successfully',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                //SizedBox(height: SizeConfig.screenHeight * 0.05),
                SizedBox(
                  height: 40.0,
                ),
                Image.asset(
                  'assets/images/logo.png',
                  /*width: 100,
            height: 100,*/
                ),
                //SizedBox(height: SizeConfig.screenHeight * 0.04),
                SizedBox(
                  height: 40.0,
                ),
                Text(
                  'Welcome to mus greet',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                ),
                //SizedBox(height: SizeConfig.screenHeight * 0.02),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: double.infinity, // <-- match_parent
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 7),
                      child: Text(
                        'Invite friends by sharing this app',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          )),
                      onPressed: () {},
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.0,
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: double.infinity, // <-- match_parent
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 7),
                      child: Text(
                        '                 Continue                 ',
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
                        Timer(Duration(seconds: 2),() => _navigateToNextScreen(context));
                        //_navigateToNextScreen(context);
                      },
                    ),
                  ),
                ),
              ]
          ),
        )
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => CommunityPromisePage()));
    Navigation.intentWithData(context, AppRoutes.COMMUNITYPROMISE,AccountSuccessArgumentClass(sessionUser));
  }

}

class AccountSuccessArgumentClass {
  final Users sessionUser;
  AccountSuccessArgumentClass(this.sessionUser);
}