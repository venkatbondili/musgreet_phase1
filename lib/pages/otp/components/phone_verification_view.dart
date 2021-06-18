import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/size_config.dart';
import 'package:mus_greet/models/Users.dart';
//import 'package:musgreet/constants.dart';
//import 'package:musgreet/size_config.dart';
//import 'package:international_phone_input/international_phone_input.dart';
import 'package:mus_greet/pages/otp/phone_otp_screen.dart';

class PhoneVerificationView extends StatefulWidget {
  @override
  _PhoneVerificationViewState createState() => _PhoneVerificationViewState();
}

class _PhoneVerificationViewState extends State<PhoneVerificationView> {
  List<Users> users;
  String phoneNumber;
  String phoneIsoCode;
  bool visible = false;
  String confirmedNumber = '';
  TextEditingController controller_phone=new TextEditingController();

  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    print(number);
    setState(() {
      phoneNumber = number;
      phoneIsoCode = isoCode;
    });
  }

  onValidPhoneNumber(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      visible = true;
      confirmedNumber = internationalizedPhoneNumber;
    });
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => PhoneOtpScreen()));
  }

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
              SizedBox(height: SizeConfig.screenHeight * 0.05),
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
              SizedBox(height: SizeConfig.screenHeight * 0.07),
              MaterialButton(
                onPressed: () {},
                color: Colors.green[800],
                textColor: Colors.white,
                child: Icon(
                  Icons.phone_android,
                  size: 40,
                ),
                padding: EdgeInsets.all(16),
                shape: CircleBorder(),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                'Verify your number',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Text(
                'We will send a one time password to\n your mobile number',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.07),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              //color: Colors.blue,
              //padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                  Text(
                    'Enter your Number',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                    SizedBox(width: 7),
                    Icon(
                      Icons.info_sharp,
                      color: Colors.grey,
                      size: 18.0,
                    ),
              ]
                ),
            ),
          ),
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: TextFormField(
                  controller:controller_phone,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    prefixIcon: Row(
                      children: [
                        SizedBox(width: SizeConfig.screenHeight * 0.02),
                        new Container(
                          width: 30,
                          height: 20,
                          decoration: new BoxDecoration(
                              color: Color(0xfff5f5f5)
                          ),
                          child: Image.asset(
                            'assets/images/UK.png',
                          ),
                        ),
                        SizedBox(width: SizeConfig.screenHeight * 0.01),
                        Text("+44",
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              color: Color(0xff1d1d1d),
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.normal,
                            )
                        )
                      ],
                    ),
                    labelText: 'Mobile number',
                  ),
                ),
              ),
             //InternationalPhoneInput(
                //decoration: InputDecoration(
                  ////hintText: '(416) 123-4567',
                  //enabledBorder: OutlineInputBorder(
                   // borderRadius: BorderRadius.all(Radius.circular(10.0)),
                   // borderSide: BorderSide(color: Colors.grey),
                 // ),
                //),
                //onPhoneNumberChange: onPhoneNumberChange,
                //initialPhoneNumber: phoneNumber,
                //initialSelection: '+44',
                //enabledCountries: ['+44'],
                //labelText: "Phone Number",
                //showCountryCodes: false,
              //),
              SizedBox(height: SizeConfig.screenHeight * 0.10),
              Container(
                padding: EdgeInsets.all(20.0),
                child:SizedBox(
                    width: double.infinity, // <-- match_parent
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 7),
                      child: Text(
                        'Send Code',
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
                        updatePhoneNumber();
                        print(controller_phone.text);
                        print("enter the phone number");

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

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.07),
        Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(seconds: 600),
          builder: (_, value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
      ],
    );
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

  void updatePhoneNumber()  async{

    final updatedItem = users[0].copyWith(
        phone: controller_phone.text);
    await Amplify.DataStore.save(updatedItem);
  }
}
