import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/models/ModelProvider.dart';
import 'package:mus_greet/pages/create_post_screen/create_post_screen.dart';
import 'package:mus_greet/pages/home_screen/home_screen.dart';
import 'package:mus_greet/pages/mosque_screen/mosque_screen.dart';
import 'package:mus_greet/pages/mosque_screen/mosque_search_list_view/mosque_search_list_view.dart';
import 'package:mus_greet/pages/profile/view_profile_screen/view_profile_screen.dart';
import 'package:preload_page_view/preload_page_view.dart';

class BottomNavigationWidget extends StatefulWidget {
  final PageController controller;
  final String CallingScreen;
  final Function CallingFunction;
  final int index;
  final List<MosqueFollowers> MosqueFollowersList;
  final Users sessionUser;

  BottomNavigationWidget({this.controller, this.CallingFunction, this.index, this.MosqueFollowersList, this.CallingScreen, this.sessionUser});

  @override
  _BottomNavigationWidgetState createState() =>
      _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  List<MosqueFollowers> MosqueFollowersList =[];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    _currentIndex = widget.index;
      return FutureBuilder<List<MosqueFollowers>>(
        future: listMosqueFollowers(),
        builder: (ctx, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              MosqueFollowersList = snapshot.data;
              return _getUI();
            default:
              return _buildLoadingScreen();
          }
        },
      );


  }

  Widget _buildLoadingScreen() {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(),
      ),
    );
  }

  _screenNavigation(int index){
    print(widget.sessionUser.first_name);
    switch (index) {
      case 0:
        //Navigation.intentWithData(context, AppRoutes.HOME,BottomNavigationWidgetArgumentClass(widget.sessionUser));
        //Navigation.intent(context, AppRoutes.HOME);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen(sessionUser:widget.sessionUser)));
        break;
      case 1:
        print("MosqueFollowersList");
        print(MosqueFollowersList.length);
        print(widget.sessionUser.last_name);
        if(MosqueFollowersList.isEmpty){
        Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => MosqueSearchListView(CallingScreen: widget.CallingScreen,sessionUser: widget.sessionUser)));
        }
        else{
          Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => MosqueScreen(CallingScreen: "MosqueDetails",loginUser: widget.sessionUser,),
              )
          );
        }
        //executePending();
        break;
      case 2:
        print(widget.sessionUser.first_name);
      //Navigation.intent(context, AppRoutes.CREATE_POST_SCREEN);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CreatePostScreen(sessionUser:widget.sessionUser)));



        //Navigation.intentWithData(context, AppRoutes.CREATE_POST_SCREEN,BottomNavigationWidgetArgumentClass(widget.sessionUser));
        // Navigator.push(context,
        //     MaterialPageRoute(
        //       builder: (context) => CreatePostScreen(),
        //     )
        // );
        break;
      //case 3:
        //Navigation.intent(context, AppRoutes.VIEW_PROFILE_SCREEN);
        // Navigator.push(context,
        //     MaterialPageRoute(
        //       builder: (context) => ViewProfileScreen(),
        //     )
        // );
       // break;
      case 4:
        Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => ViewProfileScreen(sessionUser: widget.sessionUser),
            )
        );
        //Navigation.intent(context, AppRoutes.VIEW_PROFILE_SCREEN);
        break;
      default:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen(sessionUser:widget.sessionUser)));
          //Navigation.intent(context, AppRoutes.HOME,);
         // Navigation.intentWithData(context, AppRoutes.HOME,BottomNavigationWidgetArgumentClass(widget.sessionUser));

    }
  }

  ///this will return Navigation bar icons
  _getIcons(String image) {
    return Padding(
      padding: EdgeInsets.only(bottom: 3),
      child: GestureDetector(
        onTap: () => {
          widget.CallingFunction,
        },
        child: Image.asset(
          image,
          width: 25,
          height: 25,
        ),
      ),
    );
  }

  Future<List<MosqueFollowers>> listMosqueFollowers() async{
    try {
      MosqueFollowersList = await Amplify.DataStore.query(MosqueFollowers.classType,where:MosqueFollowers.USERSID.eq(widget.sessionUser.id));
      print(MosqueFollowersList);
      return MosqueFollowersList;
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }

  Widget _getUI() {
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
        print("inside navigation index");
        //setState(() {_currentIndex = index;widget.controller.jumpToPage(index);},);
        print("printing index in bottom navigation bar");
        print(index);
        _screenNavigation(index);
      },
    );
  }
}

class BottomNavigationWidgetArgumentClass {
  final Users sessionUser;
  BottomNavigationWidgetArgumentClass(this.sessionUser);
}