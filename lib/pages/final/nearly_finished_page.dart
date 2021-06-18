

import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/models/UserProfile.dart';
import 'package:mus_greet/pages/languages_screen/select_languages.dart';
import 'package:mus_greet/pages/parent/parent_verification.dart';
//import 'package:mus_greet/pages/parent/parent_verification.dart';
import 'package:mus_greet/pages/smile/time_to_smile_page.dart';


class NearlyFinishedPage extends StatefulWidget {
  @override
  _NearlyFinishedPageState createState() => _NearlyFinishedPageState();
}

class _NearlyFinishedPageState extends State<NearlyFinishedPage> {

  @override
  Widget build(BuildContext context) {
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
}

void _navigateToNextScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => TimeToSmilePage()));
}

bool checked = true;
List<UserProfile> userProfile;
List<String> _list=[];
bool intrest=null;
bool revert=null;
int _selectedislamIntrest = 0;
int _selectedRevert=0;
int _selectedSect=0;
String sect;

List<DropdownMenuItem<int>> islamIntrest = [];
List<DropdownMenuItem<int>> revertIntrest = [];
List<DropdownMenuItem<int>> SectIntrest = [];

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

void updateUserProfile() async{
  final updatedItem = userProfile[0].copyWith(
      languages_spoken: "" ,
      sect: sect,
      are_you_revert: revert,
      islam_interest: intrest);

      await Amplify.DataStore.save(updatedItem);
}

Future<void> userProfileData()
async {
  userProfile = await Amplify.DataStore.query(UserProfile.classType,where: UserProfile.ID.eq("0263d01c-1250-4541-826d-8d63f96cf8c0"));
  String link='himaja,Anjali';
  var a=link.split(",");
  _list=a;
  print(userProfile[0].languages_spoken);
  //print(languages);
  print("print the languages");
}


Widget _buildContent(context) {
  //userDetails();
  userProfileData();
  loadIslamIntrest();
  loadSectIntrest();
  loadRevertIntrest();
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
                    SizedBox(width :190.0),
                     GestureDetector(
                       onTap: ()
                         {
                           Navigator.of(context)
                               .push(MaterialPageRoute(builder: (context) => LanguagesScreen()));
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
                         _list.join(","),
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
      _navigateToNextScreen(context);
    },
  ),
        ),
      ),
    ],
  ));

}









