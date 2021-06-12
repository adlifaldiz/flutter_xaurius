import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:flutter_xaurius/app/widget/menu_tile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
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
                  title: 'Profil saya',
                  onTap: () => Get.toNamed(Routes.DATA_PERSONAL),
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
                  onTap: () => Get.toNamed(Routes.UPLOAD_DOCUMENT),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}