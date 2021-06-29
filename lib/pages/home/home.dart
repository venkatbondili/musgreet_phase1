import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/bottom_navigation_bar_widget.dart';
import 'package:mus_greet/models/MosqueFollowers.dart';
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
  List<MosqueFollowers> MosqueFollowerss =[];

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
    return FutureBuilder<List<MosqueFollowers>>(
      future: listMosqueFollowers(),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            MosqueFollowerss = snapshot.data;
            return _getUI(MosqueFollowerss);
          default:
            return _buildLoadingScreen();
        }
      },
    );

  }

  _getUI(List<MosqueFollowers> mosqueFollowerss) {
    return SizedBox.expand(
      child: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(),
          MosqueFollowerss.isEmpty ? MosqueSearchListView(CallingScreen: "Home",): MosqueScreen(CallingScreen: "Home"),
          //_getMosquesScreen(),
          CreatePostScreen(),
          //Container(),
          //FriendSearch(),
          //HomeScreen(),
          MosqueFollowerss.isEmpty ? MosqueSearchListView(CallingScreen: "Home",): MosqueScreen(CallingScreen: "Home"),
          ViewProfileScreen(),
        ],
      ),
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

  ///This will return bottom navigation bar on screen
  _getBottomNavigationBar() {
    return BottomNavigationBarWidget(
      controller: _pageController,
    );
  }

  _getMosquesScreen() {
    print("inside get Mosque Screen");
    print("shouldNavigateToMosqueSearch");
    print(shouldNavigateToMosqueSearch);
    print("shouldNavigateToSearch");
    print(shouldNavigateToSearch);
    if(MosqueFollowerss.isEmpty){
      return MosqueSearchListView(CallingScreen: "Home",
        callBack: () => _getBackToMosqueHomeFromSearch(),
      );
    }
    else{
      if (shouldNavigateToMosqueSearch == false &&
          shouldNavigateToSearch == false) {
        return MosqueScreen(
          callBack: () => _loadMosqueDetailsScreen(),
          navigateToMosqueSearch: () => _navigateToMosqueSearch(),
        );
      } else if (shouldNavigateToSearch) {
        return MosquesDetailsScreen(backCallBack: () => _backToMosqueHome());
      } else if (shouldNavigateToMosqueSearch) {
        return MosqueSearchListView(CallingScreen: "MosqueScreen",
          callBack: () => _getBackToMosqueHomeFromSearch(),
        );
      }
    }

  }

  _backToMosqueHome() {
    print("imside back to mosque home");
    setState(() {
      shouldNavigateToSearch = false;
    });
  }

  _navigateToMosqueSearch() {
    print("inside navigate to mosque search");
    setState(() {
      shouldNavigateToMosqueSearch = true;
    });
  }

  _getBackToMosqueHomeFromSearch() {
    print("inside get back to mosque home from search");
    print("world");
    setState(() {
      shouldNavigateToMosqueSearch = false;
    });
  }

  _loadMosqueDetailsScreen() {
    print("inside load mosque details screen");
    print("Helloooo");
    setState(() {
      shouldNavigateToSearch = true;
    });
  }

  Future<List<MosqueFollowers>> listMosqueFollowers() async{
    try {
      MosqueFollowerss = await Amplify.DataStore.query(MosqueFollowers.classType);
      print(MosqueFollowerss);
      return MosqueFollowerss;
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }

  @override
  bool get wantKeepAlive => true;

}
