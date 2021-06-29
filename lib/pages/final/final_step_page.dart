import 'dart:async';

import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/utils/size_config.dart';
import 'package:mus_greet/models/Users.dart';
import 'package:mus_greet/pages/final/account_verification_success.dart';
import 'package:mus_greet/pages/smile/time_to_smile_page.dart';

import '../../main.dart';

class FinalStepPage extends StatefulWidget {
  @override
  _FinalStepPageState createState() => _FinalStepPageState();
}

class _FinalStepPageState extends State<FinalStepPage> {

  TimetoSmileArgumentClass args;
  Users sessionUser;
  List<Users> users;

  @override
  Widget build(BuildContext context) {

    args = ModalRoute.of(context).settings.arguments as TimetoSmileArgumentClass;
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
              SafeArea(
                child: Container(
                  //color: Colors.amber,
                  padding: EdgeInsets.all(25.0),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Final Step',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 7),
                child: Container(
                  //color: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                  child: Column(children: [
                    Text(
                      'Terms of Services                                                                                ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    //SizedBox(height: SizeConfig.screenHeight * 0.01),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed'
                          'Diam nonumy eirmod tempor invidunt ut labore et dolore'
                          'magna aliquyam erat, sed diam voluptua. At vero eos et'
                          'accusam et justo duo dolores et ea rebum. Stet clita kasd'
                          'gubergren, no sea takimata sanctus est Lorem ipsum dolor sit'
                          'amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr,'
                          'sed diam nonumy eirmod tempor  invidunt ut labore at dolore'
                          'gubergren, no sea takimata santctus est Lorem ipsum dolor sit'
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
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 7),
                child: Container(
                  //color: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                  child: Column(children: [
                    Text(
                      'Privacy Policy                                                                                ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    //SizedBox(height: SizeConfig.screenHeight * 0.01),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed'
                          'Diam nonumy eirmod tempor invidunt ut labore et dolore'
                          'magna aliquyam erat, sed diam voluptua. At vero eos et'
                          'accusam et justo duo dolores et ea rebum. Stet clita kasd'
                          'gubergren, no sea takimata sanctus est Lorem ipsum dolor sit'
                          'amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr,'
                          'sed diam nonumy eirmod tempor  invidunt ut labore at dolore'
                          'gubergren, no sea takimata santctus est Lorem ipsum dolor sit'
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
              ),
              //SizedBox(height: SizeConfig.screenHeight * 0.03),
              SizedBox(
                height: 25.0,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      //margin: EdgeInsets.only(left: width / 10),
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 7),
                        child: Text(
                          'Disagree',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            )),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      width: 25,
                    ),
                    Container(
                      //margin: EdgeInsets.only(left: width / 10),
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 7),
                        child: Text(
                          'Agree',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Colors.green[800],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            )),
                        onPressed: () {
                          updateTermsPolicy();
                          Timer(Duration(seconds: 2),() => _navigateToNextScreen(context));
                          //_navigateToNextScreen(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Future<void> updateTermsPolicy() async {
    try {
      if (sessionUser != null) {
        final updatedItem = sessionUser.copyWith(
            terms_privacy_policy_agree: true);
        await Amplify.DataStore.save(updatedItem);
        sessionUser = updatedItem;
      }
    }
    catch(e) {
      print(e.message);
    }
  }

  void _navigateToNextScreen(BuildContext context) {
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => AccountVerificationSuccessPage()));
    Navigation.intentWithData(context, AppRoutes.ACCOUNTSUCCESS,FinalStepArgumentClass(sessionUser));
  }

}

class FinalStepArgumentClass {
  final Users sessionUser;
  FinalStepArgumentClass(this.sessionUser);
}