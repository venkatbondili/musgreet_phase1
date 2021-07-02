import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/action_button_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/drop_down_text_field.dart';
import 'package:mus_greet/main.dart';
import 'package:mus_greet/models/UserEducation.dart';
import 'package:mus_greet/models/UserProfile.dart';
import 'package:mus_greet/models/Users.dart';
import 'package:amplify_flutter/amplify.dart';

class AddEducationScreen extends StatefulWidget {
  Users sessionUser;
  AddEducationScreen({this.sessionUser});
  @override
  _AddEducationScreenState createState() => _AddEducationScreenState();
}

class _AddEducationScreenState extends State<AddEducationScreen> {
  final List<Widget> fieldList = List.empty(growable: true);
  List<UserEducation> userEducation;
  //List<Users> user;
  String college;
  String degree;
  String addDateFrom;
  String addDateTo;
  String loggedInUser;
  int count=0;
  final _educationKey = GlobalKey<FormState>();
  final _degreekey = GlobalKey<FormState>();
  final _fromKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    loggedInUser =widget.sessionUser.id;
    education();
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
            _getListOfInfo(),
            CustomSpacerWidget(
              height: 40,
            ),
            fieldList.length >= 0
                ? ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: fieldList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          DottedLine(
                            dashColor: AppColors.vertical_divider,
                          ),
                          CustomSpacerWidget(
                            height: 30,
                          ),
                          _getListOfInfo(),
                          CustomSpacerWidget(
                            height: 30,
                          ),
                        ],
                      );
                    })
                : Container(),
            _getAddButton(),
            CustomSpacerWidget(
              height: 40,
            ),
            _getSaveButton(),
          ],
        ),
      ),
    );
  }

  _getListOfInfo() {
    return Column(
      children: [
        Container(
          child: Form(
            key: _educationKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                _getSchoolCollegeDropDown(),
              ],
            ),
          ),
        ),

        //_getSchoolCollegeDropDown(),
        CustomSpacerWidget(
          height: 15,
        ),
       // _getDegreeDropDown(),
        Container(
          child: Form(
            key: _degreekey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                _getDegreeDropDown(),
              ],
            ),
          ),
        ),
        CustomSpacerWidget(
          height: 15,
        ),
        //_getFromAndToDates(),
        Container(
          child: Form(
            key: _fromKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                _getFromAndToDates(),
              ],
            ),
          ),
        ),
      ],
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
            AppTexts.ADD_EDUCATION,
            style: TextStyle(
              fontFamily: FontConstants.FONT,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 17,
          child: GestureDetector(
            onTap: ()=> Navigation.back(context),
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

  _getSchoolCollegeDropDown() {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: DropDownTextField(
        fieldName: AppTexts.ADD_YOUR_SCHOOL_COLLEGE,
        data: AppTexts.COLLEGE_CATEGORIES,
        callBack: (val) {
          print(val);
          college =val;
        },
      ),
    );
  }

  _getDegreeDropDown() {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: DropDownTextField(
        fieldName: AppTexts.ADD_YOUR_DEGREE,
        data: AppTexts.DEGREE_CATEGORIES,
        callBack: (val) {
          print(val);
          degree=val;
        },
      ),
    );
  }

  _getFromAndToDates() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Container(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: DropDownTextField(
                fieldName: AppTexts.ADD_FROM,
                data: AppTexts.DATES_CATEGORIES,
                callBack: (val) {
                  print(val);
                  addDateFrom=val;
                },
              ),
            ),
          ),
          CustomSpacerWidget(
            width: 15,
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: DropDownTextField(
                fieldName: AppTexts.ADD_TO,
                data: AppTexts.DATES_CATEGORIES,
                callBack: (val) {
                  print(val);
                  addDateTo=val;
                },
              ),
            ),
          ),
        ],
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
          AppTexts.ADD_MORE,
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
              print("inside the call back");
              if (_educationKey.currentState.validate()) {
                // educationList(widget.sessionUser);
                // Navigator.pop(context, true);
                if(_degreekey.currentState.validate())
                  {
                     if(_fromKey.currentState.validate())
                       {
                         educationList(widget.sessionUser);
                          Navigator.pop(context, true);
                       }
                  }
                 }else  if(_degreekey.currentState.validate())
                       {
                         if(_fromKey.currentState.validate())
                         {
                           educationList(widget.sessionUser);
                           Navigator.pop(context, true);
                         }
                       }else
                         {
                           if(_fromKey.currentState.validate())
                           {
                             educationList(widget.sessionUser);
                             Navigator.pop(context, true);
                           }
                         }
                },
            text: AppTexts.SAVE,
            isFilled: true,
          ),
        ),
      ],
    );
  }

  educationList(Users sessionUser)
  {

    print("inside the educationlist method");
    if(userEducation.isEmpty)
      {
        print("inside the create method");
        createUserEducationTable(sessionUser);
      }else
        {
          for(int i=0;i<userEducation.length;i++)
          {
            if (loggedInUser== userEducation[i].usersID) {
              count ++;
              print("inside the callback method");
              updateUserEducation(widget.sessionUser);
            }
          }
        }

    if(count==0)
      {
        print("if logged in user is not present in education table");
        createUserEducationTable(sessionUser);
      }
  }

  _handleOnTap() {
    fieldList.add(_getListOfInfo());
    setState(() {});
  }


  Future<void> education() async
  {
    try {
      userEducation= await Amplify.DataStore.query(UserEducation.classType);
      print(userEducation);
      print("inside the education");
    }catch(e)
    {
      print("Could not query DataStore: " + e);
    }
  }

  updateUserEducation(Users sessionUser) async{
    print("inside the updated education");
    final updatedItem = userEducation[0].copyWith(
        institution: college,
        course: degree,
        from: addDateFrom,
        to: addDateTo,
        usersID: sessionUser.id);
    await Amplify.DataStore.save(updatedItem);
  }

  createUserEducationTable(Users sessionUser) async{
    print(college + "" +degree + " " + addDateFrom + "" + addDateTo);
    final item = UserEducation(
        institution: college,
        course: degree,
        from: addDateFrom,
        to: addDateTo,
       usersID :sessionUser.id);
    await Amplify.DataStore.save(item);
    await Future.delayed(Duration(seconds: 5));
  }
}
