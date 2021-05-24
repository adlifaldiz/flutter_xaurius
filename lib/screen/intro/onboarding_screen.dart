import 'package:flutter/material.dart';
import 'package:flutter_xaurius/screen/auth_screen/login_screen.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:onboarding/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final onboardingPagesList = [
    PageModel(
      assetPath: 'assets/images/onboarding_1.png',
      title: 'Selamat datang di XAURIUS',
      info: "Cryptocurrency pertama di Indonesia yang didukung Emas",
    ),
    PageModel(
      assetPath: 'assets/images/onboarding_3.png',
      title: 'Bertransaksi Emas dengan Mudah di Seluruh Dunia',
      info: "Beli, Jual dan Transfer Emas Di Mana Saja, Kapan Saja dalam Hitungan Detik",
    ),
    PageModel(
      assetPath: 'assets/images/onboarding_2.png',
      title: 'Aman dan nyaman',
      info: "Memastikan keamanan, keamanan & transparansi berkat teknologi blockchain",
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
        skipButtonTextStyle: TextStyle(color: textBlackColor),
      ),
      pagesImageColor: null,
      proceedButtonStyle: ProceedButtonStyle(
          proceedButtonRoute: (context) {
            return Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
                (route) => false);
          },
          proceedButtonText: 'Lanjut'),
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
