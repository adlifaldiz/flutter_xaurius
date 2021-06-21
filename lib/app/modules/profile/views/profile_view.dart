import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:flutter_xaurius/helper/screen_utils.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:flutter_xaurius/widget/menu_tile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

class ProfileView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 2)),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: backgroundPanelColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: MenuTile(
                  icon: FontAwesomeIcons.userAlt,
                  title: 'Data personal',
                  onTap: () => Get.toNamed(Routes.PERSONAL_DATA),
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: backgroundPanelColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: MenuTile(
                  icon: FontAwesomeIcons.fileAlt,
                  title: 'Dokumen Identitas',
                  onTap: () => Get.toNamed(Routes.DOCUMENT_IDENTITY),
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: backgroundPanelColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: MenuTile(
                  icon: FontAwesomeIcons.building,
                  title: 'Akun Bank',
                  onTap: () => Get.toNamed(Routes.BANK_ACCOUNT),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
