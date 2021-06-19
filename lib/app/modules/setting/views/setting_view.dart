import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:flutter_xaurius/app/widget/coming_soon.dart';
import 'package:flutter_xaurius/app/widget/menu_tile.dart';
import 'package:flutter_xaurius/app/widget/xau_container.dart';
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
              XauriusContainer(
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
                      onTap: () => Get.toNamed(Routes.PROFILE),
                    ),
                    MenuTile(
                      icon: FontAwesomeIcons.userLock,
                      title: 'setting_pin'.tr,
                      onTap: () {},
                    ),
                    MenuTile(
                      icon: FontAwesomeIcons.building,
                      title: 'bank_account'.tr,
                      onTap: () => Get.toNamed(Routes.BANK),
                    ),
                    // MenuTile(
                    //   icon: FontAwesomeIcons.addressBook,
                    //   title: 'Alamat',
                    //   onTap: () {},
                    // ),
                    MenuTile(
                      icon: FontAwesomeIcons.gift,
                      title: 'setting_refferal'.tr,
                      onTap: () => Get.to(ComingSoonScreen()),
                    ),
                    MenuTile(
                      icon: FontAwesomeIcons.ticketAlt,
                      title: 'Voucher',
                      onTap: () => Get.toNamed(Routes.VOUCHER),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              XauriusContainer(
                child: Column(
                  children: [
                    MenuTile(
                      icon: FontAwesomeIcons.infoCircle,
                      color: brokenWhiteColor,
                      title: 'setting_faq'.tr,
                      onTap: () => Get.toNamed(Routes.FAQ),
                    ),
                    MenuTile(
                      icon: FontAwesomeIcons.infoCircle,
                      color: brokenWhiteColor,
                      title: 'setting_terms'.tr,
                      onTap: () => Get.toNamed(Routes.TNC),
                    ),
                    MenuTile(
                      icon: FontAwesomeIcons.infoCircle,
                      color: brokenWhiteColor,
                      title: 'setting_privacy'.tr,
                      onTap: () => Get.toNamed(Routes.PRIVACY_POLICY),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              XauriusContainer(
                child: Column(
                  children: [
                    MenuTile(
                      icon: FontAwesomeIcons.cog,
                      title: 'setting_system'.tr,
                      onTap: () => Get.toNamed(Routes.SYSTEM),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              XauriusContainer(
                child: Column(
                  children: [
                    MenuTile(
                      icon: FontAwesomeIcons.signOutAlt,
                      title: 'setting_logout'.tr,
                      onTap: () {
                        _showLogout(context);
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

  void _showLogout(BuildContext context) {
    Get.defaultDialog(
      title: 'Kamu yakin',
      middleText: 'Ingin keluar dari aplikasi?',
      backgroundColor: backgroundPanelColor,
      cancel: RaisedButton(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: () => Get.back(),
        child: Text(
          'Tidak',
          style: stylePrimary,
        ),
      ),
      confirm: RaisedButton(
        color: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: controller.logout,
        child: Text(
          'Ya',
          style: buttonStyle,
        ),
      ),
    );
  }
}
