import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _getBody(),
      ),
    );
  }

  //body of splash screen
  Widget _getBody() {
    final paint = Paint();
    paint.color = Colors.amber;
    return Container(
      // color: AppColors.dark_grey,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[800],
      ),
      // padding: EdgeInsets.only(left: 20),
      child: ShowUpAnimationWidget(
        delay: 500,
        child: RichText(
          text: TextSpan(
            text: AppTexts.MUS_TEXT,
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
            children: <TextSpan>[
              TextSpan(
                  text: AppTexts.GREET_TEXT,
                  style: TextStyle(
                      fontSize: 34,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.white)),
            ],
          ),
        ),
        callBack: () {
          Navigation.intentWithClearAllRoutes(context, AppRoutes.HOME);
        },
      ),
    );
  }

  void dispose() {
    super.dispose();
  }
}


/// CLass Used for animating the text. After animation completed its gives callBack and Navigate to home.
class ShowUpAnimationWidget extends StatefulWidget {
  final Widget child;
  final int delay;
  final Function callBack;

  ShowUpAnimationWidget({@required this.child, this.delay, this.callBack});

  @override
  _ShowUpAnimationWidgetState createState() => _ShowUpAnimationWidgetState();
}

class _ShowUpAnimationWidgetState extends State<ShowUpAnimationWidget>
    with TickerProviderStateMixin {
  AnimationController _animController;
  Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    _animOffset =
        Tween<Offset>(begin: const Offset(0.0, 0.35), end: Offset.zero)
            .animate(curve);
    if (widget.callBack != null) {
      _animController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.callBack();
        }
      });
    }
    if (widget.delay == null) {
      _animController.forward();
    } else {
      Timer(Duration(milliseconds: widget.delay), () {
        _animController.forward();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _animController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
      opacity: _animController,
    );
  }
}
