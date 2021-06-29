import 'dart:async';

import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/utils/size_config.dart';
import 'package:mus_greet/models/Users.dart';
import 'package:mus_greet/pages/final/nearly_finished_page.dart';

import 'address_verification_view.dart';
import 'confirm_address_view.dart';

class ConfirmAddress2View extends StatefulWidget {
  @override
  _ConfirmAddress2ViewState createState() => _ConfirmAddress2ViewState();
}

class _ConfirmAddress2ViewState extends State<ConfirmAddress2View> {
  List<Users> users;

  final TextEditingController controller_house= TextEditingController();
  final TextEditingController controller_street= TextEditingController();
  final TextEditingController controller_city= TextEditingController();
  final TextEditingController controller_postcode= TextEditingController();
  final TextEditingController controller_country= TextEditingController();

  ConfirmAddress1ArgumentClass args;
  Users sessionUser;

  @override
  Widget build(BuildContext context) {

    args = ModalRoute.of(context).settings.arguments as ConfirmAddress1ArgumentClass;
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
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 2),
              height: 60.0,
              child: TextFormField(
                controller: controller_house,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelText: 'House no',
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.01),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              height: 60.0,
              child: TextFormField(
                controller: controller_street,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelText: 'Street',
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.01),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              height: 60.0,
              child: TextFormField(
                controller: controller_city,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelText: 'City',
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.01),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              height: 60.0,
              child: TextFormField(
                controller: controller_postcode,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelText: 'Postcode',
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.01),
            // Container(
            //   alignment: Alignment.centerLeft,
            //   padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            //   height: 60.0,
            //   child: TextFormField(
            //     controller: controller_country,
            //     keyboardType: TextInputType.name,
            //     decoration: InputDecoration(
            //       enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //         borderSide: BorderSide(color: Colors.grey),
            //       ),
            //       labelText: 'Country',
            //     ),
            //   ),
            // ),
            // SizedBox(height: SizeConfig.screenHeight * 0.01),
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
                    updateUserDetails();
                    Timer(Duration(seconds: 2),() => _navigateToNextScreen(context));
                    //_navigateToNextScreen(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateUserDetails() async {
    try {
      if (sessionUser != null) {
        final updatedItem = sessionUser.copyWith(
            house_number: controller_house.text,
            street: controller_street.text,
            city: controller_city.text,
            postcode: controller_postcode.text,
            country: "United Kingodm",
            address_verification_mode: "Manual",
            manual_address_taken_date: new TemporalDate(DateTime.now()),
            manul_address_code:123355,
            manual_address_code_sent_date:new TemporalDate(DateTime.now()),
            address_verification: false);

            // house_number: "Flat 12",
            // street: "Federick Street",
            // country: "United Kingodm",
            // city: "London",
            // postcode: "LU2 7QU",
            // address_verification_mode: "Manual",
            // manual_address_taken_date: new TemporalDate(DateTime.now()),
            // manul_address_code:123355,
            // //manual_address_code_sent_date:"",
            // address_verification: false);

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
    //     .push(MaterialPageRoute(builder: (context) => NearlyFinishedPage()));
    Navigation.intentWithData(context, AppRoutes.MANUALADDRESSOTP,AddressVerificationArgumentClass(sessionUser));
  }

}

class ConfirmAddress2ArgumentClass {
  final Users sessionUser;
  ConfirmAddress2ArgumentClass(this.sessionUser);
}