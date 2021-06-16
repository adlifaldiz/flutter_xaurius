import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/modules/menu/controllers/menu_controller.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MenuView extends GetView<MenuController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: PageView(
          controller: controller.pageController,
          onPageChanged: (index) {
            controller.onPageChange(index);
          },
          children: controller.screens,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavyBar(
          curve: Curves.ease,
          backgroundColor: backgroundPanelColor,
          selectedIndex: controller.currentIndex.value,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) {
            controller.onItemSelected(index);
            controller.pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.ease);
          },
          items: [
            BottomNavyBarItem(
                icon: FaIcon(FontAwesomeIcons.dashcube), title: Text('Dashboard'), activeColor: primaryColor, inactiveColor: brokenWhiteColor),
            BottomNavyBarItem(
                icon: FaIcon(FontAwesomeIcons.exchangeAlt), title: Text('Transaksi'), activeColor: primaryColor, inactiveColor: brokenWhiteColor),
            BottomNavyBarItem(
                icon: FaIcon(FontAwesomeIcons.history), title: Text('History'), activeColor: primaryColor, inactiveColor: brokenWhiteColor),
            BottomNavyBarItem(
                icon: FaIcon(FontAwesomeIcons.userAlt), title: Text('Akun'), activeColor: primaryColor, inactiveColor: brokenWhiteColor),
          ],
        ),
      );
    });
  }
}
