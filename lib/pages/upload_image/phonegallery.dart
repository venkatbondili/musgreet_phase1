import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class PhoneGallery extends StatefulWidget {
  @override
  _PhoneGalleryState createState() => _PhoneGalleryState();
}

class _PhoneGalleryState extends State<PhoneGallery> {

  var pickedFile;
  var filepath = 'assets/images/logo.png';
  File _image;

  Future getImage(bool isCamera) async {

    final picker = ImagePicker();

    if (isCamera) {
      final pickedFile = await picker.getImage(source: ImageSource.camera);
    }
    else {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);
    }

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        filepath = pickedFile.path;
      } else {
        filepath = 'assets/images/google.png';
        print('No image selected.');
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                new IconButton(
                  icon: new Icon(Icons.insert_drive_file),
                  highlightColor: Colors.pink,
                  onPressed: () {
                    getImage(false);
                  },
                ),
                new IconButton(
                  icon: new Icon(Icons.camera_alt),
                  highlightColor: Colors.pink,
                  onPressed: () {
                    getImage(true);
                  },
                ),
                Image.asset(
                  filepath,
                ),
                _image == null? Container() : Image.file(_image, height: 300.0, width: 300.0,)


             
              ],
            )));
  }


}
