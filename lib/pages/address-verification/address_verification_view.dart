import 'dart:async';

import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/utils/size_config.dart';
import 'package:mus_greet/models/Users.dart';
import 'package:mus_greet/pages/address-verification/confirm_address_screen.dart';
import 'package:mus_greet/pages/age/age_registration_page.dart';
import 'package:mus_greet/pages/final/nearly_finished_page.dart';
import 'package:mus_greet/pages/otp/components/parent_email_verification_view.dart';

//import '../../main.dart';

class AddressVerificationView extends StatefulWidget {
  @override
  _AddressVerificationViewState createState() => _AddressVerificationViewState();
}

class _AddressVerificationViewState extends State<AddressVerificationView> {
  List<Users> users;
  AgeRegistrationArgumentClass args;
  Users sessionUser;

  @override
  Widget build(BuildContext context) {
    print('inside address build');
    SizeConfig().init(context);
    args = ModalRoute.of(context).settings.arguments as AgeRegistrationArgumentClass;
    sessionUser = args.sessionUser;
    print(sessionUser);
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
        //padding: EdgeInsets.only(left: 30, right: 30),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.05),
            MaterialButton(
              onPressed: () {},
              color: Colors.green[800],
              textColor: Colors.white,
              child: Icon(
                Icons.home,
                size: 40,
              ),
              padding: EdgeInsets.all(16),
              shape: CircleBorder(),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            Text(
              'Verify your Address',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Use current location only if you are at home',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                  // Text(
                  //   'Use current location only if you are at home',
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(
                  //       fontSize: 15.0,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.black),
                  // ),
                ],
              ),
            ),
            RaisedButton(
              padding: EdgeInsets.symmetric(horizontal: 52, vertical: 22),
              child: Text(
                'Use my current location',
                style: TextStyle(
                  color: Colors.green[800],
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  )),
              onPressed: () {},
            ),
            // Container(
            //   alignment: Alignment.centerLeft,
            //   padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: <Widget>[
            //       Text(
            //         'Use current location only if you are at home',
            //         //textAlign: TextAlign.center,
            //         style: TextStyle(
            //             fontSize: 12.0,
            //             fontWeight: FontWeight.normal,
            //             color: Colors.grey),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Let's connect with the right community",
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 7),
                  Icon(
                    Icons.info_sharp,
                    color: Colors.grey,
                    size: 18.0,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: TextFormField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  prefixIcon: Icon(
                    Icons.location_on,
                    color: Colors.grey,
                  ),
                  labelText: '34, Default Street, London E6 1PJ',
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            Container(
              padding: EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity, // <-- match_parent
                child:  RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  child: Text(
                    'Continue',
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
                    updateAddressVerfication();
                    Timer(Duration(seconds: 2),() => _navigateToNextScreen(true));
                    //_navigateToNextScreen(context);
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'If you are not at home, \nwe can send a code to your home address',
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 7),
                  Icon(
                    Icons.info_sharp,
                    color: Colors.grey,
                    size: 18.0,
                  ),
                ],
              ),
            ),
            // Container(
            //   alignment: Alignment.centerLeft,
            //   padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            //   child: TextFormField(
            //     keyboardType: TextInputType.name,
            //     decoration: InputDecoration(
            //       enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //         borderSide: BorderSide(color: Colors.grey),
            //       ),
            //       prefixIcon: Icon(
            //         Icons.location_on,
            //         color: Colors.grey,
            //       ),
            //       labelText: 'Enter your full address',
            //     ),
            //   ),
            // ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity, // <-- match_parent
                child:  RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Text(
                    "Send code to home address",
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
                    //updateUserAddressDetails();
                    // _navigateToNextScreen(context);
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (context) => ConfirmAddressScreen()));
                    Timer(Duration(seconds: 2),() => _navigateToNextScreen(false));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateAddressVerfication()  async {
    try {
      if (sessionUser != null) {
        final updatedItem = sessionUser.copyWith(
            house_number: "34",
            street: "Default Street",
            country: "United Kingdom",
            city: "London",
            postcode: "E6 1PJ",
            address_verification_mode: "Auto",
            address_verification: true);
        await Amplify.DataStore.save(updatedItem);
        sessionUser = updatedItem;
      }
    }
    catch(e) {
      print(e.message);
    }
  }

  void _navigateToNextScreen(bool auto) {
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => NearlyFinishedPage()));

    if (auto) {
      Navigation.intentWithData(context, AppRoutes.NEARLYFINISHED,AddressVerificationArgumentClass(sessionUser));
    } else {
      Navigation.intentWithData(context, AppRoutes.MANUALADDRESS1,AddressVerificationArgumentClass(sessionUser));
    }
  }
}

class AddressVerificationArgumentClass {
  final Users sessionUser;
  AddressVerificationArgumentClass(this.sessionUser);
}