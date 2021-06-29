import 'dart:async';

import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/dot_indicator.dart';
import 'package:mus_greet/core/widgets/following_mosque_list_grid.dart';
import 'package:mus_greet/core/widgets/tab_style_widget.dart';
import 'package:mus_greet/models/Facilitiesmaster.dart';
import 'package:mus_greet/models/ModelProvider.dart';
import 'package:mus_greet/models/ModelProvider.dart';
import 'package:mus_greet/models/MosqueFollowers.dart';
import 'package:mus_greet/models/MosqueFollowers.dart';
import 'package:mus_greet/models/MosqueFollowers.dart';
import 'package:mus_greet/pages/home_screen/home_screen.dart';
import 'package:mus_greet/pages/mosque_screen/mosque_details/contact_tab/contect_tab.dart';
import 'package:mus_greet/pages/mosque_screen/mosque_details/facilities_tab/facilities_tab.dart';
import 'package:mus_greet/pages/mosque_screen/mosque_details/home_tab/home_tab.dart';
import 'package:mus_greet/pages/mosque_screen/mosque_screen.dart';
import 'package:mus_greet/pages/mosque_screen/mosque_search_list_view/mosque_search_list_view.dart';
import 'package:mus_greet/core/widgets/bottom_navigation_widget.dart';
import 'package:mus_greet/pages/profile/view_profile_screen/about_tab/about_tab.dart';
import 'package:mus_greet/pages/profile/view_profile_screen/friend_tab/friend_tab.dart';
import 'package:mus_greet/pages/profile/view_profile_screen/interest_tab/interest_tab.dart';

import 'mosque_about_tab/mosque_about_tab.dart';

class MosquesDetailsScreen extends StatefulWidget {
  final Function backCallBack;
  final Mosque MosqueObject;
  final String CallingScreen;
  final bool Status;
  final String UserID;
  final MosqueFollowers MosqueFollowerObject;
  final Users sessionUser;
  const MosquesDetailsScreen({Key key, this.backCallBack, this.MosqueObject, this.CallingScreen, this.Status, this.UserID, this.MosqueFollowerObject, this.sessionUser}) : super(key: key);
  @override
  _MosquesDetailsScreenState createState() => _MosquesDetailsScreenState();
}

class _MosquesDetailsScreenState extends State<MosquesDetailsScreen>
    with SingleTickerProviderStateMixin {

  final _controller = PageController();

  static const _kDuration = const Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  TabController _tabController;

  List<Mosque> mosque = [];
  String mosqueID = "9de478b5-04c7-4074-baf4-2cadf902f594";
  bool status = false;
  //bool status ;
  String CallingScreen = "";
  bool buttonClickEvent = false;
  List<MosqueFollowers> UserMosqueFollowingList = [];
  //List<MosqueFollowers> MosqueFollowers = [];

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);

    super.initState();
  }

  /// For changing the tab properly
  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {

    if(widget.CallingScreen == "MosqueSearch" || widget.CallingScreen == "MosqueScreen"){
      if(buttonClickEvent == false) {
        CallingScreen = widget.CallingScreen;
        mosqueID = widget.MosqueObject.id;
        status = widget.Status;
      }
      if(buttonClickEvent == true){
        CallingScreen = widget.CallingScreen;
        mosqueID = widget.MosqueObject.id;
        status = status;
      }
    }
    return FutureBuilder<List<Mosque>>(
      future: getMosque(),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            mosque = snapshot.data;
            return _getMosqueFollowersUI(mosque);
          default:
            return _buildLoadingScreen();
        }
      },
    );
  }

  _getMosqueFollowersUI(List<Mosque> mosque){
    return FutureBuilder<List<MosqueFollowers>>(
      future: UserMosqueFollowList(),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            UserMosqueFollowingList = snapshot.data;
            return buildUI(mosque);
          default:
            return _buildLoadingScreen();
        }
      },
    );
  }

  _getBody() {
    print("inside the body of main");
    return SingleChildScrollView(
      child: Column(
        children: [
          _getUpperSection(),
          _getTabBar(),
          Center(
            child: [
              HomeTab(mosque: mosque,sessionUser: widget.sessionUser,),
              ContactTab(mosque: mosque),
              MosqueAboutTab(mosque: mosque),
              FacilitiesTab(mosque: mosque),
            ][_tabController.index],
          )
        ],
      ),
    );
  }

  _getUpperSection() {
    return Container(
      child: Column(
        children: [
          Stack(
            children: <Widget>[
              Container(
                color: AppColors.green,
                child: Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        width: MediaQuery.of(context).size.width,
                        height: 200.0),
                    child: PageView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      controller: _controller,
                      itemCount: _pages.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _pages[index];
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: DotsIndicator(
                      controller: _controller,
                      itemCount: _pages.length,
                      onPageSelected: (int page) {
                        _controller.animateToPage(
                          page,
                          duration: _kDuration,
                          curve: _kCurve,
                        );
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 60,
                left: 20,
                child: InkWell(
                  onTap: () {
                    _navigateBack();
                   // Navigation.back(context);
                    //widget.backCallBack();
                  },
                  child: Image.asset(
                    ImageConstants.IC_BACK,
                    height: 20,
                    width: 20,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 8.0),
            color: AppColors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _getMosqueDetails(),
                CustomSpacerWidget(
                  width: 5,
                ),
                Flexible(
                  child: status?_getUnFollowButton():_getFollowButton(),
                ),
                CustomSpacerWidget(
                  width: 28,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// for Rendering the tab bar on screen
  _getTabBar() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.white.withOpacity(0.7),
            AppColors.white,
            AppColors.white,
            AppColors.white,
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 15),
        child: TabBar(
          controller: _tabController,
          labelColor: AppColors.green,
          unselectedLabelColor: AppColors.black_50,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 2, color: AppColors.green),
            insets: EdgeInsets.symmetric(horizontal: 12),
          ),
          tabs: [
            TabStyleWidget(
              text: AppTexts.HOME_TEXT,
            ),
            TabStyleWidget(
              text: AppTexts.CONTACT_TEXT,
            ),
            TabStyleWidget(
              text: AppTexts.ABOUT_TEXT,
            ),
            TabStyleWidget(
              text: AppTexts.FACILITIES_TEXT,
            ),
          ],
        ),
      ),
    );
  }

  final List<Widget> _pages = <Widget>[
    Container(
        color: AppColors.green,
        child: AssetImageWidget(
          image: ImageConstants.IC_MOSQUE_BIG,
        )),
    Container(
        color: AppColors.green,
        child: AssetImageWidget(
          image: ImageConstants.IC_MOSQUE_BIG,
        )),
    Container(
      color: AppColors.green,
      child: AssetImageWidget(
        image: ImageConstants.IC_MOSQUE_BIG,
      ),
    ),
  ];

  _getFollowButton() {
    return MosqueFollowButton(
      radius: 30,
      callBack: () {
        createMosqueFollower();
        print("Handle CallBack");
      },
      text: AppTexts.FOLLOW_TEXT,
      isFilled: false,
    );
  }
  _getUnFollowButton() {
    return MosqueFollowButton(
      radius: 30,
      callBack: () {
        print("Handle CallBack");
        deleteMosqueFollower();
      },
      text: AppTexts.UNFOLLOW_TEXT,
      isFilled: true,
    );
  }

  _getMosqueDetails() {
    return Padding(
      padding: const EdgeInsets.only(left: 28.0, top: 5.5, right: 28.0),
      child: Row(
        children: [
          _getMemberImage(),
          CustomSpacerWidget(
            width: 10,
          ),
          _getNameAndLocation(),
        ],
      ),
    );
  }

  _getMemberImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Image.asset(
        ImageConstants.IMG_MOSQUE,
        fit: BoxFit.cover,
        height: 53,
        width: 53,
      ),
    );
  }

  _getNameAndLocation() {
    return Padding(
      padding: const EdgeInsets.only(top: 3.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mosque[0].mosque_name,
            //AppTexts.MOSQUE_NAME,
            style: TextStyle(
              fontFamily: FontConstants.FONT,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.green,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                mosque[0].city + " , "+ mosque[0].country,
                //AppTexts.MOSQUE_LOCATION,
                style: TextStyle(
                  fontFamily: FontConstants.FONT,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black_50,
                ),
              ),
              CustomSpacerWidget(
                width: 4,
              ),
              Text(
                AppTexts.MEMBER_COUNT,
                style: TextStyle(
                  fontFamily: FontConstants.FONT,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black_50,
                ),
              )
            ],
          ),
          CustomSpacerWidget(
            height: 4,
          ),
        ],
      ),
    );
  }

  Future<List<Mosque>> getMosque() async {
    try {
      mosque = await Amplify.DataStore.query(Mosque.classType , where:Mosque.ID.eq(mosqueID));
      print("Before the details of mosque");
      print(mosque);
      print("inside the main page");
      return mosque;
    } catch (e) {
      print("Could not query DataStore: " + e.StackTrace);
    }
  }

  Widget buildUI(List<Mosque> mosque) {
    return Scaffold(
      backgroundColor: AppColors.GREY_KIND,
      body: _getBody(),
      bottomNavigationBar: _getBottomNavigation(),
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

  _navigateBack() {
    print(widget.CallingScreen);
    print(CallingScreen);
    switch (CallingScreen) {
      case 'MosqueScreen':
        if(UserMosqueFollowingList.isNotEmpty){
          Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => MosqueScreen(CallingScreen: "MosqueDetails",loginUser: widget.sessionUser,),
              )
          );
          //Navigation.back(context);
          //Navigator.pop(context, true);
        }
        else{
          //Navigation.intent(context, AppRoutes.HOME);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomeScreen(sessionUser:widget.sessionUser)));
        }
        break;
      case 'MosqueSearch':
        Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => MosqueSearchListView(CallingScreen: "MosqueDetails",sessionUser: widget.sessionUser,),
            )
        );
        //executePending();
        break;
      default:
        if(UserMosqueFollowingList.isNotEmpty){
          Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => MosqueScreen(CallingScreen: "MosqueDetails",loginUser: widget.sessionUser),
              )
          );
        }
        else{
          //Navigation.intent(context, AppRoutes.HOME);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomeScreen(sessionUser:widget.sessionUser)));
        }
    }
    //print(widget.CallingScreen);
    //if(widget.CallingScreen == "MosqueScreen"){
      //Navigator.push(context,
         // MaterialPageRoute(
          //  builder: (context) => MosqueScreen(),
         // )
      //);
      //MosqueScreen();
      //Navigation.intent(context, AppRoutes.HOME);
    //}
   //else{
    //  Navigation.back(context);
    //}
  }

  Future<void> deleteMosqueFollower() async{
    print("inside delete mosqueFollowers");
    try {
    for(var m in UserMosqueFollowingList){
      if(m.mosqueID == widget.MosqueObject.id && m.usersID == widget.UserID){
        await Amplify.DataStore.delete(m);
        Timer(
            Duration(milliseconds: 200),
                () => _setStateFunction());
      }
    }
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }

  _setStateFunction(){
    print("inside set State");
    setState((){
      print("inside set state");
      status = false;
      buttonClickEvent = true;
    });
  }

  Future<void> createMosqueFollower() async{
    print("inside mosque followers");
    print(widget.MosqueObject.id);
    print(widget.UserID);
    try {
      final item = MosqueFollowers(
          mosqueID: widget.MosqueObject.id,
          usersID: widget.UserID);
      await Amplify.DataStore.save(item);
      print("going to set state");
      setState(() {
        print("inside mosque follower set state is true");
        status = true;
        buttonClickEvent = true;
      });
    }catch (e) {
      print("Could not query DataStore: " + e);
    }
  }

  Future<List<MosqueFollowers>> UserMosqueFollowList() async{
    try {
      UserMosqueFollowingList = await Amplify.DataStore.query(MosqueFollowers.classType, where:MosqueFollowers.USERSID.eq(widget.UserID));
      print(UserMosqueFollowingList);
      return UserMosqueFollowingList;
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }

  _getBottomNavigation() {
    return BottomNavigationWidget(
      //MosqueFollowersList: UserMosqueFollowingList,
      //CallingFunction: _navigateback(),
      sessionUser: widget.sessionUser,
      CallingScreen: "MosqueDetails",
      index: 1,
    );
  }

}

