import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/size_config.dart';
import 'package:mus_greet/pages/address-verification/confirm_address_2_screen.dart';
import 'package:mus_greet/pages/home/home.dart';

class CommunityPromisePage extends StatelessWidget {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(context),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildContent(BuildContext context) {
  bool checked = false;
      return Center(
          child: SingleChildScrollView(
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
                  SizedBox(height: 10.0),
                  Text(
                    'Community promise',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12.0),
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                    margin: EdgeInsets.symmetric(horizontal: 34, vertical: 7),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.green[800]),
                      borderRadius: const BorderRadius.all(const Radius.circular(7))
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Be helpful                                                                                ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[800]),
                        ),
                        SizedBox(height: 8.0),
                        Text('Share this space in a constructive way. Be kind,\n'
                              'not judgemental in your conversations.                                                                              ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  //SizedBox(height: 2.0),
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                    margin: EdgeInsets.symmetric(horizontal: 34, vertical: 7),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.green[800]),
                        borderRadius: const BorderRadius.all(const Radius.circular(7))

                    ),
                    child: Column(
                      children: [
                        Text(
                          'Be respectful                                                                                ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[800]),
                        ),
                        SizedBox(height: 8.0),
                        Text('You\'re speaking to your real neighbours. Strong\n'
                              'communities are built on strong relationships.                                                                             ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  //SizedBox(height: 2.0),
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                    margin: EdgeInsets.symmetric(horizontal: 34, vertical: 7),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.green[800]),
                        borderRadius: const BorderRadius.all(const Radius.circular(7))
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Do not discriminate                                                                                ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[800]),
                        ),
                        SizedBox(height: 8.0),
                        Text('We do not tolerate racism, hateful language or\n'
                            'discrimination of any kind.                                                                             ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  //SizedBox(height: 2.0),
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                    margin: EdgeInsets.symmetric(horizontal: 34, vertical: 7),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.green[800]),
                        borderRadius: const BorderRadius.all(const Radius.circular(7))
                    ),
                    child: Column(
                      children: [
                        Text(
                          'No to harmful activities                                                                                ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[800]),
                        ),
                        SizedBox(height: 8.0),
                        Text('We prohibit any activity that could hurt someone\n'
                            'from bullying to scams to physical harm.                                                                             ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                    child: Row(
                      children: <Widget>[
                          Checkbox(
                            checkColor: Colors.grey,
                            activeColor: Colors.white,
                            value: checked,
                            onChanged: (bool value) {
                              //checked = value;
                            },
                          ),
                          Align(
                            child: RichText(
                              text: TextSpan(
                                text: "I agree to treat everyone in mus greet community\n"
                                    "with respect. ",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Read community guidelines",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.green[800],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                      ],
                    ),
                  ),
                  //SizedBox(height: 2.0),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: SizedBox(
                        width: double.infinity, // <-- match_parent
                        child: RaisedButton(
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 1),
                          child: Text(
                            'Go to my community',
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
                ]
            ),
          )
      );
    }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Home()));
  }
}
