import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/bottom_navigation_bar_widget.dart';
import 'package:mus_greet/models/ModelProvider.dart';
import 'package:mus_greet/models/Users.dart';
import 'package:mus_greet/pages/create_post_screen/create_post_screen.dart';
import 'package:mus_greet/pages/friend_search/friend_search.dart';
import 'package:mus_greet/pages/home_screen/home_screen.dart';
import 'package:mus_greet/pages/mosque_screen/mosque_details/mosques_detail_screen.dart';
import 'package:mus_greet/pages/mosque_screen/mosque_screen.dart';
import 'package:mus_greet/pages/mosque_screen/mosque_search_list_view/mosque_search_list_view.dart';
import 'package:mus_greet/pages/profile/view_profile_screen/view_profile_screen.dart';





///This the main home where  all the pages will load like home scree,profile etc.
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin{
  PageController _pageController = PageController();
  bool shouldNavigateToSearch = false;
  bool shouldNavigateToMosqueSearch = false;
  Users objectUser;

  _onWillPop() {
    if (shouldNavigateToSearch) {
      setState(() {
        shouldNavigateToSearch = false;
      });
    }else {
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WillPopScope(
      onWillPop: () => _onWillPop(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.GREY_KIND,
          resizeToAvoidBottomInset: true,
          body: _getBody(),
          bottomNavigationBar: _getBottomNavigationBar(),
        ),
      ),
    );
  }

  ///This will render the body of home.
  _getBody() {
    getUser();
    return SizedBox.expand(
      child: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(),
          _getMosquesScreen(),
          CreatePostScreen(),
          //Container(),
          //FriendSearch(),
          HomeScreen(),
          ViewProfileScreen(sessionUser: objectUser),
        ],
      ),
    );
  }


  ///This will return bottom navigation bar on screen
  _getBottomNavigationBar() {
    return BottomNavigationBarWidget(
      controller: _pageController,
    );
  }

  _getMosquesScreen() {
    if (shouldNavigateToMosqueSearch == false &&
        shouldNavigateToSearch == false) {
      return MosqueScreen(
        callBack: () => _loadMosqueDetailsScreen(),
        navigateToMosqueSearch: () => _navigateToMosqueSearch(),
      );
    } else if (shouldNavigateToSearch) {
      return MosquesDetailsScreen(backCallBack: () => _backToMosqueHome());
    } else if (shouldNavigateToMosqueSearch) {
      return MosqueSearchListView(
        callBack: () => _getBackToMosqueHomeFromSearch(),
      );
    }
  }

  _backToMosqueHome() {
    setState(() {
      shouldNavigateToSearch = false;
    });
  }

  _navigateToMosqueSearch() {
    setState(() {
      shouldNavigateToMosqueSearch = true;
    });
  }

  _getBackToMosqueHomeFromSearch() {
    print("world");
    setState(() {
      shouldNavigateToMosqueSearch = false;
    });
  }

  _loadMosqueDetailsScreen() {
    print("Helloooo");
    setState(() {
      shouldNavigateToSearch = true;
    });
  }

  Future<void> getUser() async
  { print("inside the get users");
    List<Users> userObject=await Amplify.DataStore.query(Users.classType);
    for(var user in userObject)
      {print("for loop in user object");
        if(user.id== "c55d5cd0-d200-4f26-a170-bb655af93fe5")
          {print("inside the if condition");
            objectUser=user;
          }
      }
  }

  @override
  bool get wantKeepAlive => true;
}
