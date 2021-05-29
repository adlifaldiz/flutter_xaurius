import 'package:flutter/material.dart';
import 'package:flutter_xaurius/helper/screen_utils.dart';
import 'package:flutter_xaurius/screen/menu_screen/menu_screen.dart';

import 'package:flutter_xaurius/screen/auth_screen/login_screen.dart';
import 'package:flutter_xaurius/screen/intro/onboarding_screen.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key, this.isUser}) : super(key: key);
  final bool isUser;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: widget.isUser ? MenuScreen() : OnBoardingScreen(),
      duration: 5000,
      imageSize: 100,
      imageSrc: 'assets/images/xaurius_logo_yellow.png',
      backgroundColor: backgroundColor,
      text: "XAURIUS",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        color: primaryColor,
        fontSize: percentWidth(context, 15),
        fontWeight: FontWeight.bold,
      ),
      colors: [
        primaryColor,
        primaryColor,
        brokenWhiteColor,
        primaryColor,
      ],
    );
  }
}
