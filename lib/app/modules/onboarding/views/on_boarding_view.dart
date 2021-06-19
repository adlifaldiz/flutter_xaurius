import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:onboarding/onboarding.dart';

import '../controllers/on_boarding_controller.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  final onBoardingPagesList = [
    PageModel(
      image: Image.asset('assets/images/onboarding_1.png'),
      title: Text('on_boarding_title_1'.tr, style: textTitle.copyWith(fontSize: 25)),
      info: Text("on_boarding_sub_1".tr, style: TextStyle(color: brokenWhiteColor)),
    ),
    PageModel(
      image: Image.asset('assets/images/onboarding_3.png'),
      title: Text('on_boarding_title_2'.tr, style: textTitle.copyWith(fontSize: 25)),
      info: Text("on_boarding_sub_2".tr, style: TextStyle(color: brokenWhiteColor)),
    ),
    PageModel(
      image: Image.asset('assets/images/onboarding_2.png'),
      title: Text('on_boarding_title_3'.tr, style: textTitle.copyWith(fontSize: 25)),
      info: Text("on_boarding_sub_3".tr, style: TextStyle(color: brokenWhiteColor)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Onboarding(
      skipButtonStyle: SkipButtonStyle(
        skipButtonColor: brokenWhiteColor,
        skipButtonText: Text(
          'on_boarding_skip_btn'.tr,
          style: buttonStyle,
        ),
      ),
      proceedButtonStyle: ProceedButtonStyle(
        proceedButtonColor: primaryColor,
        proceedButtonRoute: (context) {
          return controller.onProceed();
        },
        proceedpButtonText: Text(
          'on_boarding_next_btn'.tr,
          style: buttonStyle,
        ),
      ),
      pages: onBoardingPagesList,
      indicator: Indicator(
        indicatorDesign: IndicatorDesign.polygon(
          polygonDesign: PolygonDesign(
            polygon: DesignType.polygon_circle,
          ),
        ),
      ),
    );
  }
}
