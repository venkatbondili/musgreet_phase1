// // Amplify Flutter Packages
// import 'package:intl/intl.dart';
//
// import 'dart:convert';
// import 'dart:io';
// //import 'dart:html';
// import 'package:mus_greet/pages/address-verification/address_verification_view.dart';
// import 'package:mus_greet/pages/address-verification/confirm_address_2_view.dart';
// import 'package:mus_greet/pages/address-verification/confirm_address_otp_screen.dart';
// import 'package:mus_greet/pages/address-verification/confirm_address_view.dart';
// import 'package:mus_greet/pages/age/age_registration_page.dart';
// import 'package:mus_greet/pages/final/account_verification_success.dart';
// import 'package:mus_greet/pages/final/community_promise_page.dart';
// import 'package:mus_greet/pages/final/final_step_page.dart';
// import 'package:mus_greet/pages/final/nearly_finished_page.dart';
// import 'package:mus_greet/pages/home_screen/home_screen.dart';
// import 'package:mus_greet/pages/login/login_screen.dart';
// import 'package:mus_greet/pages/otp/components/parent_email_verification_view.dart';
// import 'package:mus_greet/pages/otp/components/phone_otp_view.dart';
// import 'package:mus_greet/pages/otp/components/phone_verification_view.dart';
// import 'package:mus_greet/pages/parent/parent_verification.dart';
// import 'package:mus_greet/pages/profile/view_profile_screen/view_profile_screen.dart';
// import 'package:mus_greet/pages/registration/registration_screen.dart';
// import 'package:mus_greet/pages/smile/time_to_smile_page.dart';
// import 'package:mus_greet/pages/verify_email_screen/verify_email_screen.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:amplify_flutter/amplify.dart';
// //import 'package:amplify_api/amplify_api.dart'; // UNCOMMENT this line once backend is deployed
// import 'package:amplify_datastore/amplify_datastore.dart';
// import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
// import 'package:amplify_storage_s3/amplify_storage_s3.dart';
// // Generated in previous step
// import 'models/Facilitiesmaster.dart';
// import 'models/Languagespoken.dart';
// import 'models/MasterIntrests.dart';
// import 'models/ModelProvider.dart';
// import 'amplifyconfiguration.dart';
//
// import 'package:flutter/material.dart';
// import 'package:mus_greet/pages/add_education_screen/add_education_screen.dart';
// import 'package:mus_greet/pages/add_skills_screen/add_skills_screen.dart';
// import 'package:mus_greet/pages/advanced_search/search_education_screen.dart';
// import 'package:mus_greet/pages/advanced_search/search_faith_interests_screen.dart';
// import 'package:mus_greet/pages/advanced_search/search_interests_screen.dart';
// import 'package:mus_greet/pages/advanced_search/search_skills_screen.dart';
// import 'package:mus_greet/pages/create_post_screen/create_post_screen.dart';
// import 'package:mus_greet/pages/find_mosque/search_mosque.dart';
// import 'package:mus_greet/pages/friend_search/advance_search/friend_advance_search.dart';
// import 'package:mus_greet/pages/friend_search/friend_search.dart';
// import 'package:mus_greet/pages/home/home.dart';
// import 'package:mus_greet/pages/interest_screen/add_skills_images.dart';
// import 'package:mus_greet/pages/interest_screen/interest_screen.dart';
// import 'package:mus_greet/pages/interest_screen/religious_interest_screen.dart';
// import 'package:mus_greet/pages/languages_screen/select_languages.dart';
// import 'package:mus_greet/pages/mosque_screen/advance_search_screen/advance_search_screen.dart';
// import 'package:mus_greet/pages/mosque_screen/mosque_details/mosques_detail_screen.dart';
// import 'package:mus_greet/pages/mosque_screen/mosque_search_list_view/mosque_search_list_view.dart';
// import 'package:mus_greet/pages/my_family_screen/my_family_screen.dart';
// import 'package:mus_greet/pages/splash_screen/splash_screen.dart';
// import 'core/utils/constants.dart';
// import 'core/utils/routes.dart';
// import 'models/UserFamily.dart';
//
//
//
// ///This is the root of our widget tree
// class MyData {
//   final String action;
//   MyData({this.action});
//   List<Users> Userss;
//   TemporalDate date=new TemporalDate(DateTime.now());
// //TemporalDate nextDate=new TemporalDate(DateTime.);
//   DateFormat dateFormat=new DateFormat("yyyy-mm-dd");
//   List<Users> users=[];
//   List<Facilitiesmaster> facilities=[];
//   List<MosquePhotos> mosquePhotos;
//   List<MasterIntrests> masterIntrest=[];
//   List<Languagespoken> languagesList=[];
//   List<UserProfile> userProfile=[];
//   List<MasterIntrests> intrests=[];
//   List<MasterIntrests> skills=[];
//   List<MasterIntrests> religiousIntrest=[];
//   List<Mosque> mosque=[];
//   List<UserFamily> userFamily=[];
//   List<Posts> userPosts=[];
//   List<UserEducation> userEducation=[];
//   List<MosqueUsers> mosqueUsers=[];
//   List<MosquePrayers> mosquePrayers=[];
//
//   _getData(){
//     print("Hello welcome");
//     if(action == "clear"){
//       clearData();
//     }
//
//     if(action == "create"){
//       createMasterData();
//     }
//
//   }
//
//   Future<void> clearData() async {
//     await Amplify.DataStore.clear();
//   }
//
//   Future<void> createMasterData() async{
//     await Future.delayed(Duration(seconds: 2));
//     createMasterIntrest();
//     await Future.delayed(Duration(seconds: 2));
//     createMosqueFacility();
//     await Future.delayed(Duration(seconds: 2));
//     createLanguagesSpoken();
//     await Future.delayed(Duration(seconds: 2));
//     createUsers();
//     await Future.delayed(Duration(seconds: 2));
//     createMosque();
//     await Future.delayed(Duration(seconds: 2));
//     createMosquePrayers();
//     await Future.delayed(Duration(seconds: 2));
//     createUserEducation();
//     await Future.delayed(Duration(seconds: 2));
//     createUserFamily();
//     await Future.delayed(Duration(seconds: 2));
//     createMosqueUsers();
//     await Future.delayed(Duration(seconds: 2));
//     createPost();
//     await Future.delayed(Duration(seconds: 3));
//     createUserProfile();
//     await Future.delayed(Duration(seconds: 2));
//     print("Data Inserted");
//   }
//
//   Future<void> deleteUserProfile() async {
//     print(userProfile.length);
//     await Amplify.DataStore.delete(userProfile[0]);
//     //await Amplify.DataStore.delete(userProfile[1]);
//     //await Amplify.DataStore.delete(userProfile[2]);
//     //await Amplify.DataStore.delete(userProfile[3]);
//   }
//
//   Future<void> createUsers() async {
//     DateTime now=DateTime.now();
//     TemporalDate date=new TemporalDate(DateTime.now());
//
//     try {
//       users = await Amplify.DataStore.query(Users.classType);
//       print(users.length);
//       print(users);
//       print("inside the users List");
//       // print(users[3]);
//       // print(users[1]);
//       if(users.isEmpty) {
//         final user = Users(
//             first_name: "Muhamad",
//             last_name: "Hamza",
//             email: "muhamad.hamza@gmail.com",
//             password: "12345678",
//             phone: "8897191776",
//             age: "24",
//             gender: "male",
//             parent_email: "muhamad@gmail.com",
//             house_number: "Flat 12 ,England",
//             street: "Federeick Street",
//             city: "Luton",
//             postcode: "Lu2 7qu",
//             country: "England",
//             latitude: "",
//             longitude: "",
//             parent_consent_form_agree: true,
//             terms_privacy_policy_agree: true,
//             community_promise_agree: true,
//             email_verification: true,
//             phone_verification: true,
//             parent_verification: true,
//             address_verification: true,
//             photo_verification: true,
//             joined_date: TemporalDate.fromString(date.toString()),
//             active_status: true,
//             //User_Posts: [],
//             User_Comments: [],
//             User_PostLikes: [],
//             User_MosqueFollowers: [],
//             User_Friends: [],
//             User_Photos: [],
//             User_Educations: [],
//             User_Profiles: []);
//         await Amplify.DataStore.save(user);
//
//         final user1 = Users(
//             first_name: "Muhamad",
//             last_name: "Shaik",
//             email: "muhamad.shaik@gmail.com",
//             password: "12345678",
//             phone: "8897191776",
//             age: "24",
//             gender: "male",
//             parent_email: "muhamad.shaik@gmail.com",
//             house_number: "Flat 12,Farley hills",
//             street: "Federeick Street",
//             city: "Luton",
//             postcode: "LU3 7RT",
//             country: "England",
//             latitude: "",
//             longitude: "",
//             parent_consent_form_agree: true,
//             terms_privacy_policy_agree: true,
//             community_promise_agree: true,
//             email_verification: true,
//             phone_verification: true,
//             parent_verification: true,
//             address_verification: true,
//             photo_verification: true,
//             joined_date: TemporalDate.fromString(date.toString()),
//             active_status: true,
//             //User_Posts: [],
//             User_Comments: [],
//             User_PostLikes: [],
//             User_MosqueFollowers: [],
//             User_Friends: [],
//             User_Photos: [],
//             User_Educations: [],
//             User_Profiles: []);
//         await Amplify.DataStore.save(user1);
//
//         final user2 = Users(
//             first_name: "Rshid",
//             last_name: "Ameer",
//             email: "rashid.ameer@gmail.com",
//             password: "12345678",
//             phone: "8897191776",
//             age: "25",
//             gender: "male",
//             parent_email: "rashid.ameer@gmail.com",
//             house_number: "Flat 12 ,England",
//             street: "Federeick Street",
//             city: "Luton",
//             postcode: "Lu2 7qu",
//             country: "England",
//             latitude: "",
//             longitude: "",
//             parent_consent_form_agree: true,
//             terms_privacy_policy_agree: true,
//             community_promise_agree: true,
//             email_verification: true,
//             phone_verification: true,
//             parent_verification: true,
//             address_verification: true,
//             photo_verification: true,
//             joined_date: TemporalDate.fromString(date.toString()),
//             active_status: true,
//             //User_Posts: [],
//             User_Comments: [],
//             User_PostLikes: [],
//             User_MosqueFollowers: [],
//             User_Friends: [],
//             User_Photos: [],
//             User_Educations: [],
//             User_Profiles: []);
//         await Amplify.DataStore.save(user2);
//         await Future.delayed(Duration(seconds: 2));
//         print("users created");
//         print("going for userprofile");
//         //   //createUserProfile();
//         //   //createMosqueFacility();
//       }
//
//       //createMosqueFacility();
//     } catch (e) {
//       print("Could not query DataStore: Created users error" + e);
//
//     }
//
//   }
//
//   Future<void> createMosqueFacility() async {
//
//     try {
//       facilities = await Amplify.DataStore.query(Facilitiesmaster.classType);
//       print(facilities.length);
//       print("inside the users List");
//       if(facilities.isEmpty) {
//         for(int i=0;i< AppTexts.FACILITIES.length;i++) {
//           final item = Facilitiesmaster(
//               icon_path: AppTexts.FACILITIES.values.elementAt(i),
//               facility_header: AppTexts.FACILITIES.keys.elementAt(i),
//               description: "");
//           await Amplify.DataStore.save(item);
//           //await Future.delayed(Duration(milliseconds: 500));
//           print("Facilities created");
//         }
//       }
//       //createLanguagesSpoken();
//     } catch (e) {
//       print("Could not query DataStore: " + e);
//
//     }
//
//   }
//
//   Future<void> createMosquePhotosList() async {
//     try {
//       mosquePhotos = await Amplify.DataStore.query(MosquePhotos.classType);
//       print(mosquePhotos.length);
//       print("inside the users List");
//
//     } catch (e) {
//       print("Could not query DataStore: " + e);
//
//     }
//
//     if(mosquePhotos.isEmpty) {
//       final item = MosquePhotos(
//           photo_type: "Lorem ipsum dolor sit amet",
//           photo_path: "Lorem ipsum dolor sit amet");
//       await Amplify.DataStore.save(item);
//     }
//   }
//
//   Future<void> createLanguagesSpoken() async {
//     try{
//       languagesList = await Amplify.DataStore.query(Languagespoken.classType);
//       print(languagesList);
//       print("language list");
//       if(languagesList.isEmpty){
//         for(int i=0;i<AppTexts.LANGUAGES_CATEGORIES.length;i++) {
//           final item = Languagespoken(
//               languages: AppTexts.LANGUAGES_CATEGORIES.elementAt(i));
//           await Amplify.DataStore.save(item);
//           //await Future.delayed(Duration(milliseconds: 500));
//           print("Languages created");
//         }
//       }
//       //createMasterIntrest();
//     } catch(e)
//     {
//       print(" "+e);
//     }
//   }
//
//   Future<void> createMasterIntrest() async {
//
//     print("inside the Master Intrest");
//     try {
//       masterIntrest = await Amplify.DataStore.query(MasterIntrests.classType);
//       print("Before the Intrest List");
//       print(masterIntrest.length);
//       print(masterIntrest);
//       if (masterIntrest.isEmpty) {
//
//         for (int i = 0; i < AppTexts.HOBIE_CATEGORIES.length; i++) {
//           final hobbie = MasterIntrests(
//               photo_path: AppTexts.HOBIE_CATEGORIES.values.elementAt(i),
//               intrest_name: AppTexts.HOBIE_CATEGORIES.keys.elementAt(
//                   i),
//               decription: "",
//               category_name: "Hobbie");
//           await Amplify.DataStore.save(hobbie);
//         }
//
//
//         for (int i = 0; i < AppTexts.SPORTS_EXERCISE_CATEGORIES.length; i++) {
//           final sports = MasterIntrests(
//               photo_path: AppTexts.SPORTS_EXERCISE_CATEGORIES.values.elementAt(
//                   i),
//               intrest_name: AppTexts.SPORTS_EXERCISE_CATEGORIES.keys.elementAt(
//                   i),
//               decription: "",
//               category_name: AppTexts.INTEREST_SPORTS_EXERCISE);
//           await Amplify.DataStore.save(sports);
//         }
//
//
//         for (int i = 0; i < AppTexts.FAMILY_OUTDOORS_CATEGORIES.length; i++) {
//           final outdoors = MasterIntrests(
//               photo_path: AppTexts.FAMILY_OUTDOORS_CATEGORIES.values
//                   .elementAt(
//                   i),
//               intrest_name: AppTexts.FAMILY_OUTDOORS_CATEGORIES.keys
//                   .elementAt(
//                   i),
//               decription: "",
//               category_name: AppTexts.INTEREST_FAMILY_OUTDOOR);
//           await Amplify.DataStore.save(outdoors);
//         }
//
//
//         for (int i = 0; i < AppTexts.VOLUNTEER_CATEGORIES.length; i++) {
//           final volunteer = MasterIntrests(
//               photo_path: AppTexts.VOLUNTEER_CATEGORIES.values.elementAt(
//                   i),
//               intrest_name: AppTexts.VOLUNTEER_CATEGORIES.keys.elementAt(
//                   i),
//               decription: "",
//               category_name: AppTexts.INTEREST_VOLUNTEER);
//           await Amplify.DataStore.save(volunteer);
//         }
//         //print("Community Invoclvement");
//         for (int i = 0; i < AppTexts.COMMUNITY_INVOLVEMENT_CATEGORIES.length; i++) {
//           final community = MasterIntrests(
//               photo_path: AppTexts.COMMUNITY_INVOLVEMENT_CATEGORIES.values
//                   .elementAt(
//                   i),
//               intrest_name: AppTexts.COMMUNITY_INVOLVEMENT_CATEGORIES.keys
//                   .elementAt(
//                   i),
//               decription: "",
//               category_name: AppTexts.INTEREST_COMMUNITY_INVOLVEMENT);
//           await Amplify.DataStore.save(community);
//         }
//
//         for (int i = 0; i < AppTexts.SKILLS_CATEGORIES.length; i++) {
//           final skills = MasterIntrests(
//               photo_path: AppTexts.SKILLS_CATEGORIES.values.elementAt(
//                   i),
//               intrest_name: AppTexts.SKILLS_CATEGORIES.keys.elementAt(
//                   i),
//               decription: "",
//               category_name: "Skills");
//           await Amplify.DataStore.save(skills);
//         }
//
//
//         for (int i = 0; i < AppTexts.RELIGIONS_INTEREST_CATEGORIES.length; i++) {
//           final religious = MasterIntrests(
//               photo_path: AppTexts.RELIGIONS_INTEREST_CATEGORIES.values.elementAt(
//                   i),
//               intrest_name: AppTexts.RELIGIONS_INTEREST_CATEGORIES.keys.elementAt(
//                   i),
//               decription: "",
//               category_name: "Religious Interests");
//           await Amplify.DataStore.save(religious);
//         }
//         print("Master Intrest Created");
//         await Future.delayed(Duration(seconds: 1));
//         print("going for master Category");
//         _getMasterIntrestListCategory();
//       }else {
//         _getMasterIntrestListCategory();
//       }
//       createMosque();
//     } catch (e) {
//
//     }
//
//   }
//
//   Future<void> _getMasterIntrestListCategory() async {
//     print("inisde the master Intrest List Cateogory");
//     try{
//       masterIntrest = await Amplify.DataStore.query(MasterIntrests.classType);
//       intrests.clear();
//       skills.clear();
//       religiousIntrest.clear();
//       print("Cleared all Intrest");
//       for (int i = 0; i < masterIntrest.length; i++) {
//         if (masterIntrest[i].category_name == "Hobbie" ||
//             masterIntrest[i].category_name == AppTexts.INTEREST_SPORTS_EXERCISE ||
//             masterIntrest[i].category_name == AppTexts.INTEREST_FAMILY_OUTDOOR ||
//             masterIntrest[i].category_name == AppTexts.INTEREST_VOLUNTEER ||
//             masterIntrest[i].category_name ==
//                 AppTexts.INTEREST_COMMUNITY_INVOLVEMENT) {
//           intrests.add(masterIntrest[i]);
//         } else if (masterIntrest[i].category_name == "Skills") {
//           skills.add(masterIntrest[i]);
//         } else if (masterIntrest[i].category_name == "Religious Interests") {
//           religiousIntrest.add(masterIntrest[i]);
//         }
//       }
//     }catch(e)
//     {
//       print(e);
//     }
//   }
//
//   Future<void> createUserProfile() async {
//     try{
//       print("inside user profile");
//       userProfile=await Amplify.DataStore.query(UserProfile.classType);
//       print(userProfile.length);
//       print(userProfile);
//       print(users[0].id);
//       print("checking the user list length");
//       print(users.length);
//       print(languagesList.length);
//       print(intrests.length);
//       print(skills.length);
//       print(religiousIntrest.length);
//       print("printing the user list");
//       //print(userProfile[3]);
//       //print(userProfile[1]);
//       List<String> languages1=[languagesList[5].languages+ "," +languagesList[6].languages];
//       List<String> communityIntrest1=[intrests[0].id + "," + intrests[1].id];
//       List<String> skillsid=[skills[0].id + "," + skills[1].id];
//       List<String> religiousId=[religiousIntrest[0].getId() + "," +religiousIntrest[1].getId()];
//       if(userProfile.isEmpty)
//       { print("if user profile is empty");
//       Users userObject = users[0];
//       final item = UserProfile(
//           bio: AppTexts.BIO_TEXT,
//           relationship_status: "Single",
//           languages_spoken: jsonEncode(languages1),
//           sect: "Sunni",
//           are_you_revert: true,
//           islam_interest: true,
//           profile_privacy: "Community",
//           community_interests:  jsonEncode(communityIntrest1),
//           skills:  jsonEncode(skillsid),
//           religious_interests: jsonEncode(religiousId) ,
//           usersID: users[0].id
//       );
//       await Amplify.DataStore.save(item);
//
//       List<String> languages2=[languagesList[0].languages+ "," +languagesList[1].languages];
//       List<String> communityIntrest2=[intrests[2].id + "," + intrests[3].id];
//       List<String> skillsid2=[skills[2].id + "," + skills[3].id];
//       List<String> religiousId2=[religiousIntrest[2].getId() + "," +religiousIntrest[3].getId()];
//
//
//       final users1 = UserProfile(
//           bio: AppTexts.BIO_TEXT,
//           relationship_status: "Single",
//           languages_spoken: jsonEncode(languages2),
//           sect: "Shia",
//           are_you_revert: true,
//           islam_interest: true,
//           profile_privacy: "Community",
//           community_interests: jsonEncode(communityIntrest2),
//           skills: jsonEncode(skillsid2),
//           religious_interests:  jsonEncode(religiousId2),
//           usersID : users[1].getId());
//       await Amplify.DataStore.save(users1);
//
//
//       List<String> languages3=[languagesList[3].languages+ "," +languagesList[4].languages];
//       List<String> communityIntrest3=[intrests[4].id + "," + intrests[5].id];
//       List<String> skillsid3=[skills[4].id + "," + skills[5].id];
//       List<String> religiousId3=[religiousIntrest[4].getId() + "," +religiousIntrest[5].getId()];
//
//       final users2 = UserProfile(
//           bio: AppTexts.BIO_TEXT,
//           relationship_status: "Single",
//           languages_spoken: jsonEncode(languages3),
//           sect: "Sunni",
//           are_you_revert: true,
//           islam_interest: true,
//           profile_privacy: "Community",
//           community_interests: jsonEncode(communityIntrest3),
//           skills:  jsonEncode(skillsid3),
//           religious_interests:  jsonEncode(religiousId3),
//           usersID : users[2].getId());
//       await Amplify.DataStore.save(users2);
//       //await Future.delayed(Duration(milliseconds: 500));
//       print("User Profile Created");
//       }
//       //createUserFamily();
//     } catch(e)
//     {
//       print("print the error" +e);
//     }
//
//   }
//
//   Future<void> createMosque() async {
//     try{
//       mosque=await Amplify.DataStore.query(Mosque.classType);
//       print(mosque.length);
//       print(mosque);
//       List<String> facilityUserList=[facilities[0].id,facilities[1].id,facilities[2].id,facilities[3].id,facilities[4].id];
//       List<String>  facilityUserList1=[facilities[0].getId()  + "," + facilities[3].getId()+ "," + facilities[4].getId()+ "," + facilities[5].getId()+ "," + facilities[6].getId()];
//       List<String>  facilityUserList2=[facilities[0].getId()  + "," + facilities[2].getId() + "," + facilities[3].getId() + "," + facilities[4].getId() + "," + facilities[5].getId()];
//       print(userProfile);
//       if(mosque.isEmpty)
//       {
//         final item = Mosque(
//             mosque_name: "Lewish Islamic Center",
//             about: "Lorem ipsum dolor sit amet",
//             is_verified: true,
//             sect: "Sunni",
//             mosque_photos_list:"https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/img_mosque.png",
//             mosque_facility_list: jsonEncode(facilityUserList),
//             contact_description: "Lorem ipsum dolor sit amet",
//             phone: "020 8690 5090",
//             email: "info@lewisham.com.uk",
//             url: "www.lewish.com.uk",
//             house_number: "363-365 ",
//             street: "Lewisham High Street",
//             city: "Luton",
//             postcode: "SE13 6N",
//             country: "Uk");
//         await Amplify.DataStore.save(item);
//
//         final mosque2 = Mosque(
//             mosque_name: "Lorem Mosque",
//             about: "Lorem ipsum dolor sit amet",
//             is_verified: true,
//             sect: "Shia",
//             mosque_photos_list:"https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/img_mosque.png",
//             mosque_facility_list: jsonEncode(facilityUserList1) ,
//             contact_description: "Lorem ipsum dolor sit amet",
//             phone: "998058798",
//             email: "lorem.mosque@com.uk",
//             url: "www.loreum.com.uk",
//             house_number: "Flat 12 ",
//             street: "Federick Street",
//             city: "England",
//             postcode: "LU2 7QU",
//             country: "Uk");
//         await Amplify.DataStore.save(mosque2);
//         // await Future.delayed(Duration(milliseconds: 500));
//
//         final mosque3 = Mosque(
//             mosque_name: "EastLondon Mosque",
//             about: "Lorem ipsum dolor sit amet",
//             is_verified: true,
//             sect: "Sunni",
//             mosque_photos_list:  "",
//             mosque_facility_list: jsonEncode(facilityUserList2) ,
//             contact_description: "Lorem ipsum dolor sit amet",
//             phone: "998058798",
//             email: "lorem.mosque@com.uk",
//             url: "www.loreum.com.uk",
//             house_number: "Flat 12 ",
//             street: "Federick Street",
//             city: "England",
//             postcode: "LU2 7QU",
//             country: "Uk");
//         await Amplify.DataStore.save(mosque3);
//
//
//         print("Mosque Created");
//       }
//       // createUserProfile();
//     } catch(e)
//     {
//       print(e);
//     }
//
//   }
//   Future<void> createUserFamily() async {
//     try{
//       userFamily=await Amplify.DataStore.query(UserFamily.classType);
//       print(userFamily.length);
//       print(userFamily);
//       if(userFamily.isEmpty)
//       {
//         final item = UserFamily(
//             name: "Ali Akbhar Khan",
//             relationship: "father",
//             user_id: users[0].getId());
//         await Amplify.DataStore.save(item);
//
//
//         final userFamily = UserFamily(
//             name: "Asifa Ansari",
//             relationship: "Mother",
//             user_id:  users[1].getId());
//         await Amplify.DataStore.save(userFamily);
//
//
//         final userFamily1 = UserFamily(
//             name: "Muhamad Shaik",
//             relationship: "Brother",
//             user_id:  users[2].getId());
//         await Amplify.DataStore.save(userFamily1);
//         //await Future.delayed(Duration(milliseconds: 500));
//         print("User Family Created");
//       }
//       // createUserEducation();
//     } catch(e)
//     {
//
//     }
//
//   }
//
//   Future<void> createPost() async {
//     try{
//       userPosts=await Amplify.DataStore.query(Posts.classType);
//       print(userPosts.length);
//       print(userPosts);
//
//       if(userPosts.isEmpty) {
//         final item = Posts(
//             post: "Lorem ipsum dolor sit amet",
//             post_image_path: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/post_img.png",
//             description: "",
//             visibility: "Community",
//             mosquesID:"",
//             usersID: users[0].getId());
//         await Amplify.DataStore.save(item);
//
//         final posts = Posts(
//             post: "Good Evening",
//             post_image_path: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/post_img_2.png",
//             description: "",
//             visibility: "Community",
//             mosquesID:"",
//             usersID: users[1].getId());
//         await Amplify.DataStore.save(posts);
//
//         final posts1 = Posts(
//             post: "Hi ,Welcome to the post",
//             post_image_path: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/post_img.png",
//             description: "",
//             visibility: "Community",
//             mosquesID:"",
//             usersID: users[2].getId());
//
//         await Amplify.DataStore.save(posts1);
//
//
//         final posts2 = Posts(
//             post: "Lorem ipsum dolor sit amet",
//             post_image_path: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/post_img_2.png",
//             description: "",
//             visibility: "Friends",
//             mosquesID:"",
//             usersID: users[0].getId());
//         await Amplify.DataStore.save(posts2);
//
//         final posts3 = Posts(
//             post: "Good Evening",
//             post_image_path: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/post_img.png",
//             description: "",
//             visibility: "Friends",
//             mosquesID:"",
//             usersID: users[1].getId());
//         await Amplify.DataStore.save(posts3);
//
//         final posts4 = Posts(
//             post: "Hi ,Welcome to the post",
//             post_image_path: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/post_img_2.png",
//             description: "",
//             visibility: "Friends",
//             mosquesID:"",
//             usersID: users[2].getId());
//         await Amplify.DataStore.save(posts4);
//
//         final posts5 = Posts(
//             post: "Lorem ipsum dolor sit amet",
//             post_image_path: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/post_img_2.png",
//             description: "",
//             visibility: "Community",
//             usersID: "",
//             mosquesID: mosque[0].getId());
//         await Amplify.DataStore.save(posts5);
//
//         final post6 = Posts(
//             post: "Good Evening",
//             post_image_path: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/post_img_2.png",
//             description: "",
//             visibility: "Community",
//             usersID: "",
//             mosquesID: mosque[1].getId());
//         await Amplify.DataStore.save(post6);
//
//         final posts7 = Posts(
//             post: "Hi ,Welcome to the post",
//             post_image_path: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/post_img_2.png",
//             description: "",
//             visibility: "Friends",
//             usersID: "",
//             mosquesID: mosque[0].getId());
//         await Amplify.DataStore.save(posts7);
//
//
//         final posts8 = Posts(
//             post: "Lorem ipsum dolor sit amet",
//             post_image_path: "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/post_img_2.png",
//             description: "",
//             visibility: "Friends",
//             usersID: "",
//             mosquesID: mosque[1].getId());
//         await Amplify.DataStore.save(posts8);
//         //await Future.delayed(Duration(milliseconds: 500));
//         print("Posts Created");
//       }
//     } catch(e)
//     {
//
//     }
//
//   }
//
//   Future<void> createUserEducation() async {
//     try{
//       userEducation=await Amplify.DataStore.query(UserEducation.classType);
//       print(userEducation.length);
//       print(userEducation);
//       if(userEducation.isEmpty)
//       {
//         final item = UserEducation(
//             institution: "Lodon School of Economics",
//             course: "Bsc Computer Science",
//             from: "2015",
//             to: "2018",
//             usersID: users[0].getId());
//         await Amplify.DataStore.save(item);
//
//         final userEducation = UserEducation(
//             institution: "Cryadon College",
//             course: "HND  Computer",
//             from: "2013",
//             to: "2015",
//             usersID: users[1].getId());
//         await Amplify.DataStore.save(userEducation);
//
//         final userEducation1 = UserEducation(
//             institution: "University of Hertfordshire",
//             course: "Adv Computer Science",
//             from: "2018",
//             to: "2021",
//             usersID: users[2].getId());
//         await Amplify.DataStore.save(userEducation1);
//         await Future.delayed(Duration(milliseconds: 500));
//         print("User Education Created");
//       }
//       //createMosqueUsers();
//     } catch(e)
//     {
//
//     }
//
//   }
//
//   Future<void> createMosqueUsers() async {
//     try{
//       mosqueUsers=await Amplify.DataStore.query(MosqueUsers.classType);
//       print(mosqueUsers.length);
//       print(mosqueUsers);
//       if(mosqueUsers.isEmpty)
//       {
//         final item = MosqueUsers(
//             mosqueID: mosque[0].getId() ,
//             name: "Mohammad Rehan",
//             designation: "Chairman",
//             role: "Associative",
//             photo_path: "");
//         await Amplify.DataStore.save(item);
//
//         final mosqueUsers = MosqueUsers(
//             mosqueID: mosque[1].getId(),
//             name: "Hajar Ahmad Munir",
//             designation: "General Secretaory",
//             role: "Associative",
//             photo_path: "");
//         await Amplify.DataStore.save(mosqueUsers);
//         //await Future.delayed(Duration(milliseconds: 500));
//         print("Mosque User Created");
//       }
//       //createPost();
//     } catch(e)
//     {
//
//     }
//
//   }
//
//   Future<void> createMosquePrayers() async {
//     TemporalDate day2=new TemporalDate(dateFormat.parse("2021-07-08"));
//     try{
//       mosquePrayers=await Amplify.DataStore.query(MosquePrayers.classType);
//       //await Amplify.DataStore.delete(mosquePrayers[0]);
//       print(mosquePrayers.length);
//       print(mosquePrayers);
//       if(mosquePrayers.isEmpty) {
//         final Day1Prayer1 = MosquePrayers(
//             mosqueID: mosque[0].getId(),
//             prayer: "Fajir",
//             Date: date,
//             end_time: TemporalTime.fromString("08:44"),
//             begin_time: TemporalTime.fromString("08:14"));
//         await Amplify.DataStore.save(Day1Prayer1);
//
//         final Day1Prayer2 = MosquePrayers(
//             mosqueID: mosque[0].getId(),
//             prayer: "DHUMAR",
//             Date: date,
//             end_time: TemporalTime.fromString("13:15"),
//             begin_time: TemporalTime.fromString("13:00"));
//         await Amplify.DataStore.save(Day1Prayer2);
//
//         final Day1Prayer3 = MosquePrayers(
//             mosqueID: mosque[0].getId(),
//             prayer: "ASR",
//             Date: date,
//             end_time: TemporalTime.fromString("12:30"),
//             begin_time: TemporalTime.fromString("12:14"));
//         await Amplify.DataStore.save(Day1Prayer3);
//
//         final Day1Prayer4 = MosquePrayers(
//             mosqueID: mosque[0].getId(),
//             prayer: "MAGHRIB",
//             Date: date,
//             end_time: TemporalTime.fromString("16:29"),
//             begin_time: TemporalTime.fromString("16:14"));
//         await Amplify.DataStore.save(Day1Prayer4);
//
//         final Day1Prayer5 = MosquePrayers(
//             mosqueID: mosque[0].getId(),
//             prayer: "JUMMAH",
//             Date: date,
//             end_time: TemporalTime.fromString("18:30"),
//             begin_time: TemporalTime.fromString("18:14"));
//         await Amplify.DataStore.save(Day1Prayer5);
//
//
//         final Day1Prayer6 = MosquePrayers(
//             mosqueID: mosque[0].getId(),
//             prayer: "ISHA",
//             Date: date,
//             end_time: TemporalTime.fromString("20:30"),
//             begin_time: TemporalTime.fromString("20:14"));
//         await Amplify.DataStore.save(Day1Prayer6);
//
//         final Day2Prayer1 = MosquePrayers(
//             mosqueID: mosque[0].getId(),
//             prayer: "Fajir",
//             Date: day2,
//             //Date: null,
//             end_time: TemporalTime.fromString("08:44"),
//             begin_time: TemporalTime.fromString("08:14"));
//         await Amplify.DataStore.save(Day2Prayer1);
//
//         final Day2Prayer2 = MosquePrayers(
//             mosqueID: mosque[0].getId(),
//             prayer: "DHUMAR",
//             Date: day2,
//             //Date: null,
//             end_time: TemporalTime.fromString("13:15"),
//             begin_time: TemporalTime.fromString("13:00"));
//         await Amplify.DataStore.save(Day2Prayer2);
//
//         final Day2Prayer3 = MosquePrayers(
//             mosqueID: mosque[0].getId(),
//             prayer: "ASR",
//             Date: day2,
//             //Date: null,
//             end_time: TemporalTime.fromString("12:30"),
//             begin_time: TemporalTime.fromString("12:14"));
//         await Amplify.DataStore.save(Day2Prayer3);
//
//         final Day2Prayer4 = MosquePrayers(
//             mosqueID: mosque[0].getId(),
//             prayer: "MAGHRIB",
//             Date: day2,
//             //Date: null,
//             end_time: TemporalTime.fromString("16:29"),
//             begin_time: TemporalTime.fromString("16:14"));
//         await Amplify.DataStore.save(Day2Prayer4);
//
//         final Day2Prayer5 = MosquePrayers(
//             mosqueID: mosque[0].getId(),
//             prayer: "JUMMAH",
//             Date: day2,
//             //Date: null,
//             end_time: TemporalTime.fromString("18:30"),
//             begin_time: TemporalTime.fromString("18:14"));
//         await Amplify.DataStore.save(Day2Prayer5);
//
//
//         final Day2Prayer6 = MosquePrayers(
//             mosqueID: mosque[0].getId(),
//             prayer: "ISHA",
//             Date: day2,
//             //Date: null,
//             end_time: TemporalTime.fromString("20:30"),
//             begin_time: TemporalTime.fromString("20:14"));
//         await Amplify.DataStore.save(Day2Prayer6);
//         //await Future.delayed(Duration(milliseconds: 500));
//
//
//       }
//     } catch(e)
//     {
//       print(e);
//     }
//     //
//   }
//
//
//
//
//
//
//
//
