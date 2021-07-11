import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/advance_search_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/bottom_navigation_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/friend_search_list_widget.dart';
import 'package:mus_greet/core/widgets/sponsored_widget.dart';
import 'package:mus_greet/models/ModelProvider.dart';
import 'package:mus_greet/pages/age/age_registration_page.dart';
import 'package:mus_greet/pages/home_screen/home_screen.dart';

class FriendSearch extends StatefulWidget {
  final Users sessionUser;
  FriendSearch({this.sessionUser});
  @override
  _FriendSearchState createState() => _FriendSearchState();
}

class _FriendSearchState extends State<FriendSearch> {
  List<Users> Userss = [];
  List<Friends> friends=[];
  List<String> friendsListIDofLoggedInUser=[];
  List<FriendRequest> friendsRequest=[];
  List<Users> userList =[];
  String loginUserId;
  @override
  Widget build(BuildContext context) {
    loginUserId=widget.sessionUser.id;
    print("Hello");
    return FutureBuilder<List<Users>>(
      future: listUsers(),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
             Userss = snapshot.data;
            return _buildUI(Userss);
          default:
            return _buildLoadingScreen();
        }
      },
    );
  }

  _getAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.white,
      bottom: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 110),
        child: Container(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomSpacerWidget(
                height: 30,
              ),
              _getSearchTextField(),
              CustomSpacerWidget(
                height: 10,
              ),
              _getAdvanceSearchField(),
            ],
          ),
        ),
      ),
    );
  }

  _getBody() {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.white_shade,
        padding: EdgeInsets.only(
          top: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _currentlyFollowings(),
            ListView.separated(
              padding: EdgeInsets.only(left: 20, right: 20),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: userList.length,
              separatorBuilder: (context, int index) {
                return Divider(
                  height: 10,
                  color: Colors.transparent,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                // ignore: missing_return
                //print(Users)
                print(userList.length);
                print("checking the body");
                print(userList[index].id);
                if(loginUserId == userList[index].getId() ) {
                   return Container();
                }
                else {
                    print("user Found");
                    if (index % 2 == 0 && index !=0) {
                      return _getSponsoredWidget(index);
                    } else {
                      return FriendSearchListWidget(
                        index: index,loginUserId: loginUserId, UserObject: userList[index]
                      );
                    }
                  }
                },
            )
          ],
        ),
      ),
    );
  }

  _getSearchTextField() {
    return Container(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 30),
            child: FriendSearchFieldWidget(),
          ),
          Positioned(
            top: 18,
            left: 0,
            child: _backButton(),
          ),
        ],
      ),
    );
  }

  _currentlyFollowings() {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 5, bottom: 20),
      child: Text(
        "We found " +(userList.length -1).toString()+ " result",
        //AppTexts.FOUND_RESULT,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: AppColors.header_black,
            fontFamily: FontConstants.FONT),
      ),
    );
  }

  _getAdvanceSearchField() {
    return AdvanceSearchWidget(
        callBack: () => _navigateToAdvanceSearchScreen());
  }

  _backButton() {
    return GestureDetector(
      onTap: ()=> _navigatebackHome(),
      child: AssetImageWidget(
        image: ImageConstants.IC_BACK,
        height: 18,
        width: 25,
      ),
    );
  }

  _navigateToAdvanceSearchScreen() {
    Navigation.intent(context, AppRoutes.FRIEND_ADVANCE_SEARCH);
  }


  _getSponsoredWidget(int index){
    return Column(
      children: [
        SponsoredWidget(),
        FriendSearchListWidget(index: index,UserObject: userList[index]),
      ],
    );
   //return SponsoredWidget();
  }

  Future<List<Users>> listUsers() async{
    try {
      Userss = await Amplify.DataStore.query(Users.classType);
      print("Users length inside friends search");
      print(Userss.length);
      print(Userss);
      //print(Userss[0]);
      //print(Userss[1]);
      //print(Userss[2]);
      //print(Userss[3]);
      //print(Userss[4]);
      //print(Userss[5]);

      //print(Userss[0].first_name);
      //print(Userss.first);
      //print(Userss.length);
      //print(Userss[0].first_name);
      return Userss;
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }

  Widget _buildUI(List<Users> Userss) {

    return FutureBuilder<List<Friends>>(
      future: getFriendsList(),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            friends = snapshot.data;
            return _buildListOfUsers(Userss,friends);
          default:
            return _buildLoadingScreen();
        }
      },
    );
  }

   _buildListOfUsers(List<Users> userss, List<Friends> friends) {
    if(friends.isEmpty){
      userList = userss;
    }
    else{
      print("List of Users");
      getLoggedInUserFriends();
      print("inside the friends method");
      getUserFriendsByFiltering();
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white_shade,
        appBar: _getAppBar(context),
        body: _getBody(),
        bottomNavigationBar: _getBottomNavigation(),
      ),
    );

   }

  _getBottomNavigation() {
    return BottomNavigationWidget(
      //MosqueFollowersList: UserMosqueFollowingList,
      //CallingFunction: _navigateback(),
      sessionUser: widget.sessionUser,
      CallingScreen: "Home",
      index: 0,
    );
  }


  Future<List<Friends>> getFriendsList() async{
    try {
      friends = await Amplify.DataStore.query(Friends.classType, where: Friends.USERSID.eq(loginUserId));
      print(friends);
      print("inside the friends list");
      return friends;
    }catch(e)
    {
        print(e);
    }
  }



  void getLoggedInUserFriends() {
    friendsListIDofLoggedInUser.clear();
    for(var friendsId in friends)
      {
        print(friendsId.friends_list);
        print("inside the for loop");
        var friendsListString=friendsId.friends_list;
        var splittingListId=friendsListString.split(",");
        friendsListIDofLoggedInUser=splittingListId;
      }

    print("list of Friends String ids");
    print(friendsListIDofLoggedInUser);
  }

  getUserFriendsByFiltering() {
    for(int i=0 ;i<friendsListIDofLoggedInUser.length;i++) {
        String friendsId=friendsListIDofLoggedInUser[i];
        print(friendsId);
        userList.clear();
        print("inside the get User Friends By Filterting");
        for(int i=0 ; i<Userss.length ;i++) {
            if(friendsId == Userss[i].id) {
                print("The user id accepted so should not display in the friends search tab");
              }
            else{
              print(Userss[i]);
              //print(userList[i]);
              userList.add(Userss[i]);
            }
        }
      }
    print("getUserFriendsByFiltering");
    print(userList);
  }

  _navigatebackHome() {
    print(widget.sessionUser);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeScreen(sessionUser:widget.sessionUser)));
  }
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

///Friend search field

class FriendSearchFieldWidget extends StatefulWidget {
  @override
  _FriendSearchFieldWidgetState createState() =>
      _FriendSearchFieldWidgetState();
}

class _FriendSearchFieldWidgetState extends State<FriendSearchFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.green,
        ),
      ),
      child: TextField(
        //controller: widget.controller,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: AppColors.header_black,
        ),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          //hintText: widget.hintText,
          /* hintStyle: TextStyle(
            fontFamily: FontConstants.FONT,
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: AppColors.black_50,
          ),
          labelText: AppTexts.LABEL_CURRENT_LOCATION,
          labelStyle: TextStyle(
            fontFamily: FontConstants.FONT,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.header_black,
          ),
          hintText: AppTexts.HINT_LOCATION,*/
          suffix: Container(
            padding: EdgeInsets.only(right: 5, top: 0),
            child: Icon(
              Icons.clear,
              color: AppColors.vertical_divider,
            ),
          ),
          suffixIcon: Container(
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.green),
              color: AppColors.background_color,
            ),
            margin: EdgeInsets.only(top: 2, right: 4, bottom: 2, left: 4),
            alignment: Alignment.center,
            child: Image.asset(
              ImageConstants.IC_SEARCH,
              height: 20,
              width: 20,
            ),
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          contentPadding:
              EdgeInsets.only(left: 20, bottom: 15, top: 10, right: 20),
        ),
      ),
    );
  }
}
