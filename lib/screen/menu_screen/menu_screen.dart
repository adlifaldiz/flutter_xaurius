import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_xaurius/screen/menu_screen/history_screen.dart';
import 'package:flutter_xaurius/screen/menu_screen/setting_screen.dart';
import 'package:flutter_xaurius/screen/menu_screen/dashboard_screen.dart';
import 'package:flutter_xaurius/screen/menu_screen/transaction_screen.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MenuScreen extends StatefulWidget {
  MenuScreen({Key key}) : super(key: key);

  @override
  _MenuScreenState createState() => new _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with TickerProviderStateMixin {
  PageController _pageController = PageController();

  DateTime currentBackPressTime;
  int currentIndex = 0;
  List<Widget> _screens = [
    DashboardScreen(),
    TransactionScreen(),
    HistoryScreen(),
    SettingScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    currentIndex = int.parse(_pageController.initialPage.toString());
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => currentIndex = index);
        },
        children: _screens,
        // physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavyBar(
        curve: Curves.ease,
        backgroundColor: backgroundPanelColor,
        selectedIndex: currentIndex,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) {
          setState(() => currentIndex = index);
          _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.ease);
        },
        items: [
          BottomNavyBarItem(
              icon: FaIcon(FontAwesomeIcons.dashcube), title: Text('Dashboard'), activeColor: primaryColor, inactiveColor: brokenWhiteColor),
          BottomNavyBarItem(
              icon: FaIcon(FontAwesomeIcons.exchangeAlt), title: Text('Transaksi'), activeColor: primaryColor, inactiveColor: brokenWhiteColor),
          BottomNavyBarItem(
              icon: FaIcon(FontAwesomeIcons.history), title: Text('History'), activeColor: primaryColor, inactiveColor: brokenWhiteColor),
          BottomNavyBarItem(
              icon: FaIcon(FontAwesomeIcons.cog), title: Text('Pengaturan'), activeColor: primaryColor, inactiveColor: brokenWhiteColor),
        ],
      ),
    );
  }
}
