import 'package:flutter/material.dart';
import 'package:flutter_xaurius/helper/screen_utils.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:flutter_xaurius/widget/menu_produk.dart';
import 'package:flutter_xaurius/widget/menu_tile.dart';
import 'package:flutter_xaurius/widget/menu_transaction.dart';
import 'package:flutter_xaurius/widget/xaurius_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Media extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Media kami'),
        backgroundColor: Color(0xFF040404),
      ),
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                launch('https://www.xaurius.com');
              },
              child: Image.asset(
                'assets/images/xauria.png',
                width: percentWidth(context, 100),
                // height: percentHeight(context, 20),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 2)),
                children: [
                  XauriusCard(
                    child: Container(
                      color: backgroundPanelColor,
                      child: MenuTile(
                        icon: FontAwesomeIcons.telegramPlane,
                        iconSize: 50,
                        color: brokenWhiteColor,
                        title: 'Telegram',
                        style: stylePrimary.copyWith(fontSize: 20),
                        onTap: () {
                          launch('https://t.me/xauriusindonesia');
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  XauriusCard(
                    child: Container(
                      color: backgroundPanelColor,
                      child: MenuTile(
                        icon: FontAwesomeIcons.instagram,
                        iconSize: 50,
                        color: brokenWhiteColor,
                        title: 'Instagram',
                        style: stylePrimary.copyWith(fontSize: 20),
                        onTap: () {
                          launch('https://www.instagram.com/xaurius/?igshid=1nv4wja78ge4i');
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  XauriusCard(
                    child: Container(
                      color: backgroundPanelColor,
                      child: MenuTile(
                        icon: FontAwesomeIcons.mediumM,
                        iconSize: 50,
                        color: brokenWhiteColor,
                        title: 'Medium',
                        style: stylePrimary.copyWith(fontSize: 20),
                        onTap: () {
                          launch('http://xaurius-official.medium.com/');
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  XauriusCard(
                    child: Container(
                      color: backgroundPanelColor,
                      child: MenuTile(
                        icon: FontAwesomeIcons.facebookF,
                        iconSize: 50,
                        color: brokenWhiteColor,
                        title: 'Facebook',
                        style: stylePrimary.copyWith(fontSize: 20),
                        onTap: () {
                          launch('https://www.facebook.com/Xaurius-Asset-Digital-101033245372311');
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  XauriusCard(
                    child: Container(
                      color: backgroundPanelColor,
                      child: MenuTile(
                        icon: FontAwesomeIcons.youtube,
                        iconSize: 50,
                        color: brokenWhiteColor,
                        title: 'Youtube',
                        style: stylePrimary.copyWith(fontSize: 20),
                        onTap: () {
                          launch('https://www.youtube.com/channel/UCNlG-PXO5J0tKYOiSkF2v8g?view_as=subscriber');
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  XauriusCard(
                    child: Container(
                      color: backgroundPanelColor,
                      child: MenuTile(
                        icon: FontAwesomeIcons.twitter,
                        iconSize: 50,
                        color: brokenWhiteColor,
                        title: 'Twitter',
                        style: stylePrimary.copyWith(fontSize: 20),
                        onTap: () {},
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  XauriusCard(
                    child: Container(
                      color: backgroundPanelColor,
                      child: MenuTile(
                        icon: FontAwesomeIcons.linkedinIn,
                        iconSize: 50,
                        color: brokenWhiteColor,
                        title: 'Linked In',
                        style: stylePrimary.copyWith(fontSize: 20),
                        onTap: () {
                          launch('https://twitter.com/XauriusOfficial');
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  XauriusCard(
                    child: Container(
                      color: backgroundPanelColor,
                      child: MenuTile(
                        icon: FontAwesomeIcons.tiktok,
                        iconSize: 50,
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
          ],
        ),
      ),
    );
  }
}
