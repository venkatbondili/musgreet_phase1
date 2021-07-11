

import 'dart:convert';

import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/models/UserProfile.dart';
import 'package:mus_greet/models/Users.dart';
import 'package:mus_greet/pages/address-verification/address_verification_view.dart';
import 'package:mus_greet/pages/languages_screen/select_languages.dart';
import 'package:mus_greet/pages/parent/parent_verification.dart';
//import 'package:mus_greet/pages/parent/parent_verification.dart';
import 'package:mus_greet/pages/smile/time_to_smile_page.dart';


class NearlyFinishedPage extends StatefulWidget {
  @override
  _NearlyFinishedPageState createState() => _NearlyFinishedPageState();
}

class _NearlyFinishedPageState extends State<NearlyFinishedPage> {

  AddressVerificationArgumentClass args;
  Users sessionUser;

  bool checked = true;
  List<UserProfile> userProfile;
  List<String> _list=[];
  bool intrest= true;
  bool revert= true;
  int _selectedislamIntrest = 0;
  int _selectedRevert=0;
  int _selectedSect=0;
  String sect = " Sunni" ;

  List<DropdownMenuItem<int>> islamIntrest = [];
  List<DropdownMenuItem<int>> revertIntrest = [];
  List<DropdownMenuItem<int>> SectIntrest = [];

  @override
  Widget build(BuildContext context) {

    args = ModalRoute.of(context).settings.arguments as AddressVerificationArgumentClass;
    sessionUser = args.sessionUser;

    print("enter the session user" +sessionUser.id);

    /*var height = SizeConfig.getHeight(context);
    var width = SizeConfig.getWidth(context);
    double fontSize(double size) {
      return size * width / 414;
    }*/
    //print(height);
    return Scaffold(
      body: buildContent(context),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
    );
  }

  // Widget _buildContent(context) {
  //   //userDetails();
  //   //userProfileData();
  //   loadIslamIntrest();
  //   loadSectIntrest();
  //   loadRevertIntrest();
  //   getUserProfile();
  //
  //   double _verticalPadding = 7;
  //   var isExpanded =true;
  //
  //   return SingleChildScrollView(
  //       child: Column(
  //         //crossAxisAlignment: CrossAxisAlignment.stretch,
  //         //mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           SafeArea(
  //             child: Container(
  //               //color: Colors.amber,
  //               padding: EdgeInsets.all(10.0),
  //               child: Image.asset(
  //                 'assets/images/logo.png',
  //                 width: 100,
  //                 height: 100,
  //               ),
  //             ),
  //           ),
  //           SizedBox(
  //             height: 20.0,
  //           ),
  //           Text(
  //             'Nearly finished',
  //             textAlign: TextAlign.center,
  //             style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
  //           ),
  //           SizedBox(
  //             height: 20.0,
  //           ),
  //           Align(
  //             alignment: Alignment.bottomLeft,
  //             child: Container(
  //               padding: EdgeInsets.symmetric(horizontal: 25, vertical: _verticalPadding),
  //               child: Text(
  //                 'Country of residence',
  //                 textAlign: TextAlign.left,
  //                 style: TextStyle(
  //                     fontSize: 14.0,
  //                     fontWeight: FontWeight.bold,
  //                     color: Colors.black87),
  //               ),
  //             ),
  //           ),
  //           /*SizedBox(
  //           //height: 2.0,
  //         ),*/
  //           Align(
  //             alignment: Alignment.bottomLeft,
  //             child: Container(
  //               padding: EdgeInsets.symmetric(horizontal: 25, vertical: _verticalPadding),
  //               //decoration: BoxDecoration(
  //               // border: Border(
  //               //bottom: BorderSide( //                    <--- bottom side
  //               //color: Colors.black12,
  //               //width: 3.0,
  //               // ),
  //               //),
  //               //),
  //               child: Text(
  //                 'United Kingdom',
  //                 textAlign: TextAlign.left,
  //                 style: TextStyle(
  //                     fontSize: 14.0,
  //                     fontWeight: FontWeight.normal,
  //                     color: Colors.black87),
  //               ),
  //             ),
  //           ),
  //           SizedBox(
  //             height: 2.0,
  //           ),
  //           Align(
  //             alignment: Alignment.bottomLeft,
  //             child: Container(
  //               padding:
  //               EdgeInsets.symmetric(horizontal: 25, vertical: _verticalPadding),
  //               child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Row(
  //                         children:[
  //                           Text(
  //                             'Languages spoken',
  //                             textAlign: TextAlign.left,
  //                             style: TextStyle(
  //                                 fontSize: 14.0,
  //                                 fontWeight: FontWeight.bold,
  //                                 color: Colors.black87),
  //                           ),
  //                           SizedBox(width :190.0),
  //                           GestureDetector(
  //                               onTap: ()
  //                               {
  //                                 // Navigator.of(context)
  //                                 //     .push(MaterialPageRoute(builder: (context) => LanguagesScreen()));
  //                                 print("use session id" +sessionUser.id);
  //                                 Navigator.of(context).push(new MaterialPageRoute(builder: (_)=>new LanguagesScreen(sessionId: sessionUser)),).then((value) => value?_buildContent(context):null);
  //                               },
  //                               child:Image.asset(ImageConstants.IC_EDIT,
  //                                 height: 20,
  //                                 width: 20,)
  //                           )
  //                         ]
  //                     ),
  //                     SizedBox(height:5.0),
  //                     Row(
  //                         children:[
  //                           Text(
  //                             _list.join("."),
  //                             textAlign: TextAlign.left,
  //                             style: TextStyle(
  //                                 fontSize: 14.0,
  //                                 fontWeight: FontWeight.normal,
  //                                 color: Colors.black87),
  //                           ),
  //
  //                         ]
  //                     ),
  //                   ]
  //               ),
  //             ),
  //           ),
  //
  //           /*SizedBox(
  //           //height: 2.0,
  //         ),*/
  //           Container(
  //             padding:
  //             EdgeInsets.symmetric(horizontal: 25, vertical: _verticalPadding),
  //             // child: DropdownButtonFormField(
  //             //   //items: "",
  //             //   //value: _selectedGender,
  //             //   // onChanged: (value) {
  //             //   //   ///*setState(() {
  //             //   //  // _selectedGender = value;
  //             //   //   //}
  //             //   //   //)*/
  //             //   // },
  //             //   isExpanded: true,
  //             //
  //             // ),
  //
  //
  //           ),
  //           SizedBox(
  //             height: 2.0,
  //           ),
  //           Align(
  //             alignment: Alignment.bottomLeft,
  //             child: Container(
  //               padding:
  //               EdgeInsets.symmetric(horizontal: 25, vertical: _verticalPadding),
  //               child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   children: <Widget>[
  //                     Text(
  //                       'Are you interested in islam?',
  //                       textAlign: TextAlign.left,
  //                       style: TextStyle(
  //                           fontSize: 14.0,
  //                           fontWeight: FontWeight.bold,
  //                           color: Colors.black87),
  //                     ),
  //                     SizedBox(width: 7),
  //                     Icon(
  //                       Icons.info_sharp,
  //                       color: Colors.grey,
  //                       size: 18.0,
  //                     ),
  //                   ]),
  //             ),
  //           ),
  //           /*SizedBox(
  //           //height: 2.0,
  //         ),*/
  //           Container(
  //             padding:
  //             EdgeInsets.symmetric(horizontal: 25, vertical: _verticalPadding),
  //             child: DropdownButtonFormField(
  //               items: islamIntrest,
  //               value: _selectedislamIntrest,
  //               onChanged: (value) {
  //                 ///*setState(() {
  //                 if(value==0)
  //                 {
  //                   intrest=true;
  //                 }else
  //                 {
  //                   intrest=false;
  //                 }
  //                 _selectedislamIntrest = value;
  //                 //}
  //                 //)*/
  //               },
  //               isExpanded: true,
  //             ),
  //           ),
  //           SizedBox(
  //             height: 2.0,
  //           ),
  //           Align(
  //             alignment: Alignment.bottomLeft,
  //             child: Container(
  //               padding:
  //               EdgeInsets.symmetric(horizontal: 25, vertical: _verticalPadding),
  //               child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   children: <Widget>[
  //                     Text(
  //                       'Sect',
  //                       textAlign: TextAlign.left,
  //                       style: TextStyle(
  //                           fontSize: 14.0,
  //                           fontWeight: FontWeight.bold,
  //                           color: Colors.black87),
  //                     ),
  //                     SizedBox(width: 7),
  //                     Icon(
  //                       Icons.info_sharp,
  //                       color: Colors.grey,
  //                       size: 18.0,
  //                     ),
  //                   ]),
  //             ),
  //           ),
  //           /*SizedBox(
  //           //height: 2.0,
  //         ),*/
  //           Container(
  //             padding:
  //             EdgeInsets.symmetric(horizontal: 25, vertical: _verticalPadding),
  //             child: DropdownButtonFormField(
  //               items: SectIntrest,
  //               value: _selectedSect,
  //               onChanged: (value) {
  //                 ///*setState(() {
  //                 if(value==0)
  //                 {
  //                   sect="Sunni";
  //                 }else if(value==1)
  //                 {
  //                   sect="Shia";
  //                 }else
  //                 {
  //                   sect="Others";
  //                 }
  //                 _selectedSect = value;
  //                 //}
  //                 //)*/
  //               },
  //               isExpanded: true,
  //             ),
  //           ),
  //           SizedBox(
  //             height: 2.0,
  //           ),
  //           Align(
  //             alignment: Alignment.bottomLeft,
  //             child: Container(
  //               padding:
  //               EdgeInsets.symmetric(horizontal: 25, vertical: _verticalPadding),
  //               child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   children: <Widget>[
  //                     Text(
  //                       'Are you a revert?',
  //                       textAlign: TextAlign.left,
  //                       style: TextStyle(
  //                           fontSize: 14.0,
  //                           fontWeight: FontWeight.bold,
  //                           color: Colors.black87),
  //                     ),
  //                     SizedBox(width: 7),
  //                     Icon(
  //                       Icons.info_sharp,
  //                       color: Colors.grey,
  //                       size: 18.0,
  //                     ),
  //                   ]),
  //             ),
  //           ),
  //           /*SizedBox(
  //           //height: 2.0,
  //         ),*/
  //           Container(
  //             padding:
  //             EdgeInsets.symmetric(horizontal: 25, vertical: _verticalPadding),
  //             child: DropdownButtonFormField(
  //               items: revertIntrest,
  //               value: _selectedRevert,
  //               onChanged: (value) {
  //                 ///*setState(() {
  //                 if(value==0)
  //                 {
  //                   revert=true;
  //                 }else
  //                 {
  //                   revert=false;
  //                 }
  //                 _selectedRevert = value;
  //                 //}
  //                 //)*/
  //               },
  //               isExpanded: true,
  //             ),
  //           ),
  //           SizedBox(
  //             height: 7.0,
  //           ),
  //           Container(
  //             padding: EdgeInsets.all(20.0),
  //             child: SizedBox(
  //               width: double.infinity, // <-- match_parent
  //               child: RaisedButton(
  //                 padding:
  //                 EdgeInsets.symmetric(horizontal: 50, vertical: _verticalPadding),
  //                 child: Text(
  //                   'Continue',
  //                   style: TextStyle(
  //                     color: Colors.white,
  //                     fontSize: 15.0,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //                 color: Colors.green[800],
  //                 shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.all(
  //                       Radius.circular(8.0),
  //                     )),
  //                 onPressed: () {
  //                   if(_list.isEmpty) {
  //                     createUserProfile();
  //                   }else
  //                     {
  //                       updateUserProfile();
  //                     }
  //                   _navigateToNextScreen(context);
  //                 },
  //               ),
  //             ),
  //           ),
  //         ],
  //       ));
  //
  // }


  @override
  Widget buildContent(BuildContext context) {
    print("inside the build context");

    //print(widget.userProfile);
    return FutureBuilder<List<UserProfile>>(
      future: getUserProfile(),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            userProfile = snapshot.data;
            return buildUi(userProfile);
          default:
            return _buildLoadingScreen();
        }
      },
    );
  }

  Widget _buildLoadingScreen() {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(),
      ),
    );
  }

  buildUi(List<UserProfile> userProfile)
  {
    loadIslamIntrest();
    loadSectIntrest();
    loadRevertIntrest();
    // getUserProfile();

    double _verticalPadding = 7;
    var isExpanded =true;

    return SingleChildScrollView(
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
              height: 20.0,
            ),
            Text(
              'Nearly finished',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: _verticalPadding),
                child: Text(
                  'Country of residence',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ),
            ),
            /*SizedBox(
            //height: 2.0,
          ),*/
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: _verticalPadding),
                //decoration: BoxDecoration(
                // border: Border(
                //bottom: BorderSide( //                    <--- bottom side
                //color: Colors.black12,
                //width: 3.0,
                // ),
                //),
                //),
                child: Text(
                  'United Kingdom',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87),
                ),
              ),
            ),
            SizedBox(
              height: 2.0,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding:
                EdgeInsets.symmetric(horizontal: 25, vertical: _verticalPadding),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          children:[
                            Text(
                              'Languages spoken',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                            SizedBox(width :150.0),
                            GestureDetector(
                                onTap: ()
                                {
                                  // Navigator.of(context)
                                  //     .push(MaterialPageRoute(builder: (context) => LanguagesScreen()));
                                  print("use session id" +sessionUser.id);
                                  Navigator.of(context).push(new MaterialPageRoute(builder: (_)=>new LanguagesScreen(sessionId: sessionUser,callingScreen: "NearlyFinished",)),).then((value) => value?build(context):null);
                                },
                                child:Image.asset(ImageConstants.IC_EDIT,
                                  height: 20,
                                  width: 20,)
                            )
                          ]
                      ),
                      SizedBox(height:5.0),
                      Row(
                          children:[
                            Text(
                              _list.join(", "),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black87),
                            ),

                          ]
                      ),
                    ]
                ),
              ),
            ),

            /*SizedBox(
            //height: 2.0,
          ),*/
            Container(
              padding:
              EdgeInsets.symmetric(horizontal: 25, vertical: _verticalPadding),
              // child: DropdownButtonFormField(
              //   //items: "",
              //   //value: _selectedGender,
              //   // onChanged: (value) {
              //   //   ///*setState(() {
              //   //  // _selectedGender = value;
              //   //   //}
              //   //   //)*/
              //   // },
              //   isExpanded: true,
              //
              // ),


            ),
            SizedBox(
              height: 2.0,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding:
                EdgeInsets.symmetric(horizontal: 25, vertical: _verticalPadding),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Are you interested in islam?',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                      SizedBox(width: 7),
                      Icon(
                        Icons.info_sharp,
                        color: Colors.grey,
                        size: 18.0,
                      ),
                    ]),
              ),
            ),
            /*SizedBox(
            //height: 2.0,
          ),*/
            Container(
              padding:
              EdgeInsets.symmetric(horizontal: 25, vertical: _verticalPadding),
              child: DropdownButtonFormField(
                items: islamIntrest,
                value: _selectedislamIntrest,
                onChanged: (value) {
                  ///*setState(() {
                  if(value==0)
                  {
                    intrest=true;
                  }else
                  {
                    intrest=false;
                  }
                  _selectedislamIntrest = value;
                  //}
                  //)*/
                },
                isExpanded: true,
              ),
            ),
            SizedBox(
              height: 2.0,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding:
                EdgeInsets.symmetric(horizontal: 25, vertical: _verticalPadding),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Sect',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                      SizedBox(width: 7),
                      Icon(
                        Icons.info_sharp,
                        color: Colors.grey,
                        size: 18.0,
                      ),
                    ]),
              ),
            ),
            /*SizedBox(
            //height: 2.0,
          ),*/
            Container(
              padding:
              EdgeInsets.symmetric(horizontal: 25, vertical: _verticalPadding),
              child: DropdownButtonFormField(
                items: SectIntrest,
                value: _selectedSect,
                onChanged: (value) {
                  ///*setState(() {
                  if(value==0)
                  {
                    sect="Sunni";
                  }else if(value==1)
                  {
                    sect="Shia";
                  }else
                  {
                    sect="Others";
                  }
                  _selectedSect = value;
                  //}
                  //)*/
                },
                isExpanded: true,
              ),
            ),
            SizedBox(
              height: 2.0,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding:
                EdgeInsets.symmetric(horizontal: 25, vertical: _verticalPadding),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Are you a revert?',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                      SizedBox(width: 7),
                      Icon(
                        Icons.info_sharp,
                        color: Colors.grey,
                        size: 18.0,
                      ),
                    ]),
              ),
            ),
            /*SizedBox(
            //height: 2.0,
          ),*/
            Container(
              padding:
              EdgeInsets.symmetric(horizontal: 25, vertical: _verticalPadding),
              child: DropdownButtonFormField(
                items: revertIntrest,
                value: _selectedRevert,
                onChanged: (value) {
                  ///*setState(() {
                  if(value==0)
                  {
                    revert=true;
                  }else
                  {
                    revert=false;
                  }
                  _selectedRevert = value;
                  //}
                  //)*/
                },
                isExpanded: true,
              ),
            ),
            SizedBox(
              height: 7.0,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity, // <-- match_parent
                child: RaisedButton(
                  padding:
                  EdgeInsets.symmetric(horizontal: 50, vertical: _verticalPadding),
                  child: Text(
                    'Continue',
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
                      updateUserProfile();
                  },
                ),
              ),
            ),
          ],
        ));
  }

  void loadIslamIntrest() {
    islamIntrest = [];
    islamIntrest.add(new DropdownMenuItem(
      child: new Text('True'),
      value: 0,
    ));
    islamIntrest.add(new DropdownMenuItem(
      child: new Text('False'),
      value: 1,
    ));
    //genderList.add(new DropdownMenuItem(
    //child: new Text('Other'),
    // value: 2,
    //));
  }

  void loadRevertIntrest() {
    revertIntrest = [];
    revertIntrest.add(new DropdownMenuItem(
      child: new Text('True'),
      value: 0,
    ));
    revertIntrest.add(new DropdownMenuItem(
      child: new Text('False'),
      value: 1,
    ));
    //genderList.add(new DropdownMenuItem(
    //child: new Text('Other'),
    // value: 2,
    //));
  }

  void loadSectIntrest() {
    SectIntrest = [];
    SectIntrest.add(new DropdownMenuItem(
      child: new Text('Sunni'),
      value: 0,
    ));
    SectIntrest.add(new DropdownMenuItem(
      child: new Text('Shia'),
      value: 1,
    ));
    SectIntrest.add(new DropdownMenuItem(
      child: new Text('Other'),
      value: 2,
    ));
  }


  Future<List<UserProfile>> getUserProfile() async{
    try{
      userProfile = await Amplify.DataStore.query(UserProfile.classType,where: UserProfile.USERSID.eq(sessionUser.id));
      String listLangues=userProfile[0].languages_spoken;
      List<dynamic> languge=jsonDecode(listLangues);
      print(languge);
      var  languageslist=languge.join(",");
      _list=languageslist.split(",");
      print("list of languages");
      print(_list);
      print(userProfile);
      print("list of user profile");
      return userProfile;
    }catch(e)
    {

    }
  }

  void createUserProfile() async {
    try {
      if (sessionUser != null) {
        // userProfile = await Amplify.DataStore.query(UserProfile.classType,where: UserProfile.USERSID.eq(sessionUser.id));


        // Users x = Users(first_name: 'Venkat');
        // UserProfile c = UserProfile(sect: sect, usersID: x.id);

        //if (userProfile != null) {
          final Item = UserProfile(
              usersID: sessionUser.id,
              languages_spoken: "" ,
              sect: sect,
              are_you_revert: revert,
              islam_interest: intrest);
          await Amplify.DataStore.save(Item);
          await Future.delayed(Duration(seconds: 2));

          print('record saved');
          print(sessionUser.id);
        //}
      }
    }
    catch(e) {
      print(e.message);
      print('error nearly finished update');
      print(sessionUser.id);
      print(sect);
      print(revert);
      print(intrest);
    }
  }

  void updateUserProfile() async{
    try {

      print('inside updateUserProfile');
      print(userProfile);

      if (userProfile == null) {
        print('null case');
        final Item = UserProfile(
            usersID: sessionUser.id,
            //languages_spoken: _list.join(",") ,
            sect: sect,
            are_you_revert: revert,
            islam_interest: intrest);
        await Amplify.DataStore.save(Item);

      } else {
        print('edit case');
        final updatedItem = userProfile[0].copyWith(
            usersID: sessionUser.id,
            //languages_spoken: _list.join(",") ,
            sect: sect,
            are_you_revert: revert,
            islam_interest: intrest);

        await Amplify.DataStore.save(updatedItem);
        await Future.delayed(Duration(seconds: 1));
      }

      _navigateToNextScreen(context);

    } catch(e) {
      print('Exception in updateUserProfile $e');

    }

  }

  void _navigateToNextScreen(BuildContext context) {
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => TimeToSmilePage()));
    Navigation.intentWithData(context, AppRoutes.TIMETOSMILE,NearlyFinishedArgumentClass(sessionUser));
  }

}

class NearlyFinishedArgumentClass {
  final Users sessionUser;
  NearlyFinishedArgumentClass(this.sessionUser);
}











