import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/size_config.dart';
import 'package:mus_greet/models/Users.dart';
import 'package:mus_greet/pages/address-verification/confirm_address_2_screen.dart';
import 'package:mus_greet/pages/final/nearly_finished_page.dart';

class ConfirmAddressView extends StatelessWidget {
  List<Users> users;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //SizedBox(height: SizeConfig.screenHeight * 0.05),
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
                      'Select your address above button',
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
                    labelText: 'Enter your PostCode',
                  ),
                ),
              ),
              Container(
                //padding: EdgeInsets.all(20.0),
                padding: const EdgeInsets.only(top: 30.0, right: 220.0),
                child: Text(
                  "House no",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontConstants.FONT,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                ),
              ),
              Container(
                //padding: EdgeInsets.all(20.0),
                padding: const EdgeInsets.only(top: 10.0, right: 220.0),
                child: Text(
                  "Street no",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontConstants.FONT,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                ),
              ),
              Container(
                //padding: EdgeInsets.all(20.0),
                padding: const EdgeInsets.only(top: 10.0, right: 220.0),
                child: Text(
                  "City",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontConstants.FONT,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                ),
              ),
              Container(
                //padding: EdgeInsets.all(20.0),
                padding: const EdgeInsets.only(top: 10.0, right: 220.0),
                child: Text(
                  "Postcode",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontConstants.FONT,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                ),
              ),
              Container(
                //padding: EdgeInsets.all(20.0),
                padding: const EdgeInsets.only(top: 10.0, right: 220.0),
                child: Text(
                  "Country",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: FontConstants.FONT,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: SizedBox(
                  width: double.infinity, // <-- match_parent
                  child:  RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                    child: Text(
                      'Send code to any Address',
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
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => NearlyFinishedPage()));;
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
                    labelText: 'Enter your full address',
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.01),
              Container(
                padding: EdgeInsets.all(20.0),
                child: SizedBox(
                  width: double.infinity, // <-- match_parent
                  child:  RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                    child: Text(
                      'Verify and Continue',
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
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ConfirmAddress2Screen()));
  }

  void updateUserDetails()  async{
    final updatedItem = users[0].copyWith(
        house_number: "Flat 12",
        street: "Federick Street",
        country: "United Kingodm",
        city: "England",
        postcode: "LU2 7QU",
        address_verification_mode: "Manual",
        manul_address_code:123355,
        //manual_address_code_sent_date:"",
        //manual_address_taken_date:,
        address_verification: false);
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
}
