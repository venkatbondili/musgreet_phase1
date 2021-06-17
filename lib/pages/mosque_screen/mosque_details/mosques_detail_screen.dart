import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/dot_indicator.dart';
import 'package:mus_greet/core/widgets/following_mosque_list_grid.dart';
import 'package:mus_greet/core/widgets/tab_style_widget.dart';
import 'package:mus_greet/models/Facilitiesmaster.dart';
import 'package:mus_greet/models/ModelProvider.dart';
import 'package:mus_greet/pages/mosque_screen/mosque_details/contact_tab/contect_tab.dart';
import 'package:mus_greet/pages/mosque_screen/mosque_details/facilities_tab/facilities_tab.dart';
import 'package:mus_greet/pages/mosque_screen/mosque_details/home_tab/home_tab.dart';
import 'package:mus_greet/pages/profile/view_profile_screen/about_tab/about_tab.dart';
import 'package:mus_greet/pages/profile/view_profile_screen/friend_tab/friend_tab.dart';
import 'package:mus_greet/pages/profile/view_profile_screen/interest_tab/interest_tab.dart';

import 'mosque_about_tab/mosque_about_tab.dart';

class MosquesDetailsScreen extends StatefulWidget {
  final Function backCallBack;

  const MosquesDetailsScreen({Key key, this.backCallBack,}) : super(key: key);
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
    return FutureBuilder<List<Mosque>>(
      future: getMosque(),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            mosque = snapshot.data;
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
              HomeTab(mosque: mosque),
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
                    widget.backCallBack();
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
                _getMemberDetails(),
                CustomSpacerWidget(
                  width: 5,
                ),
                Flexible(
                  child: _getRemoveButton(),
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

  _getRemoveButton() {
    return MosqueFollowButton(
      radius: 30,
      callBack: () {
        print("Handle CallBack");
      },
      text: AppTexts.FOLLOW_TEXT,
      isFilled: false,
    );
  }

  _getMemberDetails() {
    return Padding(
      padding: const EdgeInsets.only(left: 28.0, top: 5.5, right: 28.0),
      child: Row(
        children: [
          _getMemberImage(),
          CustomSpacerWidget(
            width: 10,
          ),
          _getNameAndRelationShip(),
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

  _getNameAndRelationShip() {
    return Padding(
      padding: const EdgeInsets.only(top: 3.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.MOSQUE_NAME,
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
                AppTexts.MOSQUE_LOCATION,
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

}

