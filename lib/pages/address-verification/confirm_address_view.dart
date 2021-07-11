import 'dart:async';

import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/utils/size_config.dart';
import 'package:mus_greet/core/widgets/drop_down_text_field.dart';
import 'package:mus_greet/core/widgets/login_screen_text_field_widget.dart';
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
  var status = false;
  List<String> results = [];
  bool isLoading = false;
  TextEditingController _postCodeController = new TextEditingController();
  Response response;
  var ContainerString;
  String responsetext='Will get response here...';
  var ListOfResponselength =0;
  var ListOfResponse=[];
  var idList = [];
  List<String> addressList =[];
  Map<String,String> AddressMap={};
  var key = "CY82-HB62-CR19-GC96";
  String selectedAddress = "";
  //var postcode = "E62JJ";

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
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            _getPostCodeField(),
            // Container(
            //   alignment: Alignment.centerLeft,
            //   padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            //   child: TextFormField(
            //     controller: _postCodeController,
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
            //       //labelText: 'Enter your PostCode',
            //       labelText: 'Provide your post code here',
            //     ),
            //   ),
            // ),
            SizedBox(height: SizeConfig.screenHeight * 0.02),
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
              onPressed: () {
                getlocation(_postCodeController.text);
              },
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            status ? Container(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: DropDownTextField(
                fieldName: "Select your address",
                data: addressList,
                callBack: (val) {
                  print(val);
                  selectedAddress=val;
                },
              ),
            ):Container(),
            SizedBox(height: SizeConfig.screenHeight * 0.04),
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
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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

  _getPostCodeField() {
    return LoginScreenTextField(
      leadingIcon: ImageConstants.TEMP_LOCATION,
      controller: _postCodeController,
      hintText: "Please enter your post code",
      isPasswordField: false,
    );
  }

  Future getlocation(String postCode) async {
    this.setState(() {
      this.isLoading = true;
    });
    var key = 'CY82-HB62-CR19-GC96';
    try {
      response = await Dio().get('https://api.addressy.com/Capture/Interactive/Find/v1.10/csv.ws?'
          'Key=${key}'
          '&Text=${postCode}');
          //'Key=CY82-HB62-CR19-GC96&Text=e62JJ');
      print(response.runtimeType);
      //await Future.delayed(Duration(seconds: 2));
      //print(response.toString().split(",")[4]);
      print(response);
      ContainerString = response.toString().split(",")[4].split("\n")[1];
      print("Container String");
      ContainerString = ContainerString.replaceAll('\"','');
      print(ContainerString);
      getlocation2(ContainerString,postCode);

    }
    catch (e) {
      print("Error occured: $e");
    }
    finally {
      this.setState(() {
        this.isLoading = false;
        // getlocation2(response.toString().split(",")[4]);
      });
    }
  }

  Future getlocation2(String ContainerString, String postCode) async {
    this.setState(() {
      this.isLoading = true;
    });
    //var key = "CY82-HB62-CR19-GC96";
    //var postcode = "E62JJ";
    print("inside get location2");
    print(ContainerString);
    try {
      final response = await http.Client()
          .get(Uri.parse('https://api.addressy.com/Capture/Interactive/Find/v1.10/csv.ws?'
          'Key=${key}'
          '&Text=${postCode}'
          '&Container=${ContainerString.toString()}'
          '&IsMiddleware=false'
          '&Origin=&'
          '&Countries=GBR&'
          '&Countries=GBR&'
          '&Limit=10&'
          '&Language=en-gb' ));

      ListOfResponse = [];
      idList = [];
      addressList =[];
      print("response body printing");
      ListOfResponselength = response.body.split("\n").length;
      print(ListOfResponselength);
      for(var i = 1;i < ListOfResponselength;i++){
        //print(i);
        ListOfResponse.add(response.body.split("\n")[i]);
        //print(response.body.split("\n")[i]);
      }
      print("List of Response Length");
      print(ListOfResponse.length);
      for(int j=0; j < ListOfResponse.length; j++){
        var id = ListOfResponse[j].split(",")[0];
        var housenumber = ListOfResponse[j].split(",")[2];
        var street = ListOfResponse[j].split(",")[3];
        var address = ListOfResponse[j].split(",")[2] + ListOfResponse[j].split(",")[3];
        //var state = ListOfResponse[j].split(",")[5]+ListOfResponse[j].split(",")[6];
        id = id.replaceAll('\"','');
        address = address.replaceAll('\"','');
        //state = state.replaceAll('\"','');
        //var address =  city + "," + state;
        //var address =  address ;
        idList.add(id);
        addressList.add(address);
        //print(id);
        //print(address);
      }
      print(idList.length);
      print(addressList.length);
      AddressMap ={
        for(int k=0;k<idList.length ;k++)
          idList[k] : addressList[k],
      };
      setState(() {
        status = true;
      });
      // List<String> COLLEGE_CATEGORIES = addressList;


    }
    catch (e) {
      print("Error occured: $e");
    }
    finally {
      // this.setState(() {
      //   this.isLoading = false;
      // });
      print("inside finally block");
    }
  }


  void updateUserDetails()  async{
    //selectedAddress.split(" ");
    var street = "";
    var houseNumber = "";
    var splitedAddress = selectedAddress.split(" ");
    for(int i=0; i<splitedAddress.length;i++){
      if(i == 0){
        houseNumber = splitedAddress[i];
      }
      else{
        street = street +" " + splitedAddress[i];
      }
    }
    print(houseNumber);
    print(street);
    try {
      if (sessionUser != null) {
        final updatedItem = sessionUser.copyWith(
            house_number: houseNumber,
            street: street,
            country: "United Kingodm",
            city: "London",
            postcode: _postCodeController.text,
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