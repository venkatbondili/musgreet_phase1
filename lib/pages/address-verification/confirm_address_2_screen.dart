import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/size_config.dart';

import 'confirm_address_2_view.dart';

class ConfirmAddress2Screen extends StatelessWidget {
  static String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ConfirmAddress2View(),
    );
  }
}
