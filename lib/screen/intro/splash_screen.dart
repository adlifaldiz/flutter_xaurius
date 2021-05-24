import 'package:animated_background/animated_background.dart';
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
  ParticleOptions particleOptions = ParticleOptions(
    image: Image.asset('assets/images/coin.png'),
    baseColor: Colors.red,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.5,
    spawnMinSpeed: 10.0,
    spawnMaxSpeed: 30.0,
    spawnMinRadius: 7.0,
    spawnMaxRadius: 50.0,
    particleCount: 10,
  );

  var particlePaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.0;
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
    // return Scaffold(
    // backgroundColor: backgroundPanelColor.withOpacity(0.2),
    // body: AnimatedBackground(
    //   behaviour: RandomParticleBehaviour(
    //     options: particleOptions,
    //     paint: particlePaint,
    //   ),
    //   vsync: this,
    //   child: SplashScreenView(
    //     home: widget.isUser ? MenuScreen() : OnBoardingScreen(),
    //     duration: 5000,
    //     imageSize: 90,
    //     imageSrc: "assets/images/logo_ss.png",
    //     backgroundColor: backgroundPanelColor.withOpacity(0.3),
    //   ),
    // ),

    // );
  }
}
