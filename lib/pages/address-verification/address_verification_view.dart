import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/size_config.dart';
import 'package:mus_greet/pages/address-verification/confirm_address_screen.dart';

class AddressVerificationView extends StatelessWidget {
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
                'Verify your Address',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Find me',
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
                    labelText: 'Location',
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Let's connect with the right community",
                      //textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
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
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Use current location only if you are at home',
                      //textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Send me a code',
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
                    labelText: 'Enter your full address',
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "If you are not at home we can send a code to your\n home address",
                      //textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
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
        .push(MaterialPageRoute(builder: (context) => ConfirmAddressScreen()));
  }
}
