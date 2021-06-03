import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/modules/menu/views/menu_view.dart';
import 'package:flutter_xaurius/app/modules/onboarding/views/on_boarding_view.dart';

import 'package:get/get.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: controller.isUser ? MenuView() : OnBoardingView(),
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
