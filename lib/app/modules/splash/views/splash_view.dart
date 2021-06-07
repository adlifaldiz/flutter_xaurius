import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/modules/menu/views/menu_view.dart';
import 'package:flutter_xaurius/app/modules/onboarding/views/on_boarding_view.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:splash_screen_view/ColorizeAnimatedText.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import '../controllers/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  SplashController controller;
  AnimationController _animationController;
  Animation<double> _animation;
  String _text = "XAURIUS";
  TextStyle _textStyle;

  @override
  void initState() {
    super.initState();
    controller = Get.find<SplashController>();
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 100));
    _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeInCirc));
    _animationController.forward();

    Future.delayed(Duration(milliseconds: 5000)).then((value) {
      if (controller.isUserLogged) {
        Get.offAllNamed(Routes.RE_LOGIN);
      } else {
        Get.offAllNamed(Routes.LOGIN);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.reset();
  }

  @override
  Widget build(BuildContext context) {
    _textStyle = TextStyle(
      color: primaryColor,
      fontSize: percentWidth(context, 15),
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/xaurius_logo_yellow.png',
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, top: 20),
                child: getTextWidget(),
              )
            ],
          ),
        ),
      ),
    );

    // return SplashScreenView(
    //   navigateRoute: controller.storage.read('username') != null ? MenuView() : OnBoardingView(),
    //   duration: 5000,
    //   imageSize: 100,
    //   imageSrc: 'assets/images/xaurius_logo_yellow.png',
    //   backgroundColor: backgroundColor,
    //   text: "XAURIUS",
    //   textType: TextType.ColorizeAnimationText,
    //   textStyle: TextStyle(
    //     color: primaryColor,
    //     fontSize: percentWidth(context, 15),
    //     fontWeight: FontWeight.bold,
    //   ),
    //   colors: [
    //     primaryColor,
    //     primaryColor,
    //     brokenWhiteColor,
    //     primaryColor,
    //   ],
    // );
  }

  Widget getTextWidget() {
    if (_text != null) {
      return ColorizeAnimatedText(
        text: _text,
        speed: Duration(milliseconds: 1000),
        textStyle: _textStyle,
        colors: [
          primaryColor,
          primaryColor,
          brokenWhiteColor,
          primaryColor,
        ],
      );
    } else {
      return SizedBox(
        width: 1,
      );
    }
  }
}
