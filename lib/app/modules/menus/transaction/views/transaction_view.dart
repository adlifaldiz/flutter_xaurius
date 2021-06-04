import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/modules/topup/top_up_screen.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:flutter_xaurius/helper/screen_utils.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:flutter_xaurius/widget/coming_soon.dart';
import 'package:flutter_xaurius/widget/menu_produk.dart';
import 'package:flutter_xaurius/widget/menu_transaction.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/transaction_controller.dart';

class TransactionView extends GetView<TransactionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              width: MediaQuery.of(context).size.width / 2,
              top: 0,
              right: 0,
              child: Image.asset(
                'assets/images/mesh-right.png',
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 5)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.wallet,
                              color: primaryColor,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Saldo',
                              style: textTitle,
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () => Get.to(TopUpScreen()),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                            decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.plus,
                                  color: textBlackColor,
                                  size: 10,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Top Up',
                                  style: stylePrimaryDark,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rp',
                          style: textTitle.copyWith(color: primaryColor),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '100000.00',
                          style: textTitle.copyWith(fontSize: 30),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kamu memiliki voucher',
                          style: textTitle,
                        ),
                        SizedBox(width: 5),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Claim',
                            style: textTitle.copyWith(color: primaryColor),
                          ),
                        )
                      ],
                    ),
                    Divider(
                      thickness: 2,
                      height: 50,
                      color: brokenWhiteColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Transform.rotate(
                          angle: 1.6,
                          child: Icon(
                            FontAwesomeIcons.exchangeAlt,
                            color: accentColor,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Transaksi XAU',
                          style: textTitle,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 1), vertical: percentHeight(context, 2)),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: backgroundPanelColor.withOpacity(0.5),
                      ),
                      child: GridView.count(
                        crossAxisCount: 5,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 2,
                        children: [
                          MenuProduk(
                            onTap: () => Get.toNamed(Routes.BUY_XAU),
                            labelTxt: 'Beli',
                            menuIcon: FaIcon(
                              FontAwesomeIcons.arrowCircleDown,
                              color: textWhiteColor,
                            ),
                          ),
                          MenuProduk(
                            onTap: () => Get.to(ComingSoonScreen()),
                            labelTxt: 'Jual',
                            menuIcon: FaIcon(
                              FontAwesomeIcons.arrowCircleUp,
                              color: textWhiteColor,
                            ),
                          ),
                          MenuProduk(
                            onTap: () => Get.to(ComingSoonScreen()),
                            labelTxt: 'Redeem',
                            menuIcon: FaIcon(
                              FontAwesomeIcons.gift,
                              color: textWhiteColor,
                            ),
                          ),
                          MenuProduk(
                            onTap: () => Get.to(ComingSoonScreen()),
                            labelTxt: 'Kirim',
                            menuIcon: FaIcon(
                              FontAwesomeIcons.telegramPlane,
                              color: textWhiteColor,
                            ),
                          ),
                          MenuProduk(
                            onTap: () => Get.to(ComingSoonScreen()),
                            labelTxt: 'Terima',
                            menuIcon: FaIcon(
                              FontAwesomeIcons.getPocket,
                              color: textWhiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          FontAwesomeIcons.globeEurope,
                          color: accentColor,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Transaksi Crypto',
                          style: textTitle,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 5,
                      children: [
                        MenuTransaction(
                          onTap: () => Get.toNamed(Routes.DEPOSIT),
                          labelTxt: 'Deposit',
                          menuIcon: FaIcon(
                            FontAwesomeIcons.arrowCircleDown,
                            color: textWhiteColor,
                            size: 40,
                          ),
                        ),
                        MenuTransaction(
                          onTap: () {},
                          labelTxt: 'Withdraw',
                          menuIcon: FaIcon(
                            FontAwesomeIcons.arrowCircleUp,
                            color: textWhiteColor,
                            size: 40,
                          ),
                        ),
                        MenuTransaction(
                          onTap: () {},
                          labelTxt: 'Kirim',
                          menuIcon: FaIcon(
                            FontAwesomeIcons.exchangeAlt,
                            color: textWhiteColor,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          FontAwesomeIcons.mobileAlt,
                          color: accentColor,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Transaksi umum',
                          style: textTitle,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 5,
                      children: [
                        MenuTransaction(
                          onTap: () {},
                          labelTxt: 'Top Up Pulsa',
                          menuIcon: FaIcon(
                            FontAwesomeIcons.mobileAlt,
                            color: textWhiteColor,
                            size: 40,
                          ),
                        ),
                        MenuTransaction(
                          onTap: () {},
                          labelTxt: 'Token Listrik',
                          menuIcon: FaIcon(
                            FontAwesomeIcons.bolt,
                            color: textWhiteColor,
                            size: 40,
                          ),
                        ),
                        MenuTransaction(
                          onTap: () {},
                          labelTxt: 'Paket Data',
                          menuIcon: FaIcon(
                            FontAwesomeIcons.globeAsia,
                            color: textWhiteColor,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
