import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/size_config.dart';

import 'components/phone_verification_view.dart';

class PhoneVerificationScreen extends StatelessWidget {
  static String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: PhoneVerificationView(),
    );
  }
}
