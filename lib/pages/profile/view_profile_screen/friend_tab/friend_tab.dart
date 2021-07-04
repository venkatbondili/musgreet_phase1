import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/rounded_button_widget.dart';
import 'package:mus_greet/core/widgets/tab_style_widget.dart';
import 'package:mus_greet/models/FriendRequest.dart';
import 'package:mus_greet/models/Friends.dart';
import 'package:mus_greet/models/Users.dart';
import 'package:mus_greet/pages/friend_search/friend_search.dart';
//import 'package:mus_greet/pages/friend_search/friend_search1.dart';


class FriendTab extends StatefulWidget {
  final Users sessionUser;
  
  FriendTab({this.sessionUser});
  
  @override
  _FriendTabState createState() => _FriendTabState();
}

class _FriendTabState extends State<FriendTab> with SingleTickerProviderStateMixin {

  TabController _tabFriendsController;
  List<FriendRequest> friendRequest;
  List<Users> users=[];
  List<Friends> friends=[];
  List<FriendRequest> SentUsersList = [];
  List<FriendRequest> RequestUsersList = [];
  Users sentUserObject;
  Users requestUserObject;
  List<Users> userFriendObject = [];
  List<String> intoFriendsList = [];
 // List<Friends> acceptedFriendsList;
  DateTime date=DateTime.now();
  TemporalDate temporalDate=new TemporalDate(DateTime.now());
  // String tabSelection="";
  String loginUserId;
  @override
  void initState() {
    _tabFriendsController = TabController(length: 3, vsync: this);
    _tabFriendsController.addListener(_handleFriendsTabSelection);
    super.initState();
  }


  /// For changing the friends tab properly
  _handleFriendsTabSelection() {
    if (_tabFriendsController.indexIsChanging) {
      setState(() {});
    }
  }



  @override
  Widget build(BuildContext context) {
    //friendRequestList();
    //getListOfFriends();
    loginUserId = widget.sessionUser.id;
    return FutureBuilder<List<FriendRequest>>(
      future: friendRequestList(),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            friendRequest = snapshot.data;
            return buildUi(friendRequest);
          default:
            return _buildLoadingScreen();
        }
      },
    );


  }

  buildUi(List<FriendRequest> friendRequest) {
    //getListOfUsers
    return FutureBuilder<List<Users>>(
      future: getListOfUsers(),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            users = snapshot.data;
            return buildUserList(users);
          default:
            return _buildLoadingScreen();
        }
      },
    );
  }

  buildUserList(List<Users> users) {
    //friendList();
   //getRequestMessages();
    return Container(
      margin: EdgeInsets.only(top: 4),
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _getFriendsTabBar(),
            Center(
              child: [
                _getFriendsList(),
                _getFriendRequestList(),
                _getFriendsSentList(),
              ][_tabFriendsController.index],
            ),
            getCommonPadding(
                0,
                30,
                0,
                0,
                Center(
                  child: AssetImageWidget(
                    image: ImageConstants.AMAZON_ADS,
                    width: MediaQuery.of(context).size.width,
                  ),
                ))
          ],
        ),
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

  /// This will render all the friends data
  _getFriendsList() {
    return Container(
      child: Column(
        children: [
          _getFriendSearchBar(),
          SizedBox(height: 10.0),
          _getFriendsDataList(),
        ],
      ),
    );
  }

  /// This will render all the freind request data
  _getFriendRequestList() {
    return Container(
      child: Column(
        children: [
          _getFriendSearchBar(),
          SizedBox(height: 10.0),
          _getFriendsRequestDataList(),
        ],
      ),
    );
  }

  /// This will render all the friends data
  _getFriendsSentList() {
    return Container(
      child: Column(
        children: [
          _getFriendSearchBar(),
          SizedBox(height: 2.0),
          _getFriendsSentDataList(),
        ],
      ),
    );
  }
  _getSentUsersList(){
    SentUsersList = [];
    for(var fr in friendRequest){
      if(fr.request_from_id == loginUserId && fr.request_status == "Sent"){
        SentUsersList.add(fr);
      }
    }
   print("the sent list in friend request table");
    print(SentUsersList);
  }

  /// This will render all the friends request list
  // _getFriendsSentDataList() {
  //   return Container(
  //     width: MediaQuery.of(context).size.width,
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Padding(padding: EdgeInsets.only(top: 30)),
  //         _getFriendsRequestSentDataListItem(),
  //         // Padding(padding: EdgeInsets.only(top: 30)),
  //         // _getFriendsRequestSentDataListItem(),
  //         // Padding(padding: EdgeInsets.only(top: 30)),
  //         // _getFriendsRequestSentDataListItem(),
  //         // Padding(padding: EdgeInsets.only(top: 30)),
  //         // _getFriendsRequestSentDataListItem(),
  //         // Padding(padding: EdgeInsets.only(top: 30)),
  //         // _getFriendsRequestSentDataListItem(),
  //         // Padding(padding: EdgeInsets.only(top: 30)),
  //         // _getFriendsRequestSentDataListItem(),
  //       ],
  //     ),
  //   );
  // }

  _getFriendsSentDataList() {
    _getSentUsersList();
    if(SentUsersList.isNotEmpty){
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget> [
            ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount:SentUsersList.length,
                itemBuilder: (context,index){
                  return _getSentFriendsUI(SentUsersList[index]);
                }
            ),

          ],
        ),
      );
    }
    else{
      return Container(
        child: Text(
          "No Requests Yet!!! Search friends near by and send requests!!",
          //"himaja",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: AppColors.black),
        ),
      );
    }
  }

  _getSentFriendsUI(FriendRequest sentFriendObject){
    _getUserObject(sentFriendObject.request_to_id);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: getCommonPadding(
              48,
              6,
              0,
              12,
              AssetImageWidget(
                image: ImageConstants.IC_FATHER,
                height: 40,
                width: 40,
              )),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getCommonPadding(
                0,
                6,
                0,
                27,
                Text(
                  sentUserObject.first_name + " "+sentUserObject.last_name,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                ),
              ),
              getCommonPadding(
                0,
                3,
                0,
                27,
                Text(
                  // "",
                  //REQUESTMESSAGE[index],
                  sentFriendObject.request_message,
                  style: TextStyle(fontSize: 12, color: AppColors.black_50),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          child:GestureDetector(
            onTap: () => sentRequestDeleted(sentFriendObject),
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: AssetImageWidget(
                image: ImageConstants.IC_PERSON_CLOSE_CIRCLE,
                height: 25,
                width: 25,
              ),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(right: 48))
      ]);
}

///deleteing the friend from sent Tab

  sentRequestDeleted(FriendRequest sentFriendObject) async {
      print("Deleting the friend Request sent");
      final updatedItem = sentFriendObject.copyWith(
          request_status: "Reject",
          request_status_date: temporalDate);
      await Amplify.DataStore.save(updatedItem);

      setState(() {

      });

  }

///This will render the sent user Object
  _getUserObject(String request_to_id){
    for(var u in users){
      if(request_to_id == u.id){
        sentUserObject = u;
      }
    }
  }


  _getFriendsRequestDataList() {
    //getRequestMessages();
    getRequestFriendsList();
    if(RequestUsersList.isNotEmpty){
      return Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount:RequestUsersList.length,
                  itemBuilder: (context,index){
                    return _getRequestUi(RequestUsersList[index]);

                  }

              ),
            ],
          )
      );
    }
   else{
      return Container(
        child: Text(
          "No Friend Requests at present !!!",
          //"himaja",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: AppColors.black),
        ),
      );
    }
  }

  getRequestFriendsList() {
    RequestUsersList = [];
    for(var fr in friendRequest){
      if(fr.request_to_id == loginUserId && fr.request_status=="Sent"){
        RequestUsersList.add(fr);
      }
    }
  }

  _getRequestUi(FriendRequest requestUsers) {
    getRequestUserDetails(requestUsers.request_from_id);
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: getCommonPadding(
                48,
                6,
                0,
                12,
                AssetImageWidget(
                  image: ImageConstants.IC_FATHER,
                  height: 40,
                  width: 40,
                )),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getCommonPadding(
                  0,
                  6,
                  0,
                  27,
                  Text(
                    requestUserObject.first_name + "" +requestUserObject.last_name,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black),
                  ),
                ),
                getCommonPadding(
                  0,
                  3,
                  0,
                  27,
                  Text(
                    requestUsers.request_message,
                    style: TextStyle(fontSize: 12, color: AppColors.black_50),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            // child: Center(
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 30.0),
            //     child: AssetImageWidget(
            //       height: 25,
            //       width: 25,
            //       image: ImageConstants.IC_PERSON_CLOSE_CIRCLE,
            //     ),
            //   ),
            // ),
            child:GestureDetector(
              onTap: () => requestRejected(requestUsers),
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: AssetImageWidget(
                  image: ImageConstants.IC_PERSON_CLOSE_CIRCLE,
                  height: 25,
                  width: 25,
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(right: 10)),
          // Center(
          //
          //   child: Padding(
          //     padding: const EdgeInsets.only(top: 30.0),
          //     child: AssetImageWidget(
          //       height: 25,
          //       width: 25,
          //       image: ImageConstants.IC_PERSON_GREEN_CIRCLE,
          //
          //     ),
          //   ),
          // ),
          GestureDetector(
            onTap: () => requestAccepted(requestUsers),
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: AssetImageWidget(
                image: ImageConstants.IC_PERSON_GREEN_CIRCLE,
                height: 25,
                width: 25,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(right: 48))
        ]);
  }

  getRequestUserDetails(String request_from_id) {
    for(var u in users){
      if(request_from_id == u.id ){
        requestUserObject = u;
      }
    }
  }

 Future<void> requestRejected(FriendRequest requestUser) async {
    final updatedItem = requestUser.copyWith(
      //request_date: TemporalDate.fromString("1970-01-01Z"),
      //request_from_id: "a3f4095e-39de-43d2-baf4-f8c16f0f6f4d",
      //request_to_id: "a3f4095e-39de-43d2-baf4-f8c16f0f6f4d",
      //request_message: "Lorem ipsum dolor sit amet",
        request_status: "Reject",
        request_status_date: temporalDate);
    // unfriend_date: TemporalDate.fromString("1970-01-01Z"));
    await Amplify.DataStore.save(updatedItem);
  }

  requestAccepted(FriendRequest requestUser) async {
     friendsTable();
     checkingUserIdInFriendsTable(requestUser);
    final updatedItem = requestUser.copyWith(
        //request_date: TemporalDate.fromString("1970-01-01Z"),
        //request_from_id: "a3f4095e-39de-43d2-baf4-f8c16f0f6f4d",
        //request_to_id: "a3f4095e-39de-43d2-baf4-f8c16f0f6f4d",
        //request_message: "Lorem ipsum dolor sit amet",
        request_status: "Accept",
        request_status_date: temporalDate);
       // unfriend_date: TemporalDate.fromString("1970-01-01Z"));
    await Amplify.DataStore.save(updatedItem);
    print("updating the Friends Request table");
    print(requestUser);
  }

  Future<void> friendsTable() async {
    print("Getting the data from Friends table");
    try {
      friends = await Amplify.DataStore.query(Friends.classType);
      print(friends);
    } catch(e)
    {
      
    }
  }
  
  checkingUserIdInFriendsTable(FriendRequest requestUser) {
    print("checking the user id with friends user id");
    if(friends.isEmpty)
      {
        insertLoginRowIntoFriendsTable(loginUserId ,requestUser.request_from_id);
        insertLoginRowIntoFriendsTable(requestUser.request_from_id, loginUserId);
      }
    else {
      for (int i = 0; i < friends.length; i++)
        if (loginUserId == friends[i].usersID) {
          updateLoginTable(requestUser,friends[i]);
          for(int i=0 ;i<friends.length ;i++)
            {
              if(requestUser.request_from_id == friends[i].usersID)
                {
                  updateFriendsTable(loginUserId ,friends[i]);
                }else
                  {
                    insertIntoFriendsTable(requestUser.request_from_id , loginUserId);
                  }
            }
          print("updating the friends table");
         // updateFriendsTable(requestUser, friends[i]);
        } else {
          insertIntoFriendsTable(loginUserId, requestUser.request_from_id);
          for(int i=0 ;i<friends.length ;i++)
          {
            if(requestUser.request_from_id == friends[i].usersID)
            {
              updateFriendsTable(loginUserId ,friends[i]);
            }else
            {
              insertIntoFriendsTable(requestUser.request_from_id , loginUserId);
            }
          }

        }
    }

    print("checking the friends table");
    print(friends);
  }

  insertLoginRowIntoFriendsTable(String userId, String friendId) async {
    print("inside the login row");
    final item = Friends(
        usersID: userId,
        friends_list: friendId );
    await Amplify.DataStore.save(item);
    print(item);
  }

  Future<void> updateLoginTable(FriendRequest request, Friends friend) async{
    String friendsList;
    if(friends.isEmpty)
      {
        friendsList = request.request_from_id;
      }else{
       friendsList =friend.friends_list+ "," +request.request_from_id;
    }
    final updatedItem = friend.copyWith(
        friends_list: friendsList);
    await Amplify.DataStore.save(updatedItem);
    print("inside the updated Friend Table");
    print(friend);
  }

  Future<void> insertIntoFriendsTable(String fromId, String loginuser) async{

    final item = Friends(
        usersID: fromId,
        friends_list:  loginuser);
    await Amplify.DataStore.save(item);
  }

 Future<void> updateFriendsTable(String loginUserId, Friends friend) async {
    String friendsList;
    if(friends.isEmpty)
    {
      friendsList = loginUserId;
    }else{
      friendsList =friend.friends_list+ "," +loginUserId;
    }
    final updatedItem = friend.copyWith(
        friends_list: friendsList);
    await Amplify.DataStore.save(updatedItem);
    print("inside the updated Friend Table");
    print(friend);

  }

  /// This will render all the friends list
  _getFriendsDataList() {
    print("inside the friends tab");
    friendsTable();
    //getFriendsList();
    getAcceptedUserName();
    print(users);
    print("getting the user details");
    if(userFriendObject.isNotEmpty){
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            // Padding(padding: EdgeInsets.only(top: 30)),
            // _getFriendsDataListItem(),
            // Padding(padding: EdgeInsets.only(top: 30)),
            // _getFriendsDataListItem(),
            // Padding(padding: EdgeInsets.only(top: 30)),
            // _getFriendsDataListItem(),
            // Padding(padding: EdgeInsets.only(top: 30)),
            // _getFriendsDataListItem(),
            // Padding(padding: EdgeInsets.only(top: 30)),
            // _getFriendsDataListItem(),
            // Padding(padding: EdgeInsets.only(top: 30)),
            // _getFriendsDataListItem(),
            ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount:userFriendObject.length,
                itemBuilder: (context,index){
                  return displayFriends(userFriendObject[index]);
                }
            ),


          ],
        ),
      );
    }
    else{
      return Container(
        child: Text(
         "No Friends Yet!!! Search friends near by!!",
          //"himaja",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: AppColors.black),
        ),
      );
    }


  }

  displayFriends(Users userFriendObject) {
    print("inside the display method");
    print(userFriendObject.first_name);
    return Row(mainAxisSize: MainAxisSize.max, children: [
      getCommonPadding(
          48,
          6,
          0,
          12,
          Center(
            child: AssetImageWidget(
              image: ImageConstants.IC_FATHER,
              height: 40,
              width: 40,
            ),
          )),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getCommonPadding(
            0,
            6,
            0,
            27,
            Text(
             userFriendObject.first_name + "" + userFriendObject.last_name,
              //"himaja",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black),
            ),
          ),
          getCommonPadding(
            0,
            3,
            0,
            27,
            Text(
              'London, UK',
              style: TextStyle(fontSize: 12, color: AppColors.black_50),
            ),
          ),
        ],
      ),
      Spacer(),
      _getIUnFriendButton(),
      Padding(padding: EdgeInsets.only(right: 30))
    ]);
  }

  getAcceptedUserName() {
    displayTheFriends();
    print("inside the get accepted user name");
         userFriendObject=[];
         for(int i=0;i<intoFriendsList.length ;i++)
         { print(users[i]);
           String friendsId=intoFriendsList[i];
           for(int i=0;i<users.length;i++) {
             if (friendsId == users[i].id) {
               print("inside the if condition method");
               userFriendObject.add(users[i]);
             }
           }
       }
  }

  displayTheFriends() {
    print("Displaying the Friends");
    intoFriendsList=[];
    for(int i=0; i<friends.length;i++)
      {
        String friendid=friends[i].usersID;
        if(friendid==loginUserId)
          {
            var splittingtheList=friends[i].friends_list;
            intoFriendsList=splittingtheList.split(",");

          }
      }
    print(intoFriendsList);
  }

  /// This will render all the friends item
  _getFriendsDataListItem() {
    return Row(mainAxisSize: MainAxisSize.max, children: [
      getCommonPadding(
          48,
          6,
          0,
          12,
          Center(
            child: AssetImageWidget(
              image: ImageConstants.IC_FATHER,
              height: 40,
              width: 40,
            ),
          )),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getCommonPadding(
            0,
            6,
            0,
            27,
            Text(
              'Ali Akbar Khan',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black),
            ),
          ),
          getCommonPadding(
            0,
            3,
            0,
            27,
            Text(
              'London, UK',
              style: TextStyle(fontSize: 12, color: AppColors.black_50),
            ),
          ),
        ],
      ),
      Spacer(),
      _getIUnFriendButton(),
      Padding(padding: EdgeInsets.only(right: 30))
    ]);
  }

  /// This will render all the friends item
  // _getFriendsRequestDataListItem() {
  //   return Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       mainAxisSize: MainAxisSize.max,
  //       children: [
  //         Container(
  //           alignment: Alignment.topLeft,
  //           child: getCommonPadding(
  //               48,
  //               6,
  //               0,
  //               12,
  //               AssetImageWidget(
  //                 image: ImageConstants.IC_FATHER,
  //                 height: 40,
  //                 width: 40,
  //               )),
  //         ),
  //         Expanded(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               getCommonPadding(
  //                 0,
  //                 6,
  //                 0,
  //                 27,
  //                 Text(
  //                   'Ali Akbar Khan',
  //                   style: TextStyle(
  //                       fontSize: 14,
  //                       fontWeight: FontWeight.bold,
  //                       color: AppColors.black),
  //                 ),
  //               ),
  //               getCommonPadding(
  //                 0,
  //                 3,
  //                 0,
  //                 27,
  //                 Text(
  //                   'Hello, I hope you are well. We are both in the same community and have similar interests. Let’s connect and grow the community…',
  //                   style: TextStyle(fontSize: 12, color: AppColors.black_50),
  //                   maxLines: 4,
  //                   overflow: TextOverflow.ellipsis,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         Container(
  //           alignment: Alignment.center,
  //           child: Center(
  //             child: Padding(
  //               padding: const EdgeInsets.only(top: 30.0),
  //               child: AssetImageWidget(
  //                 height: 25,
  //                 width: 25,
  //                 image: ImageConstants.IC_PERSON_CLOSE_CIRCLE,
  //               ),
  //             ),
  //           ),
  //         ),
  //         Padding(padding: EdgeInsets.only(right: 10)),
  //         Center(
  //           child: Padding(
  //             padding: const EdgeInsets.only(top: 30.0),
  //             child: AssetImageWidget(
  //               height: 25,
  //               width: 25,
  //               image: ImageConstants.IC_PERSON_GREEN_CIRCLE,
  //             ),
  //           ),
  //         ),
  //         Padding(padding: EdgeInsets.only(right: 48))
  //       ]);
  // }

  /// This will render all the friends item
  _getFriendsRequestSentDataListItem() {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: getCommonPadding(
                48,
                6,
                0,
                12,
                AssetImageWidget(
                  image: ImageConstants.IC_FATHER,
                  height: 40,
                  width: 40,
                )),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getCommonPadding(
                  0,
                  6,
                  0,
                  27,
                  Text(
                    "",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black),
                  ),
                ),
                getCommonPadding(
                  0,
                  3,
                  0,
                  27,
                  Text(
                    'Hello, I hope you are well. We are both in the same community and have similar interests. Let’s connect and grow the community…',
                    style: TextStyle(fontSize: 12, color: AppColors.black_50),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: AssetImageWidget(
                  height: 25,
                  width: 25,
                  image: ImageConstants.IC_PERSON_CLOSE_CIRCLE,
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(right: 48))
        ]);
  }


  /// This will render search bar

  _getFriendSearchBar() {
    FocusNode focusNode = FocusNode();
    TextEditingController _controller = new TextEditingController();
    return getCommonPadding(
        48,
        17,
        0,
        48,
        Container(
            height: 35,
            decoration: BoxDecoration(
              color: AppColors.GREY_KIND_40,
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            child:GestureDetector(
                onTap: (){
                  _navigatetoFriendSearch();
                  //Navigation.intent(context, AppRoutes.CREATE_POST_SCREEN);
                },//=> widget.callBack(),
                child: Center(
                  child: getCommonPadding(
                      15,
                      3,
                      3,
                      15,
                      Row(
                        children: [
                          Center(
                            child: AssetImageWidget(
                              image: ImageConstants.IC_SEARCH,
                              height: 20,
                              width: 20,
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: getCommonPadding(
                                11,
                                15,
                                0,
                                0,
                                TextFormField(
                                  showCursor: true,
                                  keyboardType: TextInputType.text,
                                  controller: _controller,
                                  focusNode: focusNode,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Search friend',
                                    hintStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.black),
                                  ),
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.black),
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                ))),
        );

  }

  _navigatetoFriendSearch(){
    print("inside navigate to friend search");
    print(widget.sessionUser.first_name);
    Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => FriendSearch(sessionUser:widget.sessionUser),
        )
    );
  }

  /// for Rendering the tab bar for friends screen
  _getFriendsTabBar() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 22),
        child: Container(
          width: 350,
          alignment: Alignment.topCenter,
          child: TabBar(
            controller: _tabFriendsController,
            labelColor: AppColors.black,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 2, color: AppColors.green),
              insets: EdgeInsets.symmetric(horizontal: 12),
            ),
            tabs: [
              TabStyleWidget(
                text: "Friends -" + userFriendObject.length.toString(),
              ),
              TabStyleWidget(
                text: "Request -" + RequestUsersList.length.toString(),
              ),
              TabStyleWidget(
                text: "Sent -" + SentUsersList.length.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///This will render unfriedn button on screen
  _getIUnFriendButton() {
    return RoundedButtonWidget(
      text: AppTexts.UNFRIEND,
      callBack: () {
        // setState(() {
        //   _isInEditMode = true;
        // });
      },
    );
  }

  Future<List<FriendRequest>> friendRequestList() async{
    try{
      friendRequest = await Amplify.DataStore.query(FriendRequest.classType );
      print(friendRequest);
      print("Inside the Friend Request in friends tab");
     return friendRequest;
    }catch(e)
    {

    }
  }

  Future<List<Users>> getListOfUsers() async {
    try {
      users = await Amplify.DataStore.query(Users.classType);
      print("list of users");
      print(users);
      return users;
    }catch(e)
    {

    }
  }

  ///Create a common padding widget for the About Us View
  Widget getCommonPadding(double left, double top, double bottom, double right, Widget widget) {
    return Padding(
      padding:
      EdgeInsets.only(left: left, top: top, bottom: bottom, right: right),
      child: widget,
    );
  }

}
