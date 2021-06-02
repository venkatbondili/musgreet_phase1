import 'package:flutter/material.dart';


/// for styling the tab bar text
class TabStyleWidget extends StatelessWidget {
  final String text;

  TabStyleWidget({ this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Text(
        text,
      ),
    );
  }
}
