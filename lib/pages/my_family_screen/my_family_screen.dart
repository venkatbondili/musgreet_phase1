import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/action_button_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/drop_down_text_field.dart';
import 'package:mus_greet/core/widgets/family_member_card_widget.dart';
import 'package:mus_greet/core/widgets/my_family_text_field_heading_widget.dart';
import 'package:mus_greet/main.dart';
import 'package:mus_greet/models/UserFamily.dart';
import 'package:mus_greet/models/UserProfile.dart';
import 'package:mus_greet/models/Users.dart';
import 'package:amplify_flutter/amplify.dart';

class MyFamilyScreen extends StatefulWidget {
  Users sessionUser;
  MyFamilyScreen({this.sessionUser});
  @override
  _MyFamilyScreenState createState() => _MyFamilyScreenState();
}

class _MyFamilyScreenState extends State<MyFamilyScreen> {
  final TextEditingController _controller = TextEditingController();
  var _relationShip;
  List<UserProfile> userProfile;
  List<Users> user;
  List<UserFamily> userFamily;
  List<String> name;
  List<String> relationship;
  String userid;

  final List<RelationShipData> members = [];
  final _familyRelation = GlobalKey<FormState>();
  final _nameOffamily =GlobalKey<FormState>();

  @override
  void initState() {
    //members.add(RelationShipData(name: "Ali Akbar Khan",relationShip: "Father"),);
    //members.add(RelationShipData(name: _controller.text,relationShip: _relationShip),);
   // super.initState();
  }

  @override
  Widget build(BuildContext context) {
    userid=widget.sessionUser.id;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: _getBody(),
      ),
    );
  }

  _getBody() {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 30),
        child: Column(
          children: [
            _getHeaderAndBack(),
            CustomSpacerWidget(
              height: 30,
            ),
            _getFamilyIcons(),
            CustomSpacerWidget(
              height: 40,
            ),
            Container(
              child: Form(
                key: _familyRelation,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    _getFamilyMemberRelationShip(),
                  ],
                ),
              ),
            ),
            //_getFamilyMemberRelationShip(),
            CustomSpacerWidget(
              height: 15,
            ),
            Container(
              child: Form(
                key: _nameOffamily,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    _getNameOfMember(),
                  ],
                ),
              ),
            ),
            //_getNameOfMember(),
            CustomSpacerWidget(
              height: 40,
            ),
            _getAddButton(),
            CustomSpacerWidget(
              height: 40,
            ),
            members.length >= 0
                ? ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return FamilyMemberCardWidget(
                        callBack: () {
                          members.removeAt(index);
                          setState(() {});
                        },
                        relationShip: members[index].relationShip,
                        name: members[index].name,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return CustomSpacerWidget(
                        height: 20,
                      );
                    },
                    itemCount: members.length,
                  )
                : Container(),
            CustomSpacerWidget(
              height: 100,
            ),
            _getSaveButton(),
          ],
        ),
      ),
    );
  }

  _getHeaderAndBack() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          height: 50,
          child: Text(
            AppTexts.MY_FAMILY,
            style: TextStyle(
              fontFamily: FontConstants.FONT,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 17,
          child: GestureDetector(
            onTap: () {
              Navigation.back(context);
            },
            child: AssetImageWidget(
              image: ImageConstants.IC_BACK,
              height: 15,
              width: 25,
            ),
          ),
        ),
      ],
    );
  }

  _getFamilyIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _getIcons(ImageConstants.FAMILY_ONE),
        _getIcons(ImageConstants.FAMILY_TWO),
        _getIcons(ImageConstants.FAMILY_THREE),
        _getIcons(ImageConstants.FAMILY_FOUR),
        _getIcons(ImageConstants.FAMILY_FIVE),
        _getIcons(ImageConstants.FAMILY_SIX),
      ],
    );
  }

  _getFamilyMemberRelationShip() {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: DropDownTextField(
        fieldName: AppTexts.ADD_A_FAMILY_MEMBER,
        data: AppTexts.FAMILY_CATEGORIES,
        callBack: (val) {
          print(val);
          setState(() {
            _relationShip = val;
          });
        },
      ),
    );
  }

  _getNameOfMember() {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: MyFamilyTextFieldHeadingWidget(
        fieldName: AppTexts.FAMILY_MEMBER_NAME,
        controller: _controller,
        hintText: "write the text here",
      ),
    );
  }

  _getAddButton() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () => _handleOnTap(),
          child: Image.asset(
            ImageConstants.IC_CREATE,
            height: 40,
            width: 40,
          ),
        ),
        CustomSpacerWidget(
          height: 5,
        ),
        Text(
          AppTexts.ADD,
          style: TextStyle(
            fontFamily: FontConstants.FONT,
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: AppColors.vertical_divider,
          ),
        )
      ],
    );
  }

  _getSaveButton() {
    return Row(
      children: [
        Expanded(
          child: ActionButtonWidget(
            callBack: () {
             // Navigation.back(context);
              print("updating the database");
              if(_familyRelation.currentState.validate()) {
                if (_nameOffamily.currentState.validate()) {
                  updatingFamilyDataBase();
                  Navigator.pop(context, true);
                }else if(_nameOffamily.currentState.validate())
                  {
                    updatingFamilyDataBase();
                    Navigator.pop(context, true);
                  }
              }
              //   }else {
              //   updatingFamilyDataBase();
              //   Navigator.pop(context, true);
              // }
            },
            text: AppTexts.SAVE,
            isFilled: true,
          ),
        ),
      ],
    );
  }

  _handleOnTap() {
    print("Hello");
    if (_controller.text.isNotEmpty && _relationShip != null) {
      final data =
          RelationShipData(name: _controller.text, relationShip: _relationShip);
      members.add(data);
      setState(() {});
    }
  }

  _getIcons(String image) {
    return Image.asset(
      image,
      height: 35,
      width: 35,
    );
  }

  Future<void> userList() async{
    try {
      user= await Amplify.DataStore.query(Users.classType,where: Users.ID.eq(userid));
    }catch(e)
    {
      print("Could not query DataStore: " + e);
    }
  }

  Future<void> userFamilyList() async{
    try {
      userFamily= await Amplify.DataStore.query(UserFamily.classType );
      print(userFamily[0]);
      for(int i=0;i<user.length;i++) {
        if (user[i].id == userFamily[i].user_id)
        {
          userid=userFamily[i].user_id;
          name.add(userFamily[i].name);
          relationship.add(userFamily[i].relationship);
        }
      }

    }catch(e)
    {
      print("Could not query DataStore: " + e);
    }

  }

  updatingFamilyDataBase() async{
    for(int i=0;i<members.length;i++) {
      final item = UserFamily(
          user_id: userid,
          relationship: members[i].relationShip,
          name: members[i].name);
      await Amplify.DataStore.save(item);
    }
  }

}

class RelationShipData {
  final String name;
  final String relationShip;

  RelationShipData({this.name, this.relationShip});
}
