import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:get/get.dart';
import 'package:onboarding/onboarding.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final onboardingPagesList = [
    PageModel(
      image: Image.asset('assets/images/onboarding_1.png'),
      title: Text('Selamat datang di XAURIUS'),
      info: Text("Cryptocurrency pertama di Indonesia yang didukung Emas"),
    ),
    PageModel(
      image: Image.asset('assets/images/onboarding_3.png'),
      title: Text('Bertransaksi Emas dengan Mudah di Seluruh Dunia'),
      info: Text(
          "Beli, Jual dan Transfer Emas Di Mana Saja, Kapan Saja dalam Hitungan Detik"),
    ),
    PageModel(
      image: Image.asset('assets/images/onboarding_2.png'),
      title: Text('Aman dan nyaman'),
      info: Text(
          "Memastikan keamanan, keamanan & transparansi berkat teknologi blockchain"),
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Onboarding(
      skipButtonStyle: SkipButtonStyle(
        skipButtonColor: primaryColor,
        skipButtonText: Text(
          'Skip',
          style: TextStyle(
            color: textBlackColor,
          ),
        ),
      ),
      proceedButtonStyle: ProceedButtonStyle(
        proceedButtonRoute: (context) {
          return Get.offAllNamed(Routes.LOGIN);
        },
        proceedpButtonText: Text('Lanjut'),
      ),
      pages: onboardingPagesList,
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
