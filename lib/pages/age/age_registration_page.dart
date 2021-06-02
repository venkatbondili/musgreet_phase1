import 'package:flutter/material.dart';
import 'package:mus_greet/pages/parent/parent_verification.dart';

class AgeRegistrationPage extends StatefulWidget {
  @override
  _AgeRegistrationPageState createState() => _AgeRegistrationPageState();
}

class _AgeRegistrationPageState extends State<AgeRegistrationPage> {
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
      .push(MaterialPageRoute(builder: (context) => ParentVerificationPage()));
}

bool checked = true;

int _selectedGender = 0;

List<DropdownMenuItem<int>> genderList = [];

void loadGenderList() {
  genderList = [];
  genderList.add(new DropdownMenuItem(
    child: new Text('Male'),
    value: 0,
  ));
  genderList.add(new DropdownMenuItem(
    child: new Text('Female'),
    value: 1,
  ));
  //genderList.add(new DropdownMenuItem(
    //child: new Text('Other'),
   // value: 2,
  //));
}

Widget _buildContent(context) {
  loadGenderList();
  return Center(
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
            height: 40.0,
          ),
          Text(
            'Registration',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            child: Text(
              'Please note that if you are under 16, you will be\n '
                  'required to get your account verified by a\n '
                  'parent or guardian',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'How old are you?',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.black87),
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
          /*SizedBox(
            //height: 2.0,
          ),*/
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                //border: Border.all(1.0),
                /*prefixIcon: Icon(
                  Icons.person,
                  color: Colors.green[800],
                ),*/
                labelText: 'Age',
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7),
              child:Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Choose your gender',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.black87),
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
          /*SizedBox(
            height: 8.0,
          ),*/
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7),
            child: DropdownButtonFormField(
              items: genderList,
              value: _selectedGender,
              onChanged: (value) {
                ///*setState(() {
                  _selectedGender = value;
                //}
                //)*/
              },
              isExpanded: true,
              /*decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
                filled: true,
                contentPadding: EdgeInsets.all(16),
                fillColor: Colors.white24,
              ),*/
            ),
          ),
          SizedBox(
            height: 80.0,
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child:SizedBox(
                width: double.infinity, // <-- match_parent
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 7),
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
                    _navigateToNextScreen(context);
                  },
                ),
            ),
          ),
        ],
      ));
}
