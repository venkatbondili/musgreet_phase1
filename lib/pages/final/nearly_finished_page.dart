import 'package:flutter/material.dart';
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

int _selectedGender = 0;

List<DropdownMenuItem<int>> genderList = [];

void loadList() {
  genderList = [];
  genderList.add(new DropdownMenuItem(
    child: new Text('Select'),
    value: 0,
  ));
  /*genderList.add(new DropdownMenuItem(
    child: new Text('Female'),
    value: 1,
  ));
  genderList.add(new DropdownMenuItem(
    child: new Text('Other'),
    value: 2,
  ));*/
}

Widget _buildContent(context) {
  loadList();
  double _verticalPadding = 7;
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
          child: Text(
            'Languages spoken',
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
      Container(
        padding:
            EdgeInsets.symmetric(horizontal: 25, vertical: _verticalPadding),
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
          items: genderList,
          value: _selectedGender,
          onChanged: (value) {
            ///*setState(() {
            _selectedGender = value;
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
          items: genderList,
          value: _selectedGender,
          onChanged: (value) {
            ///*setState(() {
            _selectedGender = value;
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
          items: genderList,
          value: _selectedGender,
          onChanged: (value) {
            ///*setState(() {
            _selectedGender = value;
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
      _navigateToNextScreen(context);
    },
  ),
        ),
      ),
    ],
  ));
}
