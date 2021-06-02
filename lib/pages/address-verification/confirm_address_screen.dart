import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/size_config.dart';
import 'package:mus_greet/core/utils/constants.dart';


import 'confirm_address_view.dart';

class ConfirmAddressScreen extends StatelessWidget {
  static String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ConfirmAddressView(),
    );
  }
}
