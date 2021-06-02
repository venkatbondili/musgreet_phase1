import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/size_config.dart';
import 'package:mus_greet/pages/final/nearly_finished_page.dart';

class ConfirmAddress2View extends StatelessWidget {
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
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'Street no',
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.01),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                height: 60.0,
                child: TextFormField(
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
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                height: 60.0,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelText: 'Country',
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
        .push(MaterialPageRoute(builder: (context) => NearlyFinishedPage()));
  }
}
