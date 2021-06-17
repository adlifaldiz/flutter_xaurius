import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splash_screen_view/ColorizeAnimatedText.dart';

import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:flutter_xaurius/app/widget/my_shimmer.dart';

import '../controllers/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin {
  SplashController controller;
  AnimationController _animationController;
  Animation<double> _animation;
  String _text = "XAURIUS";
  TextStyle _textStyle;

  @override
  void initState() {
    super.initState();
    controller = Get.find<SplashController>();
    _animationController = new AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInCirc));
    _animationController.forward();

    Future.delayed(Duration(milliseconds: 5000)).then((value) {
      if (controller.isUserLogged && controller.isUserBoarding) {
        Get.offAllNamed(Routes.RE_LOGIN);
      } else if (controller.isUserLogged == false && controller.isUserBoarding) {
        Get.offAllNamed(Routes.LOGIN);
      } else {
        Get.offAllNamed(Routes.ON_BOARDING);
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
              MyShimmer.fromColors(
                baseColor: primaryColor,
                highlightColor: textWhiteColor,
                child: Image.asset(
                  'assets/images/xaurius_logo_yellow.png',
                  height: 100,
                ),
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
      return MyShimmer.fromColors(
        baseColor: primaryColor,
        highlightColor: textWhiteColor,
        child: Text(
          _text,
          style: _textStyle,
        ),
      );
      // return ColorizeAnimatedText(
      //   text: _text,
      //   speed: Duration(milliseconds: 3000),
      //   textStyle: _textStyle,
      //   colors: [
      //     primaryColor,
      //     primaryColor,
      //     brokenWhiteColor,
      //     primaryColor,
      //   ],
      // );
    } else {
      return SizedBox(
        width: 1,
      );
    }
  }
}
