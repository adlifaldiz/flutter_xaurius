import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/modules/intro/views/intro_view.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:flutter_xaurius/helper/screen_utils.dart';
import 'package:flutter_xaurius/helper/theme.dart';

import 'package:get/get.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: IntroView(),
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
