import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/action_button_widget.dart';
import 'package:mus_greet/core/widgets/advance_friend_search_context_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/drop_down_text_field.dart';
import 'package:mus_greet/models/MasterIntrests.dart';
import 'package:mus_greet/models/ModelProvider.dart';
import 'package:mus_greet/pages/add_skills_screen/add_skills_screen.dart';
import 'package:mus_greet/pages/languages_screen/select_languages.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class SearchSkillsScreen extends StatefulWidget {
  @override
  _SearchSkillsScreenState createState() => _SearchSkillsScreenState();
}

class _SearchSkillsScreenState extends State<SearchSkillsScreen> {
  final List<Widget> fieldList = List.empty(growable: true);
  //var prefs;
  ArgumentClass args;
  String gender = '';
  String age = '';
  //ArgumentSkillsClass S_args;
  //ArgumentLanguageClass L_args;
  List<Users>  Userss =[];
  List<UserProfile> UserProfiles = [];
  List<MasterIntrests> MasterIntrestss = [];
  List<String> SelectedSkillsList =[];
  List<String> SelectedLanguagesList =[];
  List<Users>  genderFilteredUsers = [];
  List<Users>  ageFilteredUsers = [];
  //List<String> StoredSkillsList;
  //List<String> StoredLanguageList;
  @override
  Widget build(BuildContext context) {
    print("Inside Search Skills Screen");
    //_getSharedPreferance();
    ListUsers();
    ListUserProfiles();
    listMasterInterests();
    print("printing args");
    args = ModalRoute.of(context).settings.arguments as ArgumentClass;
    print(args);
    if(args != null ){
      if(args.ListType == "Skills"){
        print("inside args is skills");
        SelectedSkillsList = args.advancedSearchSkillsList;
        SelectedLanguagesList = args.advancedSearchLanguagesList;
        //genderFilteredUsers = args.advancedSearchGenderFilteredUsersList;
        //ageFilteredUsers = args.advancedSearchAgeFilteredUsersList;
        gender = args.gender;
        age = args.age;
        //print("Selected Skills List");
        //print(SelectedSkillsList);
        //print("Selected Languages List");
        //print(SelectedLanguagesList);
        //if(prefs != null) {
          //print("inside skills list prefs");
          //prefs.setStringList('my_skills_list_key', SelectedSkillsList);
          ////final List<String> StoredSkillsList = prefs.getStringList('my_skills_list_key') ?? [];
        //}
        //else print("prefs is null");
      }
      if(args.ListType == "Languages"){
        print("inside args is languages");
        SelectedSkillsList = args.advancedSearchSkillsList;
        SelectedLanguagesList = args.advancedSearchLanguagesList;
        //genderFilteredUsers = args.advancedSearchGenderFilteredUsersList;
        //ageFilteredUsers = args.advancedSearchAgeFilteredUsersList;
        gender = args.gender;
        age = args.age;
        //print("Selected Skills List");
        //print(SelectedSkillsList);
        //print("Selected Languages List");
        //print(SelectedLanguagesList);
        //if(prefs != null){
         // print("inside language list prefs");
          //prefs.setStringList('my_languages_list_key', SelectedLanguagesList);
          ////final List<String> StoredLanguageList = prefs.getStringList('my_languages_list_key') ?? [];
        //}
      }
    }
    else{
      print("No skills or languages selected");
    }

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
            _getGenderAndAge(),
            CustomSpacerWidget(
              height: 10,
            ),
            _getLanguages(),
            CustomSpacerWidget(
              height: 10,
            ),
            _getSkills(),
            CustomSpacerWidget(
              height: 250,
            ),
            _getAddAndCancelButton(),
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
            AppTexts.SEARCH_SKILLS,
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

  _getGenderAndAge() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Container(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: DropDownTextField(
                fieldName: AppTexts.GENDAR,
                data: AppTexts.GENDER,
                callBack: (val) {
                  gender = val;
                  //genderFilteredUsers = _getUserByGender(val);
                  //print(genderFilteredUsers.length);
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
                fieldName: AppTexts.AGE,
                data: AppTexts.DATES_CATEGORIES,
                callBack: (val) {
                  age = val;
                  //ageFilteredUsers = _getUserByAge(val);
                  //print(ageFilteredUsers.length);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getLanguages(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text( "Select",
          style: TextStyle(
            fontFamily: FontConstants.FONT,
            fontSize: 15,
            fontWeight: FontWeight.w900,
            color: AppColors.black,
          ),
        ),
        CustomSpacerWidget(
          height: 8,
        ),
        GestureDetector(
          onTap: (){
            ///Get Languages list here
            print("TEST");

            Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => LanguagesScreen(callingScreen: "AdvancedSearch",skillsList: SelectedSkillsList,
                      //genderFilteredUsers: genderFilteredUsers, ageFilteredUsers: ageFilteredUsers
                      gender: gender,age: age),
                )
            );
            //Navigation.intent(context, AppRoutes.LANGUAGES_SCREEN);
          },
          child: Material(
            elevation: 5,
            shadowColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white,
                border: Border.all(color: AppColors.vertical_divider, width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomSpacerWidget(height: 5,),
                      Text(
                        AppTexts.LANGUAGES,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: AppColors.black_50,
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: CustomSpacerWidget(
                      width: 5,
                    ),
                  ),
                  CustomSpacerWidget(width: 5,),
                  _getNextButton(),
                ],
              ),
            ),
          ),
        ),
      ],);
  }

  _getSkills(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text( "Select Skills",
          style: TextStyle(
            fontFamily: FontConstants.FONT,
            fontSize: 15,
            fontWeight: FontWeight.w900,
            color: AppColors.black,
          ),
        ),
        CustomSpacerWidget(
          height: 8,
        ),
        GestureDetector(
          onTap: (){
            ///Get Skills list here
            //print("TEST");
            Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => AddSkillsScreen(callingScreen: "AdvancedSearch", languagesList: SelectedLanguagesList,
                      //genderFilteredUsers: genderFilteredUsers, ageFilteredUsers:ageFilteredUsers
                  gender: gender, age: age),
                )
            );
            //Navigation.intent(context, AppRoutes.ADD_SKILLS);
          },
          child: Material(
            elevation: 5,
            shadowColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white,
                border: Border.all(color: AppColors.vertical_divider, width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomSpacerWidget(height: 5,),
                      Text(
                        "ChildCare, Clothing, Entertainment...",
                        //AppTexts.LANGUAGES,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: AppColors.black_50,
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: CustomSpacerWidget(
                      width: 5,
                    ),
                  ),
                  CustomSpacerWidget(width: 5,),
                  _getNextButton(),
                ],
              ),
            ),
          ),
        ),
      ],);
  }

  _getNextButton() {
    return Image.asset(
      ImageConstants.IC_FORWARD,
      height: 13,
      width: 13,
    );
  }

  _getAddAndCancelButton() {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8),
      child: Row(
        children: [
          ActionButtonWidget(
            text: AppTexts.CANCEL,
            isFilled: false,
            callBack: () {
              Navigation.back(context);
            },
          ),
          CustomSpacerWidget(width: 20,),
          Expanded(
            child: ActionButtonWidget(
              text: AppTexts.SEARCH,
              isFilled: true,
              callBack: () {
                _getFilteredUser();
                //_getSkillsSearchFilteredUsers(Userss);
                //Navigation.back(context);
                print("Search");
              },
            ),
          ),
        ],
      ),
    );
  }

Future<void> ListUsers() async{
  try {
    Userss = await Amplify.DataStore.query(Users.classType);
    print(Userss.length);
    await Future.delayed(Duration(milliseconds: 500));
    //ListUserProfiles();
    //listMasterInterests();
    //updateUser();
  } catch (e) {
    print("Could not query DataStore: " + e);
  }

}

Future<void> ListUserProfiles() async {
  try {
    UserProfiles = await Amplify.DataStore.query(UserProfile.classType);
    print(UserProfiles.length);
    await Future.delayed(Duration(seconds: 1));
  } catch (e) {
    print("Could not query DataStore: " + e);
  }
}

Future<void> listMasterInterests() async {
    try {
      MasterIntrestss = await Amplify.DataStore.query(MasterIntrests.classType);
      print(MasterIntrestss.length);
      await Future.delayed(Duration(seconds: 1));
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }


_getUserByGender(String gender) {
    List<Users> genderFilteredList=[];
    if(Userss.isNotEmpty){
      for(var user in Userss){
        if(user.gender == gender){
          genderFilteredList.add(user);
        }
      }
    }
    else {
      print("No users");
    }
    print("GenderFilteredList Length");
    print(genderFilteredList.length);
    return genderFilteredList;
}

_getUserByAge(String age){
    List<Users> ageFilteredList=[];
    if(Userss.isNotEmpty){
      for(var user in Userss){
        if(user.age == age){
          ageFilteredList.add(user);
        }
      }
    }
    else{
      print("No users");
    }
    print("age Filtered list length");
    print(ageFilteredList.length);
    return ageFilteredList;
}

_getSkillsSearchFilteredUsers(List<Users> Userss) {
    print("inside get Skills SearchFiltered Users");
    List<Users> A_G_FilteredList = [];
    print("Print selected Skills");
    print(SelectedSkillsList);
    print("print selected languages");
    print(SelectedLanguagesList);
    if(Userss.isEmpty){
      print("Users list is empty");
    }
    else{
      if(gender == '' && age == ''){
        A_G_FilteredList = Userss;
      }
      else{
        if (gender != ''){
          genderFilteredUsers = _getUserByGender(gender);
        }
        if(age != ''){
          ageFilteredUsers = _getUserByAge(age);
        }
      }
      print("print Gender filtered users list");
      print(genderFilteredUsers.length);
      print("print age filtered users list");
      print(ageFilteredUsers.length);
      if(genderFilteredUsers.isNotEmpty && ageFilteredUsers.isNotEmpty){
        for(var g_user in genderFilteredUsers){
          for(var a_user in ageFilteredUsers){
            if(g_user.id == a_user.id){
              A_G_FilteredList.add(g_user);
            }
          }
        }
      }
      else{
        if(genderFilteredUsers.isNotEmpty){
          A_G_FilteredList = genderFilteredUsers;
        }else {
          if(ageFilteredUsers.isNotEmpty){
            A_G_FilteredList = ageFilteredUsers;
          }
        }
      }
    }
    print("A_G FILTERED LIST");
    print(A_G_FilteredList.length);
    _getUserByLanguageAndSkills(A_G_FilteredList);
}

_getSharedPreferance() async{
  //print("inside sharedPreferance");
  //prefs = await SharedPreferences.getInstance();
  //await Future.delayed(Duration(milliseconds: 500));
  //print("after getting instance of shared preferance ");
  //print(prefs);
  ////print(prefs.getString('my_string_key') ?? '');
//}

}

_getUserByLanguageAndSkills(List<Users> a_g_filteredList) {
    print("inside get User by Language and Skills");
    print(a_g_filteredList.length);
    //print(SelectedLanguagesList);
    List<Users> ResultList = [];
    List<String> userLanguagesList = [];
    int count = 0;
    String UserProfileId = "";
    bool Status = false;
    if(SelectedLanguagesList.isEmpty && SelectedSkillsList.isEmpty){
      print("when both skills and languages are empty");
      ResultList = a_g_filteredList;
    }
    else{
      if(SelectedLanguagesList.isNotEmpty){
        print("when languages list is not empty");
        if(a_g_filteredList != null && UserProfiles.isNotEmpty){
          for(var agUser in a_g_filteredList){
            count = 0;
            Status = false;
            for(var uProf in UserProfiles){
              if(uProf.usersID == agUser.id){
                userLanguagesList = uProf.languages_spoken.split(",");
                for(var l in userLanguagesList){
                  for(var sl in SelectedLanguagesList){
                    if(l.toLowerCase() == sl.toLowerCase()){
                      count++;
                    }
                  }
                }
              }
              if(count >0){
                Status = _getSkillsFilteredUser(uProf,SelectedSkillsList);
                if(Status = true){
                  ResultList.add(agUser);
                }
              }
            }
          }
        }
        else{
          if(SelectedLanguagesList.isEmpty && a_g_filteredList.isNotEmpty){
            for(var agUser in a_g_filteredList){
              for(var uProf in UserProfiles){
                if(uProf.usersID == agUser.id){
                  Status = _getSkillsFilteredUser(uProf, SelectedSkillsList);
                }
              }
              if(Status == true){
                ResultList.add(agUser);
              }
            }
          }
          //print("No user exists");
        }
      }
    }

    print("Result list");
    print(ResultList.length);
    //print(a_g_filteredList[0].User_Profiles[0].skills);

}

_getSkillsFilteredUser(UserProfile uProf, List<String> selectedSkillsList) {
  bool status = false;
  int count = 0;
  List<String> UserSkillsList = [];

  if(selectedSkillsList.isNotEmpty && uProf != null){
      UserSkillsList = uProf.skills.split(',');
      for(var ss in SelectedSkillsList){
        for(var us_id in UserSkillsList){
          for(var ms in MasterIntrestss){
            if(us_id == ms.id){
              if(ss.toLowerCase() == ms.intrest_name.toLowerCase()){
                count++;
              }
            }
          }
        }
      }
      if (count > 0){
        status = true;
      }

  }
  else{
    status = false;
  }
  return status;
}

_getFilteredUser(){
    print("inside get filtered user");
    print(Userss.length);
    print(UserProfiles.length);
    print(MasterIntrestss.length);
    bool status = false;
    bool lStatus = false;
    bool sStatus = false;
    List<Users> FinalList = [];
    /// When gender is selected go inside
    if(gender != ''){
      for(var user in Userss){
        if(user.gender == gender){
          if(age == '' && SelectedSkillsList.isEmpty && SelectedLanguagesList.isEmpty){
            FinalList.add(user);
          }
          else{
            if(age != ''){
              if(user.age == age){
                if(SelectedLanguagesList.isNotEmpty){
                  lStatus = _getUSerByLanguage(user, SelectedLanguagesList, UserProfiles);
                  if(lStatus == true && SelectedSkillsList.isNotEmpty){
                    sStatus = _getUserBySkill(user,SelectedSkillsList,UserProfiles);
                    if(sStatus == true){
                      FinalList.add(user);
                    }
                  }
                }
                else{
                  if(SelectedSkillsList.isNotEmpty){
                    sStatus = _getUserBySkill(user,SelectedSkillsList,UserProfiles);
                    if(sStatus == true){
                      FinalList.add(user);
                    }
                  }
                }
              }
            }
            else{
              if(SelectedLanguagesList.isNotEmpty){
                lStatus = _getUSerByLanguage(user, SelectedLanguagesList, UserProfiles);
                if(lStatus == true && SelectedSkillsList.isNotEmpty){
                  sStatus = _getUserBySkill(user,SelectedSkillsList,UserProfiles);
                  if(sStatus == true){
                    FinalList.add(user);
                  }
                }
              }
              else{
                if(SelectedSkillsList.isNotEmpty){
                  sStatus = _getUserBySkill(user,SelectedSkillsList,UserProfiles);
                  if(sStatus == true){
                    FinalList.add(user);
                  }
                }
                else{

                }
              }
            }
          }
        }
      }
    }
    ///when gender not selected
    else{
      ///check for age filter if age given go inside
      if(age != ''){
        for(var user in Userss){
          if(user.age == age){
            if(SelectedLanguagesList.isNotEmpty){
              lStatus = _getUSerByLanguage(user, SelectedLanguagesList, UserProfiles);
              if(lStatus == true && SelectedSkillsList.isNotEmpty){
                sStatus = _getUserBySkill(user,SelectedSkillsList,UserProfiles);
                if(sStatus == true){
                  FinalList.add(user);
                }
              }
            }
            else{
              if(SelectedSkillsList.isNotEmpty){
                sStatus = _getUserBySkill(user,SelectedSkillsList,UserProfiles);
                if(sStatus == true){
                  FinalList.add(user);
                }
              }
            }
          }
        }
      }
      /// if age not given
      else{
        /// check for languages filter
        if(SelectedLanguagesList.isNotEmpty){
          print("inside language list");
          for(var user in Userss){
            if(SelectedLanguagesList.isNotEmpty){
              lStatus = _getUSerByLanguage(user, SelectedLanguagesList, UserProfiles);
              if(lStatus == true && SelectedSkillsList.isNotEmpty){
                sStatus = _getUserBySkill(user,SelectedSkillsList,UserProfiles);
                if(sStatus == true){
                  FinalList.add(user);
                }
              }
              else{
                if(lStatus == true && SelectedSkillsList.isEmpty){
                  FinalList.add(user);
                }
              }
            }
            else{
              if(SelectedSkillsList.isNotEmpty){
                sStatus = _getUserBySkill(user,SelectedSkillsList,UserProfiles);
                if(sStatus == true){
                  FinalList.add(user);
                }
              }
            }
          }
        }
        /// if no languages selected
        else{
          /// select for skills filter
          if(SelectedSkillsList.isNotEmpty){
            for(var user in Userss){
              sStatus = _getUserBySkill(user,SelectedSkillsList,UserProfiles);
              if(sStatus == true){
                FinalList.add(user);
              }
            }
          }
          /// when skills not given
          else{
            FinalList = Userss;
          }
        }
      }
    }
    print("Final list of filtered users");
    print(FinalList.length);
}

_getUSerByLanguage(Users user, List<String> selectedLanguagesList, List<UserProfile> userProfiles,) {
    bool status = false;
    List<String> languageList = [];
    if(user != null && selectedLanguagesList.isNotEmpty && userProfiles != null){
      print("inside get user by language");
      for(var uProfile in userProfiles){
        if(uProfile.usersID == user.id){
          languageList = uProfile.languages_spoken.split(',');
          for(var language in selectedLanguagesList){
            for(var l in languageList){
              if(language.toLowerCase() == l.toLowerCase()){
                status = true;
              }
            }
          }
        }
      }
    }
    return status;
}

_getUserBySkill(Users user, List<String> selectedSkillsList, List<UserProfile> userProfiles) {
  bool status = false;
  int count = 0;
  List<String> UserSkillsList = [];
  if(user != null && selectedSkillsList.isNotEmpty && userProfiles != null) {
    for(var userProfile in userProfiles){
      if(user.id == userProfile.usersID){
        UserSkillsList=userProfile.skills.split(',');
        for(var ss in SelectedSkillsList){
          for(var us_id in UserSkillsList){
            for(var ms in MasterIntrestss){
              if(us_id == ms.id){
                if(ss.toLowerCase() == ms.intrest_name.toLowerCase()){
                  count++;
                }
              }
            }
          }
        }
        if (count > 0){
          status = true;
        }
        else{
          status = false;
        }
      }
    }
  }
  return status;
}


}
class ArgumentClass {
  final List<String> advancedSearchSkillsList;
  final List<String> advancedSearchLanguagesList;
  //final List<Users> advancedSearchGenderFilteredUsersList;
  //final List<Users> advancedSearchAgeFilteredUsersList;
  final String gender;
  final String age;
  final String ListType;
  ArgumentClass(this.advancedSearchSkillsList, this.advancedSearchLanguagesList,
      //this.advancedSearchGenderFilteredUsersList,this.advancedSearchAgeFilteredUsersList,
      this.gender,this.age,this.ListType);
  //ArgumentClass(this.advancedSearchSkillsList,this.ListType);

}

class ArgumentSkillsClass {
  //final List<String> advancedSearchSkillsList;
  //final List<String> advancedSearchLanguagesList;
  //final String ListType;
  //ArgumentClass(this.advancedSearchSkillsList, this.advancedSearchLanguagesList, this.ListType);
  //ArgumentSkillsClass(this.advancedSearchSkillsList,this.ListType);

}

class ArgumentLanguageClass {
  //final List<String> advancedSearchSkillsList;
  //final List<String> advancedSearchLanguagesList;
  //final String ListType;
  //ArgumentClass(this.advancedSearchSkillsList, this.advancedSearchLanguagesList, this.ListType);
  //ArgumentLanguageClass(this.advancedSearchLanguagesList,this.ListType);

}