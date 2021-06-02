import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/size_config.dart';

import 'address_verification_view.dart';

class AddressVerificationScreen extends StatelessWidget {
  static String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: AddressVerificationView(),
    );
  }
}
