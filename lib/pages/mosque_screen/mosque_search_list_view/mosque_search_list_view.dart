import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/advance_search_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/bottom_navigation_bar_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/mosque_list_card_widget.dart';
import 'package:mus_greet/core/widgets/search_text_field_widget.dart';
import 'package:mus_greet/models/Facilitiesmaster.dart';
import 'package:mus_greet/models/ModelProvider.dart';
import 'package:mus_greet/models/Mosque.dart';
import 'package:mus_greet/pages/home_screen/home_screen.dart';
import 'package:mus_greet/pages/mosque_screen/advance_search_screen/advance_search_screen.dart';
import 'package:mus_greet/pages/mosque_screen/mosque_screen.dart';
import 'package:mus_greet/core/widgets/bottom_navigation_widget.dart';


class MosqueSearchListView extends StatefulWidget {
  final Function callBack;
  final String CallingScreen;
  final Users sessionUser;
  const MosqueSearchListView({Key key, this.callBack,this.CallingScreen, this.sessionUser}) : super(key: key);
  //const MosqueSearchListView({this.CallingScreen});

  @override
  _MosqueSearchListViewState createState() => _MosqueSearchListViewState();
}

class _MosqueSearchListViewState extends State<MosqueSearchListView> {
  //PageController _pageController = PageController();
  String UserID ;
  ArgumentClass args;
  List<String> advancedSearchSectList = [];
  List<String> advancedSearchFacilitiesList =[];
  List<Mosque> Mosques = [];
  List<Mosque> SearchedMosques = [];
  List<Mosque> ResultMosques = [];
  List<Facilitiesmaster> Facilitiesmasters = [];
  List<Mosque> sectFilteredMosques = [];
  List<Mosque> facilityFilteredMosques = [];
  List<MosqueFollowers> MosqueFollowerss =[];


  @override
  Widget build1(BuildContext context) {
    print("printing args");
    args = ModalRoute.of(context).settings.arguments as ArgumentClass;
    print(args);
    //listMosque(advancedSearchSectList,advancedSearchFacilitiesList);
    if (args != null) {
      UserID = args.sessionUser.id;
      advancedSearchSectList = args.advancedSearchSectList;
      advancedSearchFacilitiesList = args.advancedSearchFacilitiesList;
      print(advancedSearchSectList);
      print(advancedSearchFacilitiesList);
      //advancedSearchMosqueList(advancedSearchSectList, advancedSearchFacilitiesList);
      listMosque(advancedSearchSectList, advancedSearchFacilitiesList, true);
      //advancedSearchMosqueList(advancedSearchSectList,advancedSearchFacilitiesList);
    }
    else {
      UserID = widget.sessionUser.id;
      print(advancedSearchFacilitiesList);
      print(advancedSearchSectList);
      listMosque(advancedSearchSectList, advancedSearchFacilitiesList, false);
    }
    //advancedSearchSectList = args.advancedSearchSectList;
    //advancedSearchFacilitiesList = args.advancedSearchFacilitiesList;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: _getAppBar(context),
        body: _getBody(),
        bottomNavigationBar: _getBottomNavigation(),
      ),
    );
  }

  Widget build(BuildContext context){
    //UserID = widget.sessionUser.id;
    print("printing args");
    args = ModalRoute.of(context).settings.arguments as ArgumentClass;
    print(args);
    if(args != null){
      UserID = args.sessionUser.id;
    }
    else{
      UserID = widget.sessionUser.id;

    }
    return FutureBuilder<List<Mosque>>(
      future: _getMosque(),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
                Mosques = snapshot.data;
            return _getMosqueUI(Mosques);
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
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: Size(MediaQuery
            .of(context)
            .size
            .width, 150),
        child: Container(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _getRowHeader(),
                CustomSpacerWidget(
                  height: 15,
                ),
                _getSearchTextField(),
                CustomSpacerWidget(
                  height: 10,
                ),
                _getAdvanceSearchField(),
              ],
            )),
      ),
    );
  }

  _getRowHeader() {
    print("inside row header");
    //print(widget.callBack);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        GestureDetector(
          onTap: () {
            _navigateback();
            //_navigateback();
            //widget.callBack();
            },
          child: AssetImageWidget(
            image: ImageConstants.IC_BACK,
            height: 18,
            width: 25,
          ),
        ),
        Container(
          child: Text(
            AppTexts.SEARCH,
            style: TextStyle(
              fontFamily: FontConstants.FONT,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppColors.header_black,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Navigation.intent(context, AppRoutes.MOSQUE_FROM_MAP),
          child: Container(
            height: 30,
            width: 30,
            child: Image.asset(
              ImageConstants.IC_MAP,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  _getSearchTextField() {
    return SearchTextFieldWidget();
  }

  _getAdvanceSearchField() {
    return AdvanceSearchWidget(
        callBack: () => _navigateToAdvanceSearchScreen()
    );
  }

  _getBody() {
    print(MosqueFollowerss);
    return Container(
      //padding: EdgeInsets.only(top: 20,left: 15,right: 15),
      color: AppColors.white_shade,
      child: ListView.separated(
        padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
        itemBuilder: (context, index) {
          return MosqueListCardWidget(
              index: index, mosqueObject: ResultMosques[index],UserID: UserID,sessionUser: widget.sessionUser,
             // MosqueFollowersList: MosqueFollowerss
              );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 20,
            color: Colors.transparent,
          );
        },
        itemCount: ResultMosques.length,
      ),
    );
  }


  _navigateToAdvanceSearchScreen() {
    Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => AdvanceSearchScreen(sessionUser:widget.sessionUser),
        )
    );
    //Navigation.intent(context, AppRoutes.MOSQUE_ADVANCE_SEARCH);
  }

/// this method is to get result mosques list
  Future<void> listMosque(List<String> advancedSearchSectList,List<String> advancedSearchFacilitiesList, bool  advanceSearchStatus) async {
    print("inside list mosques");

    ///get the master facilitieslist
    try {
      Facilitiesmasters =
      await Amplify.DataStore.query(Facilitiesmaster.classType);
      print(Facilitiesmasters);
    } catch (e) {
      print("Could not query DataStore: " + e);
    }

    ///get the list of mosques
    try {
      Mosques = await Amplify.DataStore.query(Mosque.classType);
      print("Mosque length");
      print(Mosques.length);
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
    if (advanceSearchStatus == true){
      await Future.delayed(Duration(seconds: 1));
      if(Mosques != []){
        print(advancedSearchSectList);
      //advancedSearchMosqueList(advancedSearchSectList,advancedSearchFacilitiesList);
        advancedSearchSectFilter(advancedSearchSectList, advancedSearchFacilitiesList);
      }
    }
    else{
      await Future.delayed(Duration(seconds: 1));
      print("inside else block in list Mosques method");
      ResultMosques = Mosques;
      print("ResultMosques");
      print(ResultMosques.length);
      print(ResultMosques);
    }

  }
/// this method is not in use noe
  Future<void> advancedSearchMosqueList(List<String> advancedSearchSectList, List<String> advancedSearchFacilitiesList) async {
    print("inside advanced Search");
    print(Mosques);
    SearchedMosques = [];
    ResultMosques = [];
    //Facilitiesmasters = [];
    print(advancedSearchSectList);
    print(advancedSearchFacilitiesList);
    if (advancedSearchFacilitiesList == [] && advancedSearchSectList == []) {
      SearchedMosques= Mosques;
      ResultMosques = SearchedMosques;
      print("normal search result SearchedMosques Length");
      print(ResultMosques.length);
    }
    else {
      ///condition to filter mosques based on sect
      print("going for sect filter");
      print(advancedSearchSectList);
      if(advancedSearchSectList.isEmpty){
        print("when sect is empty");
        print("MosquesLength");
        print(Mosques.length);
        SearchedMosques = Mosques;
        ResultMosques = SearchedMosques;
        print(Mosques.length);
      }
      else{
        print("inside sect else");
        for (var sect in advancedSearchSectList) {
          for (var i in Mosques) {
            if (sect.toLowerCase() == i.sect.toLowerCase()) {
              print(sect.toLowerCase());
              print(i.sect.toLowerCase());
              SearchedMosques.add(i);
            }
          }
        }
        print("after sect filtered");
        print(SearchedMosques.length);
        ResultMosques=SearchedMosques;
        if(ResultMosques.length == 0){print("no result available");}
      }
      print("Starting facilities filter");
      ///condition to filter based on facilities list
      print(advancedSearchFacilitiesList);
      //print(Facilitiesmasters[0]);
      print("Searched mosques length");
      print(SearchedMosques.length);
      print("result mosques length");
      print(ResultMosques.length);
      if (advancedSearchFacilitiesList.isNotEmpty && Facilitiesmasters.isNotEmpty) {
        print("SearchedMosques length loop inside ");
        print(SearchedMosques.length);
        for (var j in SearchedMosques) {
          List<String> MosqueFacilitiesList = j.mosque_facility_list.split(',');
          //print(MosqueFacilitiesList);
          for (var id in MosqueFacilitiesList) {
            for (var masterfacility in Facilitiesmasters) {
              if (id.toLowerCase() == masterfacility.id.toLowerCase()) {
                for(var searchFacility in advancedSearchFacilitiesList){
                  if(searchFacility.toLowerCase() == masterfacility.facility_header.toLowerCase()){
                    print(searchFacility.toLowerCase());
                    ResultMosques.add(j);
                  }
                }
              }
            }
          }
        }
      }
    }

    print("Final result list");
    print(ResultMosques.length);
    print(ResultMosques);
  }

///this method is to get advanced search filtered mosque list
  Future<void> advancedSearchSectFilter(List<String> advancedSearchSectList, List<String> advancedSearchFacilitiesList) async {
    bool Status = false;
    sectFilteredMosques = [];
    if (Mosques.isNotEmpty && advancedSearchSectList.isNotEmpty){
      for (var s in advancedSearchSectList){
        for(var m in Mosques){
          if(s.toLowerCase() == m.sect.toLowerCase()){
            if(advancedSearchFacilitiesList.isNotEmpty){
            Status = advancedSearchFacilityFilter(m, advancedSearchFacilitiesList);
            }
            else{
              Status = true;
            }
            if(Status == true){
              sectFilteredMosques.add(m);
            }
          }
        }
      }
    }
    else {
      //sectFilteredMosques = Mosques;
      for(var m in Mosques){
        Status = advancedSearchFacilityFilter(m, advancedSearchFacilitiesList);
        if(Status == true){
          sectFilteredMosques.add(m);
        }
      }
    }
    ResultMosques = sectFilteredMosques;
    print(ResultMosques.length);
    print(ResultMosques);

  }

  ///This method is to get filtered mosques list by facilities
  advancedSearchFacilityFilter(Mosque filteredMosque, List<String> advancedSearchFacilitiesList){
    bool status = false;
    int count = 0;
    List<String> mosqueFacilityList = [];
    if (filteredMosque != null && advancedSearchFacilitiesList.isNotEmpty){
      mosqueFacilityList = filteredMosque.mosque_facility_list.split(',');
      for (var facilityName in advancedSearchFacilitiesList){
        for(var facilityId in mosqueFacilityList){
          for(var masterFacility in Facilitiesmasters){
            if(facilityId.toLowerCase() == masterFacility.id.toLowerCase()){
              if(masterFacility.facility_header.toLowerCase() == facilityName.toLowerCase()){
                count ++;
              }
            }
          }
        }
      }
      if(count > 0){
        status = true;
      }
    }
    else{
      //ResultMosques = Mosques;
      status = false;
    }
    return status;
  }

  _navigateback() {
    print("Calling screen in search list view");
    print(widget.CallingScreen);
    switch (widget.CallingScreen) {
      case 'MosqueScreen':
        if(MosqueFollowerss.isNotEmpty){
          Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => MosqueScreen(loginUser: widget.sessionUser,),
              )
          );
        }
        else
         // Navigation.intent(context, AppRoutes.HOME);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomeScreen(sessionUser:widget.sessionUser)));
        break;
        // Navigator.push(context,
        //     MaterialPageRoute(
        //       builder: (context) => MosqueScreen(),
        //     )
        // );
        // break;
      case 'MosqueDetails':
        if(MosqueFollowerss.isNotEmpty){
          Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => MosqueScreen(loginUser: widget.sessionUser),
              )
          );
        }
        else
          //Navigation.intent(context, AppRoutes.HOME);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomeScreen(sessionUser:widget.sessionUser)));
        //executePending();
        break;
      case 'Home':
        if(MosqueFollowerss.isNotEmpty){
          Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => MosqueScreen(loginUser: widget.sessionUser,),
              )
          );
        }
        else{
          //Navigation.intent(context, AppRoutes.HOME);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomeScreen(sessionUser:widget.sessionUser)));
        }
        break;
      default:
        //Navigation.back(context);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen(sessionUser:widget.sessionUser)));
    }
    //if(widget.callBack == null){
      //Navigation.intent(context, AppRoutes.HOME);
    //}else {
      //print(widget.callBack);
      //Navigation.intent(context, AppRoutes.HOME);
      //widget.callBack;
    //}
  }

 Future<List<Mosque>> _getMosque() async {
   try {
     Mosques = await Amplify.DataStore.query(Mosque.classType);
     return Mosques;
   } catch (e) {
     print("Could not query DataStore: " + e);
   }
 }

  Widget _getMosqueUI(List<Mosque> Mosques) {
    return FutureBuilder<List<Facilitiesmaster>>(
      future: _getFacilitiesMaster(),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
              Facilitiesmasters = snapshot.data;
            return _getMosqueFollowersUI(Mosques,Facilitiesmasters);
          default:
            return _buildLoadingScreen();
        }
      },
    );

  }

  Widget _getMosqueFollowersUI(List<Mosque> Mosques,List<Facilitiesmaster> Facilitiesmasters){
    return FutureBuilder<List<MosqueFollowers>>(
      future: listMosqueFollowers(),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            MosqueFollowerss = snapshot.data;
            return _getFacilitiesAndMosque(Mosques,Facilitiesmasters,MosqueFollowerss);
          default:
            return _buildLoadingScreen();
        }
      },
    );
  }

  Future<List<Facilitiesmaster>> _getFacilitiesMaster() async {
    try {
      Facilitiesmasters = await Amplify.DataStore.query(Facilitiesmaster.classType);
      return Facilitiesmasters;
    } catch (e) {
      print("Could not query DataStore: " + e);
    }

  }

  Widget _getFacilitiesAndMosque(List<Mosque> mosques, List<Facilitiesmaster> facilitiesmasters, List<MosqueFollowers> MosqueFollowerss) {
    // print("printing args");
    // args = ModalRoute.of(context).settings.arguments as ArgumentClass;
    // print(args);
    //listMosque(advancedSearchSectList,advancedSearchFacilitiesList);
    if (args != null) {
      advancedSearchSectList = args.advancedSearchSectList;
      advancedSearchFacilitiesList = args.advancedSearchFacilitiesList;
      print(advancedSearchSectList);
      print(advancedSearchFacilitiesList);
      //advancedSearchMosqueList(advancedSearchSectList, advancedSearchFacilitiesList);
      getMosquesList(mosques,facilitiesmasters, advancedSearchSectList, advancedSearchFacilitiesList, true);
      //advancedSearchMosqueList(advancedSearchSectList,advancedSearchFacilitiesList);
    }
    else {
      print(advancedSearchFacilitiesList);
      print(advancedSearchSectList);
      getMosquesList(mosques,facilitiesmasters,advancedSearchSectList, advancedSearchFacilitiesList, false);
    }
    //advancedSearchSectList = args.advancedSearchSectList;
    //advancedSearchFacilitiesList = args.advancedSearchFacilitiesList;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: _getAppBar(context),
        body: _getBody(),
        bottomNavigationBar: _getBottomNavigation(),
      ),
    );
  }

  getMosquesList(List<Mosque> Mosques, List<Facilitiesmaster> Facilitiesmasters, List<String> advancedSearchSectList,List<String> advancedSearchFacilitiesList, bool  advanceSearchStatus) {
    print("inside list mosques");

    ///get the master facilitieslist
      print(Facilitiesmasters);
    ///get the list of mosques

      print("Mosque length");
      print(Mosques.length);

    if (advanceSearchStatus == true){
      if(Mosques != []){
        print(advancedSearchSectList);
        //advancedSearchMosqueList(advancedSearchSectList,advancedSearchFacilitiesList);
        advancedSearchSectFilter(advancedSearchSectList, advancedSearchFacilitiesList);
      }
    }
    else{
      print("inside else block in list Mosques method");
      ResultMosques = Mosques;
      print("ResultMosques");
      print(ResultMosques.length);
      print(ResultMosques);
    }

  }

  Future<List<MosqueFollowers>> listMosqueFollowers() async{
    try {
      MosqueFollowerss = await Amplify.DataStore.query(MosqueFollowers.classType,where: MosqueFollowers.USERSID.eq(widget.sessionUser.id));
      print(MosqueFollowerss);
      return MosqueFollowerss;
    } catch (e) {
      print("Could not query DataStore: " + e);
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

  _getBottomNavigation() {
    // if(widget.CallingScreen != "Home") {
    //   return BottomNavigationWidget(
    //     MosqueFollowersList: MosqueFollowerss,
    //     //CallingFunction: _navigateback(),
    //     CallingScreen: "MosqueSearch",
    //     index: 1,
    //   );
    // }
    Users userObject;
    if(args != null )
      {
        userObject=args.sessionUser;
      }else{

      userObject =widget.sessionUser;
    }
    return BottomNavigationWidget(
      //MosqueFollowersList: MosqueFollowerss,
      //CallingFunction: _navigateback()
      sessionUser : userObject,
      //sessionUser: widget.sessionUser,
      CallingScreen: "MosqueSearch",
      index: 1,
    );
  }


}

class ArgumentClass {
  final List<String> advancedSearchSectList;
  final List<String> advancedSearchFacilitiesList;
  final Users sessionUser;
  ArgumentClass(this.advancedSearchSectList, this.advancedSearchFacilitiesList, this.sessionUser);

}

