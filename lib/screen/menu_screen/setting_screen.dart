import 'package:flutter/material.dart';
import 'package:flutter_xaurius/helper/screen_utils.dart';
import 'package:flutter_xaurius/screen/auth_screen/login_screen.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:flutter_xaurius/screen/bank/bank_screen.dart';
import 'package:flutter_xaurius/screen/info/faq_screen.dart';
import 'package:flutter_xaurius/screen/info/privacy_policy_screen.dart';
import 'package:flutter_xaurius/screen/info/tnc_screen.dart';
import 'package:flutter_xaurius/screen/personal/data_personal_screen.dart';
import 'package:flutter_xaurius/screen/personal/menu_profile.dart';
import 'package:flutter_xaurius/widget/coming_soon.dart';
import 'package:flutter_xaurius/widget/menu_tile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingScreen extends StatelessWidget {
  var appData = GetStorage();

  void _logout() async {
    appData.erase();
    Get.offAll(LoginScreen());
  }

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
                      onTap: () => Get.to(MenuProfile()),
                    ),
                    MenuTile(
                      icon: FontAwesomeIcons.userLock,
                      title: 'Set pin',
                      onTap: () {},
                    ),
                    MenuTile(
                      icon: FontAwesomeIcons.building,
                      title: 'Akun bank',
                      onTap: () => Get.to(BankScreen()),
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
                      onTap: () => Get.to(FAQScreen()),
                    ),
                    MenuTile(
                      icon: FontAwesomeIcons.infoCircle,
                      color: brokenWhiteColor,
                      title: 'Terms and condition',
                      onTap: () => Get.to(TncScreen()),
                    ),
                    MenuTile(
                      icon: FontAwesomeIcons.infoCircle,
                      color: brokenWhiteColor,
                      title: 'Privacy policy',
                      onTap: () => Get.to(PrivacyPolicyScreen()),
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
        onPressed: _logout,
        child: Text(
          'Ya',
          style: buttonStyle,
        ),
      ),
    );
  }
}
