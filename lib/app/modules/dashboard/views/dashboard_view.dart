import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_xaurius/app/helpers/intl_formats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:flutter_xaurius/app/widget/shimmer_card.dart';
import 'package:flutter_xaurius/app/widget/shimmer_text.dart';
import 'package:flutter_xaurius/app/widget/xau_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AbsorbPointer(
        absorbing: controller.isLoading.value,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Image.asset(
              'assets/images/xaurius_full_logo_yellow.png',
              height: kToolbarHeight / 2,
            ),
            centerTitle: false,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.solidBell,
                    color: brokenWhiteColor,
                    size: 20,
                  ),
                  onPressed: () => controller.router(1)),
            ],
          ),
          body: Obx(
            () => SafeArea(
              child: LiquidPullToRefresh(
                color: backgroundPanelColor,
                backgroundColor: primaryColor,
                key: controller.refreshDash,
                onRefresh: controller.onRefresh,
                showChildOpacityTransition: false,
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(20),
                  children: [
                    controller.auth.userData.orangKycEditAvailable
                        ? Column(
                            children: [
                              XauriusContainer(
                                child: Column(
                                  children: [
                                    Text(
                                      'notif_kyc'.tr,
                                      textAlign: TextAlign.center,
                                    ),
                                    FlatButton(
                                      color: primaryColor,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                      onPressed: () => controller.router(2),
                                      child: Text(
                                        'kyc_btn'.tr,
                                        style: stylePrimaryDark,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          )
                        : Container(),
                    controller.auth.userData.orangKycAskForReview && !controller.auth.userData.orangKycEditAvailable
                        ? Column(
                            children: [
                              XauriusContainer(
                                child: Column(
                                  children: [
                                    Text(
                                      'notif_kyc_review'.tr,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          )
                        : Container(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          controller.greeting(),
                          style: TextStyle(letterSpacing: 1, fontWeight: FontWeight.normal, fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        controller.isLoading.value
                            ? ShimmerText()
                            : Text(
                                controller.auth.userData.orangName == null ? controller.auth.userData.orangEmail : controller.auth.userData.orangName,
                                overflow: TextOverflow.fade,
                                style: TextStyle(letterSpacing: 1, fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                      ],
                    ),
                    SizedBox(height: percentHeight(context, 5)),
                    controller.isLoading.value
                        ? ShimmerText()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                FontAwesomeIcons.chartLine,
                                color: accentColor,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'dash_title_price'.tr,
                                style: textTitle,
                              )
                            ],
                          ),
                    SizedBox(height: percentHeight(context, 2)),
                    controller.isLoading.value
                        ? ShimmerCard()
                        : Container(
                            width: Get.width,
                            padding: EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: backgroundPanelColor.withOpacity(0.5),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                borderRadius: BorderRadius.circular(20),
                                                onTap: () {
                                                  controller.onChangeBuy(true);
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                  decoration: BoxDecoration(
                                                    color: controller.isBuy.value ? greyColor : Colors.transparent,
                                                    borderRadius: BorderRadius.circular(20),
                                                  ),
                                                  child: Text(
                                                    'Buy',
                                                    style: TextStyle(
                                                      color: greenColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              InkWell(
                                                borderRadius: BorderRadius.circular(20),
                                                onTap: () {
                                                  controller.onChangeBuy(false);
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                  decoration: BoxDecoration(
                                                    color: controller.isBuy.value ? Colors.transparent : greyColor,
                                                    borderRadius: BorderRadius.circular(20),
                                                  ),
                                                  child: Text(
                                                    'Sell',
                                                    style: TextStyle(
                                                      color: redColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: percentHeight(context, 2)),
                                          Text(
                                            controller.isLoading.value
                                                ? '-'
                                                : controller.isBuy.value
                                                    ? "IDR: ${controller.goldPrice.value.chartpriceBuy}" ?? '-'
                                                    : "IDR: ${controller.goldPrice.value.chartpriceSell}" ?? '-',
                                            style: stylePrimary.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () => controller.router(3),
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        decoration:
                                            BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: primaryColor, width: 2)),
                                        child: Icon(
                                          FontAwesomeIcons.chartLine,
                                          size: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                    SizedBox(height: percentHeight(context, 5)),
                    controller.isLoading.value
                        ? ShimmerText()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.account_balance_wallet_rounded,
                                color: accentColor,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'trans_balance'.tr,
                                style: textTitle,
                              )
                            ],
                          ),
                    SizedBox(height: percentHeight(context, 2)),
                    controller.isLoading.value
                        ? ShimmerCard()
                        : CarouselSlider(
                            options: CarouselOptions(
                              aspectRatio: 16 / 5,
                              initialPage: controller.indexBalances.value,
                              // autoPlay: true,
                              // autoPlayInterval: Duration(seconds: 3),
                              // autoPlayAnimationDuration: Duration(milliseconds: 800),
                              // autoPlayCurve: Curves.fastOutSlowIn,
                              // pauseAutoPlayOnTouch: true,
                              viewportFraction: 1.0,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              onPageChanged: (index, reason) {
                                return controller.onBalancesChange(index, reason);
                              },
                            ),
                            items: controller.balance.isEmpty
                                ? [
                                    XauriusContainer(
                                      child: Center(
                                        child: Text('no_balance'.tr),
                                      ),
                                    ),
                                  ]
                                : controller.balance.map((balances) {
                                    return Builder(builder: (BuildContext context) {
                                      return Container(
                                        padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 3)),
                                        width: Get.width,
                                        decoration: BoxDecoration(
                                          color: backgroundPanelColor.withOpacity(0.5),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        foregroundDecoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            image: DecorationImage(
                                                alignment: Alignment.bottomRight,
                                                image: AssetImage(
                                                  'assets/images/mesh-bottom.png',
                                                ))),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              balances.balanceSymbol,
                                              style: textTitle.copyWith(color: primaryColor),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              balances.balanceSymbol == 'IDR'
                                                  ? customCurrency(balances.balanceValue, symbol: 'Rp ')
                                                  : balances.balanceValue,
                                              style: textTitle.copyWith(fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                                  }).toList(),
                          ),
                    controller.isLoading.value
                        ? ShimmerText()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: controller.map<Widget>(controller.balance, (index, url) {
                              return AnimatedContainer(
                                width: controller.indexBalances.value == index ? 20.0 : 6,
                                height: 6.0,
                                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: controller.indexBalances.value == index ? Colors.yellow : Colors.grey,
                                ),
                                duration: Duration(milliseconds: 300),
                              );
                            }),
                          ),
                    SizedBox(height: percentHeight(context, 5)),

                    controller.isLoading.value
                        ? ShimmerText()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.bullhorn,
                                    color: accentColor,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'dash_promo'.tr,
                                    style: textTitle,
                                  ),
                                ],
                              ),
                              // GestureDetector(
                              //   onTap: () => Get.toNamed(Routes.SOCIAL_MEDIA),
                              //   child: Text(
                              //     'see_all'.tr,
                              //   ),
                              // ),
                            ],
                          ),
                    SizedBox(height: percentHeight(context, 2)),
                    controller.isLoading.value
                        ? ShimmerCard()
                        : CarouselSlider(
                            options: CarouselOptions(
                              // aspectRatio: 16 / 5,
                              initialPage: controller.indexPromos.value,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration: Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              pauseAutoPlayOnTouch: true,
                              viewportFraction: 1.0,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              onPageChanged: (index, reason) {
                                return controller.onPromosChange(index, reason);
                              },
                            ),
                            items: controller.promoList.map((promo) {
                              return Builder(builder: (BuildContext context) {
                                return Container(child: promo);
                              });
                            }).toList(),
                          ),
                    controller.isLoading.value
                        ? ShimmerText()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: controller.map<Widget>(controller.promoList, (index, url) {
                              return AnimatedContainer(
                                width: controller.indexPromos.value == index ? 20.0 : 7,
                                height: 7.0,
                                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: controller.indexPromos.value == index ? Colors.yellow : Colors.grey,
                                ),
                                duration: Duration(milliseconds: 300),
                              );
                            }),
                          ),
                    SizedBox(height: percentHeight(context, 5)),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Row(
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       children: [
                    //         Icon(
                    //           FontAwesomeIcons.newspaper,
                    //           color: accentColor,
                    //         ),
                    //         SizedBox(width: 10),
                    //         Text(
                    //           'Artikel',
                    //           style: textTitle,
                    //         ),
                    //       ],
                    //     ),
                    //     InkWell(
                    //       onTap: () => Get.toNamed(Routes.ARTICLE),
                    //       child: Text(
                    //         'Lihat semua',
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(height: percentHeight(context, 2)),
                    // Container(
                    //   height: percentHeight(context, 20),
                    //   width: percentWidth(context, 100),
                    //   padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 2)),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(20),
                    //     color: backgroundPanelColor,
                    //   ),
                    //   child: ListView.builder(
                    //     scrollDirection: Axis.horizontal,
                    //     shrinkWrap: true,
                    //     itemCount: 3,
                    //     itemBuilder: (context, index) {
                    //       return GestureDetector(
                    //         onTap: () {},
                    //         child: Container(
                    //           margin: EdgeInsets.symmetric(horizontal: 10),
                    //           width: percentWidth(context, 50),
                    //           decoration: BoxDecoration(color: textBlackColor, borderRadius: BorderRadius.circular(20)),
                    //           child: Column(
                    //             children: [
                    //               ClipRRect(
                    //                 borderRadius: BorderRadius.only(
                    //                   topLeft: Radius.circular(20),
                    //                   topRight: Radius.circular(20),
                    //                 ),
                    //                 child: Image.asset(
                    //                   'assets/images/item2.png',
                    //                   fit: BoxFit.cover,
                    //                   width: double.infinity,
                    //                   height: percentHeight(context, 8),
                    //                 ),
                    //               ),
                    //               SizedBox(height: 5),
                    //               Expanded(
                    //                 child: Padding(
                    //                   padding: const EdgeInsets.symmetric(horizontal: 5),
                    //                   child: Text(
                    //                     'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    //                     style: stylePrimary.copyWith(fontSize: 10),
                    //                     overflow: TextOverflow.ellipsis,
                    //                     maxLines: 3,
                    //                   ),
                    //                 ),
                    //               )
                    //             ],
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                    // SizedBox(height: percentHeight(context, 5)),
                    controller.isLoading.value
                        ? ShimmerText()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.networkWired,
                                    color: accentColor,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'dash_title_social'.tr,
                                    style: textTitle,
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () => controller.router(4),
                                child: Text(
                                  'see_all'.tr,
                                ),
                              ),
                            ],
                          ),
                    SizedBox(height: percentHeight(context, 2)),
                    controller.isLoading.value
                        ? ShimmerCard()
                        : Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: backgroundPanelColor.withOpacity(0.5),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  onTap: () {
                                    launch("https://t.me/xauriusindonesia");
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 2)),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.telegram,
                                          color: primaryColor,
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                            'Telegram',
                                            style: textTitle,
                                            overflow: TextOverflow.clip,
                                            maxLines: 5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  onTap: () {
                                    launch('https://www.instagram.com/xaurius/?igshid=1nv4wja78ge4i');
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 2)),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.instagram,
                                          color: primaryColor,
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                            'Instagram',
                                            style: textTitle,
                                            overflow: TextOverflow.clip,
                                            maxLines: 5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
