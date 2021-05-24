import 'package:flutter/material.dart';

import 'package:flutter_xaurius/screen/intro/splash_screen.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();
    _initCheck();
  }

  bool isUser = false;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        disabledColor: brokenWhiteColor,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: textWhiteColor,
            ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: textWhiteColor, fontSizeDelta: 0),
          iconTheme: IconThemeData(color: textWhiteColor),
          actionsIconTheme: IconThemeData(color: textWhiteColor),
        ),
      ),
      home: SplashScreen(
        isUser: isUser,
      ),
    );
  }

  void _initCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('isUser') != null) {
      setState(() {
        isUser = prefs.getBool('isUser');
      });
    }
  }
}
