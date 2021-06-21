import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/menus_controller.dart';

class MenusView extends GetView<MenusController> {
  MenusController _controller = Get.put(MenusController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: PageView(
          controller: _controller.pageController,
          onPageChanged: (index) {
            _controller.onPageChange(index);
          },
          children: _controller.screens,
          // physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavyBar(
          curve: Curves.ease,
          backgroundColor: backgroundPanelColor,
          selectedIndex: _controller.currentIndex.value,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) {
            _controller.onItemSelected(index);
            _controller.pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.ease);
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
    });
  }
}
