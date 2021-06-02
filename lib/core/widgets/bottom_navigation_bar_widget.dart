import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:preload_page_view/preload_page_view.dart';


/// This will return the Navigation bar on Home
class BottomNavigationBarWidget extends StatefulWidget {
  final PageController controller;

  BottomNavigationBarWidget({this.controller});

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: _getIcons(ImageConstants.IC_HOME), label: AppTexts.HOME_TEXT),
        BottomNavigationBarItem(
            icon: _getIcons(ImageConstants.IC_MOSQUE),
            label: AppTexts.MOSQUE_TEXT),
        BottomNavigationBarItem(
            icon: _getIcons(ImageConstants.IC_CREATE),
            label: AppTexts.CREATE_TEXT),
        BottomNavigationBarItem(
          icon: _getIcons(ImageConstants.IC_NOTIFICATION),
          label: AppTexts.MESSAGE_TEXT,
        ),
        BottomNavigationBarItem(
          icon: _getIcons(ImageConstants.IC_PROFILE),
          label: AppTexts.PROFILE_TEXT,
        ),
      ],
      currentIndex: _currentIndex,
      backgroundColor: AppColors.white,
      elevation: 10,
      type: BottomNavigationBarType.fixed,
      //fixedColor: AppColors.black,
      selectedItemColor: AppColors.green,
      unselectedItemColor: AppColors.black,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.green,
      ),

      unselectedLabelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      onTap: (index) {
        setState(
          () {
            _currentIndex = index;
            widget.controller.jumpToPage(index);
          },
        );
      },
    );
  }

  ///this will return Navigation bar icons
  _getIcons(String image) {
    return Padding(
      padding: EdgeInsets.only(bottom: 3),
      child: Image.asset(
        image,
        width: 25,
        height: 25,
      ),
    );
  }
}
