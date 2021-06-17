import 'dart:io';
import 'dart:ui';
import 'package:amplify_flutter/amplify.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mus_greet/core/config/navigation.dart';
import 'package:mus_greet/core/utils/constants.dart';
import 'package:mus_greet/core/widgets/custom_spacer_widget.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:mus_greet/pages/upload_image/phonegallery.dart';


///Call this widget like this
/*_handleSearch() {
  print("Handle Search!!");
  showModalBottomSheet(
    elevation: 15,
    enableDrag: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: UploadImageBottomSheetWidget(),
      );
    },
  );
}*/


class UploadImageBottomSheetWidget extends StatefulWidget {
  @override
  _UploadImageBottomSheetWidgetState createState() =>
      _UploadImageBottomSheetWidgetState();
}

class _UploadImageBottomSheetWidgetState
    extends State<UploadImageBottomSheetWidget> {
  var pickedFile;
  var filepath = '';
  String S3ImageURL = "";
  File _image;

  Future getImage(bool isCamera) async {
    print("inside getImage");
    final picker = ImagePicker();
    print(pickedFile);

    if (isCamera) {
      final pickedFile = await picker.getImage(source: ImageSource.camera);
    }
    else {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);
    }

    setState(() {
      print("inside set state");
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        filepath = pickedFile.path;
        print("calling upload file");
        uploadFile(_image, filepath).then((result) {
          setState(() {
            if (result is String)
              S3ImageURL = result.toString(); //use toString to convert as String
          });
        });
      } else {
        filepath = 'assets/images/google.png';
        print('No image selected.');
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _getButtons(),
    );
  }

  _getSelectImageSourceButton({String buttonText, bool isCancel = false}) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 25, top: 25),
      child: Text(
        buttonText,
        style: TextStyle(
            fontFamily: FontConstants.FONT,
            fontSize: 16,
            fontWeight: isCancel ? FontWeight.w500 : FontWeight.w900,
            color: isCancel ? AppColors.vertical_divider : AppColors.black),
      ),
    );
  }

  _getButtons() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: AppColors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomSpacerWidget(height: 5,),
          GestureDetector(
            onTap: ()=> _handleOpenGallery(),
            child: _getSelectImageSourceButton(
              buttonText: AppTexts.GALLERY,
            ),
          ),
          Divider(
            height: 5,
            thickness: 0.5,
            color: AppColors.vertical_divider.withOpacity(0.3),
          ),
          GestureDetector(
            onTap: ()=> _handleOpenCamera(),
            child: _getSelectImageSourceButton(
              buttonText: AppTexts.CAMERA,
            ),
          ),
          Divider(
            height: 5,
            thickness: .5,
            color: AppColors.vertical_divider.withOpacity(0.3),
          ),
          GestureDetector(
            onTap: () => _handleCancel(),
            child: _getSelectImageSourceButton(
              buttonText: AppTexts.CANCEL,
              isCancel: true,
            ),
          )
        ],
      ),
    );
  }

  _handleCancel(){
    print("Navigation Back");
    Navigation.back(context);
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


}
