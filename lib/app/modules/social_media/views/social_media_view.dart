import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/widget/menu_tile.dart';
import 'package:flutter_xaurius/app/widget/xaurius_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/social_media_controller.dart';

class SocialMediaView extends GetView<SocialMediaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('dash_title_social'.tr),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.bottomCenter,
            image: AssetImage('assets/images/mesh-bottom.png'),
          ),
        ),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 2)),
          children: [
            XauriusCard(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: percentHeight(context, 1)),
                color: brokenWhiteColor.withOpacity(0.1),
                child: MenuTile(
                  icon: FontAwesomeIcons.telegramPlane,
                  iconSize: 30,
                  color: brokenWhiteColor,
                  title: 'Telegram',
                  style: stylePrimary.copyWith(fontSize: 20),
                  onTap: () {
                    launch('https://t.me/xauriusindonesia');
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            XauriusCard(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: percentHeight(context, 1)),
                color: brokenWhiteColor.withOpacity(0.1),
                child: MenuTile(
                  icon: FontAwesomeIcons.instagram,
                  iconSize: 30,
                  color: brokenWhiteColor,
                  title: 'Instagram',
                  style: stylePrimary.copyWith(fontSize: 20),
                  onTap: () {
                    launch('https://www.instagram.com/xaurius/?igshid=1nv4wja78ge4i');
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            XauriusCard(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: percentHeight(context, 1)),
                color: brokenWhiteColor.withOpacity(0.1),
                child: MenuTile(
                  icon: FontAwesomeIcons.mediumM,
                  iconSize: 30,
                  color: brokenWhiteColor,
                  title: 'Medium',
                  style: stylePrimary.copyWith(fontSize: 20),
                  onTap: () {
                    launch('http://xaurius-official.medium.com/');
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            XauriusCard(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: percentHeight(context, 1)),
                color: brokenWhiteColor.withOpacity(0.1),
                child: MenuTile(
                  icon: FontAwesomeIcons.facebookF,
                  iconSize: 30,
                  color: brokenWhiteColor,
                  title: 'Facebook',
                  style: stylePrimary.copyWith(fontSize: 20),
                  onTap: () {
                    launch('https://www.facebook.com/Xaurius-Asset-Digital-101033245372311');
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            XauriusCard(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: percentHeight(context, 1)),
                color: brokenWhiteColor.withOpacity(0.1),
                child: MenuTile(
                  icon: FontAwesomeIcons.youtube,
                  iconSize: 30,
                  color: brokenWhiteColor,
                  title: 'Youtube',
                  style: stylePrimary.copyWith(fontSize: 20),
                  onTap: () {
                    launch('https://www.youtube.com/channel/UCNlG-PXO5J0tKYOiSkF2v8g?view_as=subscriber');
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            XauriusCard(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: percentHeight(context, 1)),
                color: brokenWhiteColor.withOpacity(0.1),
                child: MenuTile(
                  icon: FontAwesomeIcons.twitter,
                  iconSize: 30,
                  color: brokenWhiteColor,
                  title: 'Twitter',
                  style: stylePrimary.copyWith(fontSize: 20),
                  onTap: () {},
                ),
              ),
            ),
            SizedBox(height: 20),
            XauriusCard(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: percentHeight(context, 1)),
                color: brokenWhiteColor.withOpacity(0.1),
                child: MenuTile(
                  icon: FontAwesomeIcons.linkedinIn,
                  iconSize: 30,
                  color: brokenWhiteColor,
                  title: 'Linked In',
                  style: stylePrimary.copyWith(fontSize: 20),
                  onTap: () {
                    launch('https://twitter.com/XauriusOfficial');
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            XauriusCard(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: percentHeight(context, 1)),
                color: brokenWhiteColor.withOpacity(0.1),
                child: MenuTile(
                  icon: FontAwesomeIcons.tiktok,
                  iconSize: 30,
                  color: brokenWhiteColor,
                  title: 'Tiktok',
                  style: stylePrimary.copyWith(fontSize: 20),
                  onTap: () {
                    launch('https://vt.tiktok.com/ZSJRqToNr/');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
