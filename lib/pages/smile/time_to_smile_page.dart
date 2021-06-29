import 'dart:async';

import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/models/Users.dart';
import 'package:mus_greet/pages/final/final_step_page.dart';
import 'package:mus_greet/pages/final/nearly_finished_page.dart';
import 'package:mus_greet/pages/otp/components/parent_email_verification_view.dart';

class TimeToSmilePage extends StatefulWidget {
  @override
  _TimeToSmilePageState createState() => _TimeToSmilePageState();
}

class _TimeToSmilePageState extends State<TimeToSmilePage> {

  NearlyFinishedArgumentClass args;
  Users sessionUser;
  List<Users> users;

  @override
  Widget build(BuildContext context) {

    args = ModalRoute.of(context).settings.arguments as NearlyFinishedArgumentClass;
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
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _buildContent(context) {
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
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Time to smile',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                //color: Colors.grey[300],
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                child: Text(
                  'We want mus greet to be free of fake accounts\n '
                      'Please upload and take a selfie which matches',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              MaterialButton(
                onPressed: () {},
                color: Colors.blue[300],
                textColor: Colors.white,
                child: Icon(
                  Icons.camera_alt,
                  size: 40,
                ),
                padding: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Text(
                    'Upload photo',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                child: Text(
                  'You must take a clear photo of your face\n '
                      'No sunglasses please',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              MaterialButton(
                onPressed: () {},
                color: Colors.green[400],
                textColor: Colors.white,
                child: Icon(
                  Icons.camera_front,
                  size: 40,
                ),
                padding: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Text(
                    "Let's take a selfie",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                child: Text(
                  'This selfie is private and is only seen by our review team. '
                      'It is never made public or shown on your profile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800]),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: SizedBox(
                  width: double.infinity, // <-- match_parent
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 7),
                    child: Text(
                      'Submit',
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
                      updatePhotoVerficationData();
                      Timer(Duration(seconds: 2),() => _navigateToNextScreen(context));
                      //_navigateToNextScreen(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Future<void> updatePhotoVerficationData() async {
    try {
      if (sessionUser != null) {
        final updatedItem = sessionUser.copyWith(
            photo_verification: true);
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
    //     .push(MaterialPageRoute(builder: (context) => FinalStepPage()));
    Navigation.intentWithData(context, AppRoutes.FINALSTEP,TimetoSmileArgumentClass(sessionUser));
  }

}

class TimetoSmileArgumentClass {
  final Users sessionUser;
  TimetoSmileArgumentClass(this.sessionUser);
}