import 'dart:async';

import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/utils/size_config.dart';
import 'package:mus_greet/models/Users.dart';
import 'package:mus_greet/pages/address-verification/confirm_address_2_screen.dart';
import 'package:mus_greet/pages/home/home.dart';

import '../../main.dart';
import 'account_verification_success.dart';

class CommunityPromisePage extends StatefulWidget {
  @override
  _CommunityPromisePageState createState() => _CommunityPromisePageState();
}

class _CommunityPromisePageState extends State<CommunityPromisePage> {

  bool checked = false;
  AccountSuccessArgumentClass args;
  Users sessionUser;
  List<Users> users;

  TemporalDate date=new TemporalDate(DateTime.now());

  @override
  Widget build(BuildContext context) {

    args = ModalRoute.of(context).settings.arguments as AccountSuccessArgumentClass;
    sessionUser = args.sessionUser;

    return Scaffold(
      body: _buildContent(context),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildContent(BuildContext context) {
  bool checked = false;
      return SingleChildScrollView(
          child: Center(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SafeArea(
                    child: Container(
                      //color: Colors.amber,
                      padding: EdgeInsets.all(10.0),
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Community promise',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12.0),
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                    margin: EdgeInsets.symmetric(horizontal: 34, vertical: 7),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.green[800]),
                      borderRadius: const BorderRadius.all(const Radius.circular(7))
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Be helpful                                                                                ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[800]),
                        ),
                        SizedBox(height: 8.0),
                        Text('Share this space in a constructive way. Be kind,\n'
                              'not judgemental in your conversations.                                                                              ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  //SizedBox(height: 2.0),
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                    margin: EdgeInsets.symmetric(horizontal: 34, vertical: 7),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.green[800]),
                        borderRadius: const BorderRadius.all(const Radius.circular(7))

                    ),
                    child: Column(
                      children: [
                        Text(
                          'Be respectful                                                                                ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[800]),
                        ),
                        SizedBox(height: 8.0),
                        Text('You\'re speaking to your real neighbours. Strong\n'
                              'communities are built on strong relationships.                                                                             ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  //SizedBox(height: 2.0),
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                    margin: EdgeInsets.symmetric(horizontal: 34, vertical: 7),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.green[800]),
                        borderRadius: const BorderRadius.all(const Radius.circular(7))
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Do not discriminate                                                                                ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[800]),
                        ),
                        SizedBox(height: 8.0),
                        Text('We do not tolerate racism, hateful language or\n'
                            'discrimination of any kind.                                                                             ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  //SizedBox(height: 2.0),
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                    margin: EdgeInsets.symmetric(horizontal: 34, vertical: 7),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.green[800]),
                        borderRadius: const BorderRadius.all(const Radius.circular(7))
                    ),
                    child: Column(
                      children: [
                        Text(
                          'No to harmful activities                                                                                ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[800]),
                        ),
                        SizedBox(height: 8.0),
                        Text('We prohibit any activity that could hurt someone\n'
                            'from bullying to scams to physical harm.                                                                             ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                    child: Row(
                      children: <Widget>[
                          Checkbox(
                            checkColor: Colors.grey,
                            activeColor: Colors.white,
                            value: checked,
                            onChanged: (bool value) {
                              //checked = value;
                            },
                          ),
                          Align(
                            child: RichText(
                              text: TextSpan(
                                text: "I agree to treat everyone in mus greet community\n"
                                    "with respect. ",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Read community guidelines",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.green[800],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                      ],
                    ),
                  ),
                  //SizedBox(height: 2.0),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: SizedBox(
                        width: double.infinity, // <-- match_parent
                        child: RaisedButton(
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 1),
                          child: Text(
                            'Go to my community',
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
                            updateUserDetails();
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

  void updateUserDetails()  async {
    try {
      bool joinFlag = false;



      if (sessionUser != null) {
        joinFlag = sessionUser.address_verification;

        if (joinFlag) {
          final updatedItem = sessionUser.copyWith(
              community_promise_agree: true,
              active_status: true,
              joined_date: date);
          await Amplify.DataStore.save(updatedItem);
          sessionUser = updatedItem;

        }else {
          final updatedItem = sessionUser.copyWith(
              community_promise_agree: true);
          await Amplify.DataStore.save(updatedItem);
          sessionUser = updatedItem;
        }
      }
    }
    catch(e) {
      print(e.message);
    }
  }

  void _navigateToNextScreen(BuildContext context) {
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => Home()));
    Navigation.intentWithData(context, AppRoutes.HOME,CommunityPromiseArgumentClass(sessionUser));
  }

}

class CommunityPromiseArgumentClass {
  final Users sessionUser;
  CommunityPromiseArgumentClass(this.sessionUser);
}