import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/rounded_button_widget.dart';
import 'package:mus_greet/core/widgets/tab_style_widget.dart';
import 'package:mus_greet/models/FriendRequest.dart';
import 'package:mus_greet/models/Users.dart';
import 'package:mus_greet/models/Users.dart';


class FriendTab extends StatefulWidget {
  @override
  _FriendTabState createState() => _FriendTabState();
}

class _FriendTabState extends State<FriendTab> with SingleTickerProviderStateMixin {

  TabController _tabFriendsController;
  List<FriendRequest> friendRequest;
   String loginUserId="19d1eb65-ae18-4619-b94b-4670abfd5196";
   List<Users> users;
   List<String> FRIENDSLIST=[];
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

    if(FRIENDSLIST.isEmpty) {
      getListOffriends();
    }
    friendRequestList();
    getUserOfFriends();
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
          _getFriendsSentDataList(),
        ],
      ),
    );
  }

  /// This will render all the friends request list
  _getFriendsRequestDataList() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(top: 30)),
          _getFriendsRequestDataListItem(),
          Padding(padding: EdgeInsets.only(top: 30)),
          _getFriendsRequestDataListItem(),
          Padding(padding: EdgeInsets.only(top: 30)),
          _getFriendsRequestDataListItem(),
          Padding(padding: EdgeInsets.only(top: 30)),
          _getFriendsRequestDataListItem(),
          Padding(padding: EdgeInsets.only(top: 30)),
          _getFriendsRequestDataListItem(),
          Padding(padding: EdgeInsets.only(top: 30)),
          _getFriendsRequestDataListItem(),
        ],
      ),
    );
  }

  /// This will render all the friends request list
  _getFriendsSentDataList() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget> [
          ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: <Widget> [
              new ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount:FRIENDSLIST.length,
                  itemBuilder: (context,index){
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
                                    FRIENDSLIST[index],
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

              ),
            ],
          )
        ],
      ),
    );
  }

  /// This will render all the friends list
  _getFriendsDataList() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(top: 30)),
          _getFriendsDataListItem(),
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
        ],
      ),
    );
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
  _getFriendsRequestDataListItem() {
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
          Padding(padding: EdgeInsets.only(right: 10)),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: AssetImageWidget(
                height: 25,
                width: 25,
                image: ImageConstants.IC_PERSON_GREEN_CIRCLE,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(right: 48))
        ]);
  }

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
            )));
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
                text: AppTexts.FRIENDS_TEXT_6,
              ),
              TabStyleWidget(
                text: AppTexts.REQUEST_4,
              ),
              TabStyleWidget(
                text: FRIENDSLIST.length.toString(),
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


  Future<void> friendRequestList() async{
    try{
      friendRequest = await Amplify.DataStore.query(FriendRequest.classType);
      print(friendRequest[8]);
      print(friendRequest.length);
      print("Friends request inside");
     // return friendRequest;
      print("Inside the Friend Request");
     // return friendRequest;
    }catch(e)
    {

    }
  }
  
  Future<void> getUserOfFriends() async {
    users = await Amplify.DataStore.query(Users.classType);
    print(Users);
   // return users;
    //return friendRequest;
  }
  
  getListOffriends()
  {
    for(int i=0;i<friendRequest.length ;i++)
      {print("inside the for loop");
        String friendsId =friendRequest[i].request_to_id;
        for(int i=0;i<users.length ;i++) {
          if (friendsId == users[i].getId()) {
            FRIENDSLIST.add(users[i].first_name + "" + users[i].last_name);
          }
        }
      }
  }



  ///Create a common padding widget for the About Us View
  Widget getCommonPadding(
      double left, double top, double bottom, double right, Widget widget) {
    return Padding(
      padding:
      EdgeInsets.only(left: left, top: top, bottom: bottom, right: right),
      child: widget,
    );
  }
}
