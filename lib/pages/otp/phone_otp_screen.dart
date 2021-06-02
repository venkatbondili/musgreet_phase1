import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/size_config.dart';

import 'components/phone_otp_view.dart';

class PhoneOtpScreen extends StatelessWidget {
  static String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: PhoneOtpView(),
    );
  }
}
