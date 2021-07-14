import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/widget/menu_tile.dart';
import 'package:flutter_xaurius/app/widget/xau_container_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              XauriusContainerList(
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(20),
                //   image: DecorationImage(
                //     image: AssetImage('assets/images/mesh-right.png'),
                //     alignment: Alignment.centerRight,
                //     fit: BoxFit.contain,
                //   ),
                // ),
                child: Column(
                  children: [
                    MenuTile(
                      icon: FontAwesomeIcons.userAlt,
                      title: 'setting_profile'.tr,
                      onTap: () => controller.router(1),
                    ),
                    // MenuTile(
                    //   icon: FontAwesomeIcons.userLock,
                    //   title: 'setting_pin'.tr,
                    //   onTap: () {},
                    // ),
                    MenuTile(
                      icon: FontAwesomeIcons.building,
                      title: 'bank_account'.tr,
                      onTap: () => controller.router(2),
                    ),
                    // MenuTile(
                    //   icon: FontAwesomeIcons.addressBook,
                    //   title: 'Alamat',
                    //   onTap: () {},
                    // ),
                    MenuTile(
                      icon: FontAwesomeIcons.gift,
                      title: 'setting_refferal'.tr,
                      onTap: () => controller.router(3),
                    ),
                    MenuTile(
                      icon: FontAwesomeIcons.ticketAlt,
                      title: 'Voucher',
                      onTap: () => controller.router(4),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              XauriusContainerList(
                child: Column(
                  children: [
                    MenuTile(
                      icon: FontAwesomeIcons.infoCircle,
                      color: brokenWhiteColor,
                      title: 'setting_faq'.tr,
                      onTap: () => controller.router(5),
                    ),
                    MenuTile(
                      icon: FontAwesomeIcons.infoCircle,
                      color: brokenWhiteColor,
                      title: 'setting_terms'.tr,
                      onTap: () => controller.router(6),
                    ),
                    MenuTile(
                      icon: FontAwesomeIcons.infoCircle,
                      color: brokenWhiteColor,
                      title: 'setting_privacy'.tr,
                      onTap: () => controller.router(7),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              XauriusContainerList(
                child: Column(
                  children: [
                    MenuTile(
                      icon: FontAwesomeIcons.cog,
                      title: 'setting_system'.tr,
                      onTap: () => controller.router(8),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              XauriusContainerList(
                child: Column(
                  children: [
                    MenuTile(
                      icon: FontAwesomeIcons.signOutAlt,
                      title: 'setting_logout'.tr,
                      onTap: () {
                        showLogout(controller);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  showLogout(SettingController settingController) {
    Get.defaultDialog(
      title: 'you_sure'.tr,
      middleText: 'close_app'.tr,
      backgroundColor: backgroundPanelColor,
      cancel: RaisedButton(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: () => Get.back(),
        child: Text(
          'no_btn'.tr,
          style: stylePrimary,
        ),
      ),
      confirm: RaisedButton(
        color: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: settingController.logout,
        child: Text(
          'yes_btn'.tr,
          style: buttonStyle,
        ),
      ),
    );
  }
}
