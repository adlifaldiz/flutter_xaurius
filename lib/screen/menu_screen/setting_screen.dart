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
import 'package:flutter_xaurius/widget/menu_tile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> with AutomaticKeepAliveClientMixin {
  void _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('isUser');
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));
  }

  bool isProfileVisible = false;

  void showToast() {
    setState(() {
      isProfileVisible = !isProfileVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: backgroundPanelColor,
      //   title: Text(
      //     'Pengaturan',
      //     style: textAppbarStyleWhite,
      //   ),
      //   automaticallyImplyLeading: false,
      // ),
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
                    MenuTile(
                      icon: FontAwesomeIcons.addressBook,
                      title: 'Alamat',
                      onTap: () {},
                    ),
                    MenuTile(
                      icon: FontAwesomeIcons.gift,
                      title: 'Kode Refferal',
                      onTap: () {},
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

  @override
  bool get wantKeepAlive => true;

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
    // showDialog(
    //   context: context,
    //   builder: (context) => Dialog(
    //     backgroundColor: backgroundColor,
    //     child: Padding(
    //       padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 5)),
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           Text(
    //             'Yakin Ingin Keluar dari aplikasi ?',
    //             style: stylePrimary,
    //           ),
    //           SizedBox(height: 30),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceAround,
    //             children: [
    //               FlatButton(
    //                 color: backgroundPanelColor,
    //                 onPressed: () {
    //                   Navigator.pop(context);
    //                 },
    //                 child: Text(
    //                   'Batal',
    //                   style: stylePrimary,
    //                 ),
    //               ),
    //               FlatButton(
    //                 onPressed: () {
    //                   _logout();
    //                 },
    //                 child: Text(
    //                   'Ya',
    //                   style: stylePrimary,
    //                 ),
    //               )
    //             ],
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
