import 'dart:async';

import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/utils/size_config.dart';
import 'package:mus_greet/models/Users.dart';
import 'package:mus_greet/pages/address-verification/confirm_address_2_screen.dart';
import 'package:mus_greet/pages/final/nearly_finished_page.dart';

import 'address_verification_view.dart';

class ConfirmAddressView extends StatefulWidget {
  @override
  _ConfirmAddressViewState createState() => _ConfirmAddressViewState();
}

class _ConfirmAddressViewState extends State<ConfirmAddressView> {
  List<Users> users;

  AddressVerificationArgumentClass args;
  Users sessionUser;

  @override
  Widget build(BuildContext context) {

    args = ModalRoute.of(context).settings.arguments as AddressVerificationArgumentClass;
    sessionUser = args.sessionUser;

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
        padding: EdgeInsets.only(left: 30, right: 30),
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
              'Confirm your Address',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.04),
            RaisedButton(
              padding: EdgeInsets.symmetric(horizontal: 110, vertical: 22),
              child: Text(
                'Search',
                style: TextStyle(
                  color: Colors.green[800],
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.green[800]),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  )),
              onPressed: () {},
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.04),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Enter your post code',
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
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
                  //labelText: 'Enter your PostCode',
                  labelText: 'Flat 12, Federick Street, London LU2 7QU',
                ),
              ),
            ),
            // Container(
            //   //padding: EdgeInsets.all(20.0),
            //   padding: const EdgeInsets.only(top: 30.0, right: 220.0),
            //   child: Text(
            //     "House no",
            //     style: TextStyle(
            //         fontSize: 14,
            //         fontFamily: FontConstants.FONT,
            //         fontWeight: FontWeight.bold,
            //         color: AppColors.black),
            //   ),
            // ),
            // Container(
            //   //padding: EdgeInsets.all(20.0),
            //   padding: const EdgeInsets.only(top: 10.0, right: 220.0),
            //   child: Text(
            //     "Street no",
            //     style: TextStyle(
            //         fontSize: 14,
            //         fontFamily: FontConstants.FONT,
            //         fontWeight: FontWeight.bold,
            //         color: AppColors.black),
            //   ),
            // ),
            // Container(
            //   //padding: EdgeInsets.all(20.0),
            //   padding: const EdgeInsets.only(top: 10.0, right: 220.0),
            //   child: Text(
            //     "City",
            //     style: TextStyle(
            //         fontSize: 14,
            //         fontFamily: FontConstants.FONT,
            //         fontWeight: FontWeight.bold,
            //         color: AppColors.black),
            //   ),
            // ),
            // Container(
            //   //padding: EdgeInsets.all(20.0),
            //   padding: const EdgeInsets.only(top: 10.0, right: 220.0),
            //   child: Text(
            //     "Postcode",
            //     style: TextStyle(
            //         fontSize: 14,
            //         fontFamily: FontConstants.FONT,
            //         fontWeight: FontWeight.bold,
            //         color: AppColors.black),
            //   ),
            // ),
            // Container(
            //   //padding: EdgeInsets.all(20.0),
            //   padding: const EdgeInsets.only(top: 10.0, right: 220.0),
            //   child: Text(
            //     "Country",
            //     style: TextStyle(
            //         fontSize: 14,
            //         fontFamily: FontConstants.FONT,
            //         fontWeight: FontWeight.bold,
            //         color: AppColors.black),
            //   ),
            // ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity, // <-- match_parent
                child:  RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  child: Text(
                    'Send code to Address',
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
                    updateUserDetails();
                    Timer(Duration(seconds: 2),() => _navigateToNextScreen(true));
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (context) => NearlyFinishedPage()));;
                  },
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.01),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Can't find your address?",
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                  /*SizedBox(width: 3),
                    Icon(
                      Icons.info_sharp,
                      color: Colors.grey,
                    ),*/
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
            //SizedBox(height: SizeConfig.screenHeight * 0.01),
            Container(
              padding: EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity, // <-- match_parent
                child:  RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  child: Text(
                    'Enter your full address',
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
                    Timer(Duration(seconds: 2),() => _navigateToNextScreen(false));
                   // _navigateToNextScreen(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateUserDetails()  async{
    try {
      if (sessionUser != null) {
        final updatedItem = sessionUser.copyWith(
            house_number: "Flat 12",
            street: "Federick Street",
            country: "United Kingodm",
            city: "London",
            postcode: "LU2 7QU",
            address_verification_mode: "Manual",
            manual_address_taken_date: new TemporalDate(DateTime.now()),
            manul_address_code:123355,
            manual_address_code_sent_date:new TemporalDate(DateTime.now()),
            address_verification: false);

        await Amplify.DataStore.save(updatedItem);
        sessionUser = updatedItem;
      }
    }
    catch(e) {
      print(e.message);
    }
  }

  void _navigateToNextScreen(bool Status) {
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => ConfirmAddress2Screen()));
    if (Status) {
      Navigation.intentWithData(context, AppRoutes.MANUALADDRESSOTP,AddressVerificationArgumentClass(sessionUser));
    } else {
      Navigation.intentWithData(context, AppRoutes.MANUALADDRESS2,ConfirmAddress1ArgumentClass(sessionUser));
    }
  }

}

class ConfirmAddress1ArgumentClass {
  final Users sessionUser;
  ConfirmAddress1ArgumentClass(this.sessionUser);
}

// class AddressVerificationArgumentClass {
//   final Users sessionUser;
//   AddressVerificationArgumentClass(this.sessionUser);
// }