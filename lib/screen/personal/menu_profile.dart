import 'package:flutter/material.dart';
import 'package:flutter_xaurius/helper/screen_utils.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:flutter_xaurius/screen/personal/data_personal_screen.dart';
import 'package:flutter_xaurius/screen/personal/identity_document_screen.dart';
import 'package:flutter_xaurius/widget/menu_tile.dart';
import 'package:flutter_xaurius/widget/xau_container.dart';
import 'package:flutter_xaurius/widget/xaurius_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MenuProfile extends StatefulWidget {
  @override
  _MenuProfileState createState() => _MenuProfileState();
}

class _MenuProfileState extends State<MenuProfile> {
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
                  onTap: () => Get.to(DataPersonalScreen()),
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
                  onTap: () => Get.to(IdentityScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
