// Amplify Flutter Packages

import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_api/amplify_api.dart'; // UNCOMMENT this line once backend is deployed
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';

// Generated in previous step
import 'models/ModelProvider.dart';
import 'amplifyconfiguration.dart';

import 'package:flutter/material.dart';
import 'package:mus_greet/pages/add_education_screen/add_education_screen.dart';
import 'package:mus_greet/pages/add_skills_screen/add_skills_screen.dart';
import 'package:mus_greet/pages/advanced_search/search_education_screen.dart';
import 'package:mus_greet/pages/advanced_search/search_faith_interests_screen.dart';
import 'package:mus_greet/pages/advanced_search/search_interests_screen.dart';
import 'package:mus_greet/pages/advanced_search/search_skills_screen.dart';
import 'package:mus_greet/pages/create_post_screen/create_post_screen.dart';
import 'package:mus_greet/pages/find_mosque/search_mosque.dart';
import 'package:mus_greet/pages/friend_search/advance_search/friend_advance_search.dart';
import 'package:mus_greet/pages/friend_search/friend_search.dart';
import 'package:mus_greet/pages/home/home.dart';
import 'package:mus_greet/pages/interest_screen/add_skills_images.dart';
import 'package:mus_greet/pages/interest_screen/interest_screen.dart';
import 'package:mus_greet/pages/interest_screen/religious_interest_screen.dart';
import 'package:mus_greet/pages/languages_screen/select_languages.dart';
import 'package:mus_greet/pages/mosque_screen/advance_search_screen/advance_search_screen.dart';
import 'package:mus_greet/pages/mosque_screen/mosque_details/mosques_detail_screen.dart';
import 'package:mus_greet/pages/mosque_screen/mosque_search_list_view/mosque_search_list_view.dart';
import 'package:mus_greet/pages/my_family_screen/my_family_screen.dart';
import 'package:mus_greet/pages/splash_screen/splash_screen.dart';
import 'core/utils/constants.dart';
import 'core/utils/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

///This is the root of our widget tree
class _MyAppState extends State<MyApp> {
  bool _amplifyConfigured = false;

  @override
  initState() {
    super.initState();
    //_configureAmplify();
  }

  void _configureAmplify() async {

    Amplify.addPlugin(AmplifyAuthCognito());

    Amplify.addPlugin(AmplifyAPI()); // UNCOMMENT this line once backend is deployed
    Amplify.addPlugin(AmplifyDataStore(modelProvider: ModelProvider.instance));
    Amplify.addPlugin(AmplifyStorageS3());

    // Once Plugins are added, configure Amplify
    await Amplify.configure(amplifyconfig);
    try {
      setState(() {
        print('Plugins configured successfully!');
        _amplifyConfigured = true;
      });

      //insertUsers();
      //listUsers();
      //createPosts();
     //queryPosts();
      uploadFile();

    } catch (e) {
      print('Error in amplify configure');
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.APP_NAME,
      locale: Locale("en"),
      debugShowCheckedModeBanner: false,
      //home: MyDB(),
      initialRoute: AppRoutes.SPLASH,
      routes: _registerRoutes(),
    );
  }

  Map<String, WidgetBuilder> _registerRoutes() {
    return <String, WidgetBuilder>{
      AppRoutes.SPLASH: (context) => SplashScreen(),
      AppRoutes.HOME: (context) => Home(),
      AppRoutes.ADD_SKILLS :(context) => AddSkillsScreen(),
      AppRoutes.ADD_EDUCATION :(context) => AddEducationScreen(),
      AppRoutes.MY_FAMILY :(context) => MyFamilyScreen(),
      AppRoutes.INTEREST_SCREEN :(context) => InterestScreen(),
      AppRoutes.MOSQUE_SEARCH_LIST_VIEW :(context) => MosqueSearchListView(),
      AppRoutes.MOSQUE_ADVANCE_SEARCH :(context) => AdvanceSearchScreen(),
      AppRoutes.FRIEND_ADVANCE_SEARCH :(context) => FriendAdvanceSearch(),
      AppRoutes.MOSQUE_DETAILS_SCREEN:(context) => MosquesDetailsScreen(),
      AppRoutes.MOSQUE_FROM_MAP:(context) => MosuqueSearchFromMap(),
      AppRoutes.CREATE_POST_SCREEN :(context) => CreatePostScreen(),
      AppRoutes.ADD_RELIGIOUS_INTERESTS_SCREEN:(context) => ReligiousInterestScreen(),
      AppRoutes.SEARCH_EDUCATION_SCREEN:(context) => SearchEducationScreen(),
      AppRoutes.SEARCH_INTERESTS_SCREEN:(context) => SearchInterestsScreen(),
      AppRoutes.SEARCH_SKILLS_SCREEN:(context) => SearchSkillsScreen(),
      AppRoutes.SEARCH_FAITH_INTERESTS_SCREEN:(context) => SearchFaithInterestsScreen(),
      AppRoutes.LANGUAGES_SCREEN:(context) => LanguagesScreen(),
      AppRoutes.ADD_SKILLS_IMAGES :(context) => AddSkillsImagesScreen(),
      AppRoutes.FRIEND_SEARCH :(context) => FriendSearch(),


    };
  }
}

class MyDB extends StatefulWidget {
  //MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  //final String title;

  @override
  _MyDBState createState() => _MyDBState();
}

class _MyDBState extends State<MyDB> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("Hello welcome");
    //insertUsers();
    //listUsers();
    //uploadFile();
    //updateUsers();
    //createPosts();
    //queryPosts();
    throw UnimplementedError();
  }
}

Future<String> getFilePath() async {
  Directory appDocumentsDirectory = await getApplicationDocumentsDirectory(); // 1
  String appDocumentsPath = appDocumentsDirectory.path; // 2
  String filePath = '$appDocumentsPath/demoTextFile.txt'; // 3

  return filePath;
}

Future<String> uploadFile() async {
  try {
    final fileName = DateTime.now().toIso8601String();
    var dir = await getApplicationDocumentsDirectory();
    File file = File(await getFilePath()); // 1
    file.writeAsString("This is my demo text that will be saved to : demoTextFile.txt");
    final result = await Amplify.Storage.uploadFile(
      //local: file,
      local: file,
        //local: File(await getFilePath()),
      //local: File('C:/Venkat/Sriram/Projects/MusGreet/Code/musgreet_phase1/musgreet/assets/images/logo.png'),
      key: fileName + '.txt',
    );
    //final x = Amplify.Storage.put('text.txt', 'Hello');
    print('image uploaded to S3 successfully!');
    print(result.key);
    getUrlForFile(result.key);
    return result.key;
  } catch (e) {
    print('Error in uploading image to S3');
    throw e;
  }
}

Future<String> getUrlForFile(String fileKey) async {
  try {
    final result = await Amplify.Storage.getUrl(key: fileKey);
    print(result.url);
    //s3://musgreetphase1images184452-staging/public/2021-05-26T22:07:56.979371.txt
    return result.url;
  } catch (e) {
    print('Error in getUrl method');
    throw e;
  }
}

Future<void> insertUsers() async {
  final item = Users(
      first_name: "Sally",
      last_name: "Robert",
      email: "sallyr@gmail.com",
      password: "sally@123",
      phone: "07733699619",
      age: "25",
      gender: "male",
      parent_email: "",
      house_number: "117111",
      street: "NewHam",
      city: "EastHam",
      postcode: "E126NA",
      country: "UK",
      latitude: "60N",
      longitude: "40W",
      parent_consent_form_agree: true,
      terms_privacy_policy_agree: true,
      community_promise_agree: true,
      email_verification: true,
      phone_verification: true,
      parent_verification: true,
      address_verification: true,
      photo_verification: true,
      joined_date: TemporalDate.fromString("1970-01-01Z"),
      active_status: true,
      User_Posts: [],
      User_Comments: [],
      User_PostLikes: [],
      User_MosqueFollowers: [],
      User_Friends: [],
      User_Photos: [],
      User_Educations: [],
      User_Profiles: []);
  await Amplify.DataStore.save(item);
}

Future<void> listUsers() async{
  try {
    List<Users> Userss = await Amplify.DataStore.query(Users.classType);
    print(Userss);
    print(Userss[0]);
    print(Userss[0].first_name);
    //print(Userss.first);
    //print(Userss.length);
    print(Userss[0].first_name);

  } catch (e) {
    print("Could not query DataStore: " + e);
  }
}

Future<void> createPosts() async{
  final item = Posts(
      post: "This is a new post added from APP",
      post_image_path: "Lorem ipsum dolor sit amet",
      description: "Keep Smiling",
      visibility: "Friends",
      usersID: "33dad6d6-21ef-401a-a306-a551cac9c74a",
      mosquesID: "",
      Post_Comments: [],
      Post_Likes: []);
  await Amplify.DataStore.save(item);
}

Future<void> queryPosts() async{
  try {
    List<Posts> Postss = await Amplify.DataStore.query(Posts.classType);
    print(Postss);
  } catch (e) {
    print("Could not query DataStore: " + e);
  }
}
