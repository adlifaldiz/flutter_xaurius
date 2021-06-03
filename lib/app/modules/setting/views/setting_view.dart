import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:flutter_xaurius/app/widget/coming_soon.dart';
import 'package:flutter_xaurius/app/widget/menu_tile.dart';
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
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: backgroundPanelColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        MenuTile(
                          icon: FontAwesomeIcons.userAlt,
                          title: 'Profil saya',
                          onTap: () => Get.toNamed(Routes.PROFILE),
                        ),
                        MenuTile(
                          icon: FontAwesomeIcons.userLock,
                          title: 'Set pin',
                          onTap: () {},
                        ),
                        MenuTile(
                          icon: FontAwesomeIcons.building,
                          title: 'Akun bank',
                          onTap: () => Get.toNamed(Routes.BANK),
                        ),
                        // MenuTile(
                        //   icon: FontAwesomeIcons.addressBook,
                        //   title: 'Alamat',
                        //   onTap: () {},
                        // ),
                        MenuTile(
                          icon: FontAwesomeIcons.gift,
                          title: 'Kode Refferal',
                          onTap: () => Get.to(ComingSoonScreen()),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: backgroundPanelColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        MenuTile(
                          icon: FontAwesomeIcons.infoCircle,
                          color: brokenWhiteColor,
                          title: 'FAQ',
                          onTap: () => Get.toNamed(Routes.FAQ),
                        ),
                        MenuTile(
                          icon: FontAwesomeIcons.infoCircle,
                          color: brokenWhiteColor,
                          title: 'Terms and condition',
                          onTap: () => Get.toNamed(Routes.TNC),
                        ),
                        MenuTile(
                          icon: FontAwesomeIcons.infoCircle,
                          color: brokenWhiteColor,
                          title: 'Privacy policy',
                          onTap: () => Get.toNamed(Routes.PRIVACY_POLICY),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: backgroundPanelColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        MenuTile(
                          icon: FontAwesomeIcons.signOutAlt,
                          title: 'Keluar',
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () => Get.back(),
        child: Text(
          'Tidak',
          style: stylePrimary,
        ),
      ),
      confirm: RaisedButton(
        color: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: controller.logout,
        child: Text(
          'Ya',
          style: buttonStyle,
        ),
      ),
    );
  }
}
