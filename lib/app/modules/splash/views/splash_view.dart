import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/widget/my_shimmer.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Obx(
          () => AnimatedOpacity(
            duration: controller.duration,
            opacity: controller.isLoading.value ? 1.0 : 0.0,
            curve: Curves.easeInOut,
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
                getTextWidget(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getTextWidget(context) {
    return MyShimmer.fromColors(
      baseColor: primaryColor,
      highlightColor: textWhiteColor,
      child: Text(
        'XAURIUS',
        style: TextStyle(
          color: primaryColor,
          fontSize: percentWidth(context, 15),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
