import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/size_config.dart';

import 'components/parent_email_verification_view.dart';

class ParentVerificationCodeScreen extends StatelessWidget {
  static String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ParentEmailVerificationView(),
    );
  }
}
