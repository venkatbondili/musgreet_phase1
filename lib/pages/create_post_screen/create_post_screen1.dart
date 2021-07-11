import 'dart:io';

import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/utils/routes.dart';
import 'package:mus_greet/core/widgets/action_button_widget.dart';
import 'package:mus_greet/core/widgets/asset_image_widget.dart';
import 'package:mus_greet/core/widgets/bottom_navigation_widget.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:mus_greet/core/widgets/drop_down_text_field.dart';
import 'package:mus_greet/core/widgets/media_source_widget.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:mus_greet/core/widgets/rounded_button_widget.dart';
import 'package:mus_greet/core/widgets/s3_bucket_image_widget.dart';
import 'package:mus_greet/models/ModelProvider.dart';
import 'package:mus_greet/pages/home_screen/home_screen.dart';
import 'package:path_provider/path_provider.dart';


class CreatePostScreen extends StatefulWidget {
  ///unComment these lines when we are passing the User details from other classes
  final Users sessionUser;
  //final String UserProfileImage;
  //final String UserName;
  //CreatePostScreen({this.UserProfileImage, this.UserName});
  CreatePostScreen({this.sessionUser});
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _thoughtsController = TextEditingController();
  /// remove the below two lines when we are passing the user details from other classes
  //String UserName ;
  String UserProfileImage = "https://musgreetphase1images184452-staging.s3.eu-west-2.amazonaws.com/public/public.png";
  var pickedFile;
  var filepath = '';
  String S3ImageURL = "";
  String postVisibility = "";
  //bool isCamera = false;
  File _image ;
  //print("inside create post");
  Users UserObject;
  //String LogedInUserID = "61b35418-9426-4652-9e59-a65ad173117c";
  String LogedInUserID;

  BottomNavigationWidgetArgumentClass args;
  Users sessionUser;


  Future getImage(bool isCamera) async {
    print("inside getImage");
    final picker = ImagePicker();
    print(pickedFile);
    if (isCamera) {
      pickedFile = await picker.getImage(source: ImageSource.camera);
      print("camera");
      print(pickedFile);
    }
    else {
      pickedFile = await picker.getImage(source: ImageSource.gallery);
      print("gallery");
      print(pickedFile);
    }

    setState(() {
      print("inside set state");
      //print(pickedFile);
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        //print("image");
        //print(_image);
        //print("File");
        filepath = pickedFile.path;
        //print(filepath);
        //print(filepath.split('/').last);
        //uploadFile(_image, filepath);
        print("calling upload file");
        uploadFile(_image, filepath).then((result) {
          setState(() {
            if (result is String)
              S3ImageURL = result.toString(); //use toString to convert as String
          });
        });
        print("After upload function");
        print("S3 URL");
        print(S3ImageURL);
        print("After S3");
        //uploadFile(filepath);
      } else {
        filepath = 'assets/images/google.png';
        print(filepath);
        print('No image selected.');
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    // args = ModalRoute.of(context).settings.arguments as BottomNavigationWidgetArgumentClass;
    // if(args == null){
    //   sessionUser = widget.sessionUser;
    // }else{
    //   sessionUser = args.sessionUser;
    // }
    sessionUser = widget.sessionUser;
    LogedInUserID = sessionUser.id;
    return FutureBuilder<Users>(
      future: _getUser(LogedInUserID),
      builder: (ctx, snapshot) {
        //List<Posts> PostsData = snapshot.data;
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            UserObject = snapshot.data;
            return _buildUI(UserObject,sessionUser);
          default:
            return _buildLoadingScreen();
        }
      },
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

  Widget _buildUI(Users UserObject, Users sessionUser) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: _getAppBar(),
        body: _getBody(),
        bottomNavigationBar: _getBottomNavigation(sessionUser),
      ),
    );
  }


  Future<Users> _getUser(String usersID) async {
    print("User");
    print(usersID);
    try {
      List<Users>UserObjectList = await Amplify.DataStore.query(Users.classType ,where :Users.ID.eq(usersID));
      //print(User[0].first_name);
      print(UserObjectList.length);
      print(UserObjectList[0].first_name);
      //await Future.delayed(Duration(seconds: 1));
      return UserObjectList[0];
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }

  _getBottomNavigation(Users sessionUser) {
    return BottomNavigationWidget(
      //MosqueFollowersList: UserMosqueFollowingList,
      //CallingFunction: _navigateback(),
      sessionUser: sessionUser,
      CallingScreen: "CreatePost",
      index: 2,
    );
  }

  _getBody() {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _getUserDataAndPost(),
            CustomSpacerWidget(
              height: 10,
            ),
            _getMediaPickerSection(),
            CustomSpacerWidget(
              height: 30,
            ),
            //_getPrivacyOfUser(),
            _getPostVisibilityDropDown(),
            CustomSpacerWidget(
              height: 80,
            ),
            _getAddAndCancelButton(),
          ],
        ),
      ),
    );
  }

  _getAppBar() {
    return AppBar(
      elevation: 2,
      backgroundColor: AppColors.white,
      toolbarHeight: 70,
      centerTitle: true,
      title: Container(
        padding: EdgeInsets.only(top: 15),
        child: Text(
          AppTexts.CREATE_POST,
          style: TextStyle(
              fontSize: 20,
              color: AppColors.black,
              fontFamily: FontConstants.FONT,
              fontWeight: FontWeight.bold),
        ),
      ),
      leading: Container(
        padding: EdgeInsets.only(top: 15, left: 20, right: 20),
        child:GestureDetector(
          onTap: ()=>{
            //_navigateback()
            Navigator.of(context)
               .push(MaterialPageRoute(builder: (context) => HomeScreen(sessionUser:sessionUser)))
          },
          child: AssetImageWidget(
            image: ImageConstants.IC_BACK,
            height: 10,
            width: 10,
          ),
        ),
      ),
    );
  }

  _navigateback(){
    //Navigation.intent(context, AppRoutes.HOME);
    print("inside create post navigate back");
    print(sessionUser);
    //print(widget.sessionUser.first_name);
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => HomeScreen(sessionUser:widget.sessionUser)));
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => HomeScreen(sessionUser: sessionUser)));

  }

  _getUserDataAndPost() {
    return Material(
      elevation: 5,
      shadowColor: AppColors.white,
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _getHeader(),
          Divider(
            color: AppColors.light_grey,
            thickness: 1.5,
          ),
          _getTextSection(),
        ],
      ),
    );
  }

  _getHeader() {
    return Container(
      padding: EdgeInsets.only(top: 15,bottom: 5,left: 15,right: 15),
      child: Row(
        children: [
          _getProfileImage(),
          CustomSpacerWidget(
            width: 5,
          ),
          _getUserName(),
        ],
      ),
    );
  }

  /// This will return profile image.
  _getProfileImage() {
    return S3BucketImageWidget(
      //image: widget.UserProfileImage,
      image: UserProfileImage,
      height: 50,
      width: 50,
    );
  }

  _getUserName() {
    return Text(
      //AppTexts.TEMP_USER_NAME,
      /// un comment this when userName is passed
      //widget.UserName,
      //UserName,
      UserObject.first_name + " " + UserObject.last_name,
      style: TextStyle(
        fontFamily: FontConstants.FONT,
        fontSize: 13,
        fontWeight: FontWeight.w800,
        color: AppColors.black,
      ),
    );
  }


  _getTextSection() {
    return Container(
      height: 300,
      padding: EdgeInsets.only(top: 0, left: 20, right: 20),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: CreatePostTextFieldWidget(
              controller: _thoughtsController,
              hintText: AppTexts.YOUR_THOUGHTS,
            ),
          ),

          //Here the rest Text will come if there,
          Expanded(flex: 2, child: Container())
        ],
      ),
    );
  }

  _getMediaPickerSection() {
    print("Inside media picker");
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.light_grey.withOpacity(0.5),
      ),
      child: Row(
        children: [
          Expanded(
            child: MediaSourceWidget(
              image: ImageConstants.IC_CAMERA,
              text: AppTexts.CAMERA_TEXT,
              callBack:(){ _handleOpenCamera();},
            ),
          ),
          CustomSpacerWidget(
            width: 8,
          ),
          Expanded(
            child: MediaSourceWidget(
              image: ImageConstants.IC_CAMERA,
              text: AppTexts.GALLERY_TEXT,
              callBack:(){ _handleOpenGallery();},
            ),
          ),
        ],
      ),
    );
  }

  _handleOpenCamera(){
    print("Open camera");
    getImage(true);
    //Navigator.of(context)
    //  .push(MaterialPageRoute(builder: (context) => PhoneGallery()));
  }

  _handleOpenGallery(){
    print("open gallery");
    getImage(false);
  }

  _getPrivacyOfUser() {
    return GestureDetector(
      onTap: (){
        ///Change Post Privacy here
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
              borderRadius: BorderRadius.circular(12), color: AppColors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppTexts.POST_VISIBILITY,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 12,
                      color: AppColors.black,
                    ),
                  ),
                  CustomSpacerWidget(height: 5,),
                  Text(
                    AppTexts.PUBLIC_TEXT,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: AppColors.light_grey,
                    ),
                  )
                ],
              ),
              Expanded(
                child: CustomSpacerWidget(
                  width: 5,
                ),
              ),
              _getChangeText(),
              CustomSpacerWidget(width: 5,),
              _getNextButton(),
            ],
          ),
        ),
      ),
    );
  }

  _getPostVisibilityDropDown() {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: DropDownTextField(
        fieldName: AppTexts.POST_VISIBILITY,
        data: AppTexts.POST_VISIBILITY_CATEGORIES,
        callBack: (val) {
          postVisibility = val;
          print(val);
        },
      ),
    );
  }

  _getChangeText() {
    return Text(
      AppTexts.CHANGE_TEXT,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 13,
        color: AppColors.light_grey,
      ),
    );
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
              _navigateToHome();
              //Navigation.back(context);
            },
          ),
          CustomSpacerWidget(width: 20,),
          Expanded(
            child: ActionButtonWidget(
              text: AppTexts.SAVE,
              isFilled: true,
              callBack: () {
                _SavePost();
                //Navigation.back(context);
                //print("Save");
              },
            ),
          ),
        ],
      ),
    );
  }


/// Method to upload image file to S3 bucket
  Future<String> uploadFile(File _image, String filepath) async {
    try {
      final fileName = filepath.split('/').last;
      //final fileName = DateTime.now().toIso8601String();
      var dir = await getApplicationDocumentsDirectory();
      //File file = File(await getFilePath()); // 1
      File file = _image;
      file.writeAsString("This is my demo text that will be saved to : demoTextFile.txt");
      final result = await Amplify.Storage.uploadFile(
        //local: file,
        local: file,
        //local: File(await getFilePath()),
        //local: File('C:/Venkat/Sriram/Projects/MusGreet/Code/musgreet_phase1/musgreet/assets/images/logo.png'),
        //key: fileName + '.png',
        key:fileName,
      );
      //final x = Amplify.Storage.put('text.txt', 'Hello');
      print('image uploaded to S3 successfully!');
      print(result.key);
      //String url = getUrlForFile(result.key);
      String url = "";
      getUrlForFile(result.key).then((result) {
        setState(() {
          print("inside set state");
          if (result is String)
            url = result.toString(); //use toString to convert as String
        });
      });
      await Future.delayed(Duration(milliseconds: 1000));
      //return result.key;
      print("inside upload file");
      print(url.split('?')[0]);
      return url;
    } catch (e) {
      print('Error in uploading image to S3');
      throw e;
    }
  }
/// Method to get Image URL of the file
  Future<String> getUrlForFile(String fileKey) async {
    try {
      final result = await Amplify.Storage.getUrl(key: fileKey);
      print("inside get url");
      print(result.url.toString());
      //UrlString = result.url.toString();
      //s3://musgreetphase1images184452-staging/public/2021-05-26T22:07:56.979371.txt
      //await Future.delayed(Duration(seconds: 2));
      return result.url;
      //return UrlString;
    } catch (e) {
      print('Error in getUrl method');
      throw e;
    }
  }


  _SavePosts() {
    print("inside save ");
    print(postVisibility);
    print(_thoughtsController.text);
    print(S3ImageURL.split('?')[0]);
    //print(S3ImageURL.toString());
    _thoughtsController.clear();
    print(postVisibility);

  }
/// This Method is to save post in Database
  Future<void> _SavePost() async{
    print(_thoughtsController.text);
    print(S3ImageURL);
    print(postVisibility);
    print("inside Save Posts");
    try {
    final item = Posts(
        post: _thoughtsController.text,
        post_image_path: S3ImageURL.split('?')[0],
        description: "Keep Smiling",
        visibility: postVisibility,
        usersID: sessionUser.id,
        //usersID: "40d605ff-0ce4-4b4f-ae43-9e97d37c6cfc",
        //usersID: UserObject.ID,
        //usersID: "49e213cb-2849-4164-b5c6-4e6ab971c4c7",
        mosquesID: "",
        Post_Comments: [],
        Post_Likes: []);
    await Amplify.DataStore.save(item);
    print("saved post Successfully by sindhuja");
    _thoughtsController.clear();
    _navigateToHome();
    } catch (e) {
      print("Could not query DataStore: " + e);
    }
  }

  ///This method will navigate back to Home
  _navigateToHome() {
    // Navigation.intent(context, AppRoutes.HOME);
    print(sessionUser.first_name);
    //print(widget.sessionUser);
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => HomeScreen(sessionUser:sessionUser)));
  }


}

/// this will render text field on the screen
class CreatePostTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  CreatePostTextFieldWidget({this.controller, this.hintText});

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<CreatePostTextFieldWidget> {
  //final ctrlText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(widget.controller.text);
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5, top: 5),
      child: TextField(
        controller: widget.controller,
        maxLines: null,
        expands: true,
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontFamily: FontConstants.FONT,
          fontSize: 16,
          color: AppColors.black,
        ),
        decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontFamily: FontConstants.FONT,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.light_grey,
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            contentPadding: EdgeInsets.only(bottom: 10)),
        onSubmitted: (String str){
          print("inside on submitted");
          print(str);
        },
      ),
    );
  }
}
