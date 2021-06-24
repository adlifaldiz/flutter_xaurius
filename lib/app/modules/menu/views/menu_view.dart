import 'dart:io';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/modules/menu/controllers/menu_controller.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MenuView extends GetView<MenuController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Obx(() {
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
              // controller.pageController.jumpToPage(index);
            },
            items: [
              BottomNavyBarItem(
                  icon: FaIcon(
                    FontAwesomeIcons.dashcube,
                    size: 18,
                  ),
                  title: Text(
                    'bot_menu_dash'.tr,
                    style: TextStyle(fontSize: 16),
                  ),
                  activeColor: primaryColor,
                  inactiveColor: brokenWhiteColor),
              BottomNavyBarItem(
                  icon: FaIcon(
                    FontAwesomeIcons.exchangeAlt,
                    size: 18,
                  ),
                  title: Text(
                    'bot_menu_transaction'.tr,
                    style: TextStyle(fontSize: 16),
                  ),
                  activeColor: primaryColor,
                  inactiveColor: brokenWhiteColor),
              BottomNavyBarItem(
                  icon: FaIcon(
                    FontAwesomeIcons.history,
                    size: 18,
                  ),
                  title: Text(
                    'bot_menu_history'.tr,
                    style: TextStyle(fontSize: 16),
                  ),
                  activeColor: primaryColor,
                  inactiveColor: brokenWhiteColor),
              BottomNavyBarItem(
                  icon: FaIcon(
                    FontAwesomeIcons.userAlt,
                    size: 18,
                  ),
                  title: Text(
                    'bot_menu_setting'.tr,
                    style: TextStyle(fontSize: 16),
                  ),
                  activeColor: primaryColor,
                  inactiveColor: brokenWhiteColor),
            ],
          ),
        );
      }),
    );
  }
}
