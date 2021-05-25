import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Test extends StatefulWidget {
  Test({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  File _image;
  final pickedFile = ImagePicker();
  Future getImage() async {
    final image = await pickedFile.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            _image == null ? Text('Test') : Image.file(_image),
            FlatButton(
                onPressed: () {
                  _showChoice(context);
                },
                child: Text('pick me'))
          ],
        )),
      ),
    );
  }

  void _showChoice(BuildContext context) {
    Get.defaultDialog(
      title: 'Kamu yakin',
      middleText: 'Ingin keluar dari aplikasi?',
      backgroundColor: backgroundPanelColor,
      cancel: RaisedButton(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () {
          getImage();
          Get.back();
        },
        child: Text(
          'Gallery',
          style: stylePrimary,
        ),
      ),
      confirm: RaisedButton(
        color: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () {
          // takeImage();
          Get.back();
        },
        child: Text(
          'Kamera',
          style: buttonStyle,
        ),
      ),
    );
  }
}
