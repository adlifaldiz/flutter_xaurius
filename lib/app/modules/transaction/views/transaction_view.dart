import 'package:carousel_slider/carousel_slider.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:flutter_xaurius/app/data/model/dashboard/chart_data.dart';
import 'package:flutter_xaurius/app/helpers/intl_formats.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:flutter_xaurius/app/widget/menu_produk.dart';
import 'package:flutter_xaurius/app/widget/menu_transaction.dart';
import 'package:flutter_xaurius/app/widget/shimmer_card.dart';
import 'package:flutter_xaurius/app/widget/shimmer_text.dart';
import 'package:flutter_xaurius/app/widget/xau_container.dart';

import '../controllers/transaction_controller.dart';
import 'dart:math' as math;

class TransactionView extends GetView<TransactionController> {
  final GlobalKey<LiquidPullToRefreshState> refreshTransaction = GlobalKey<LiquidPullToRefreshState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Obx(() {
        return SafeArea(
          child: LiquidPullToRefresh(
            color: backgroundPanelColor.withOpacity(0.3),
            backgroundColor: primaryColor,
            key: refreshTransaction,
            onRefresh: controller.onRefresh,
            showChildOpacityTransition: false,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 5)),
              children: [
                controller.dash.isLoading.value
                    ? ShimmerText()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.account_balance_wallet_rounded,
                                color: accentColor,
                              ),
                              SizedBox(width: percentWidth(context, 2)),
                              Text(
                                'trans_balance'.tr,
                                style: textTitle,
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () => controller.router(1),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.plusCircle,
                                    size: 16,
                                    color: textBlackColor,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'trans_top_up'.tr + ' IDR',
                                    style: stylePrimary.copyWith(color: textBlackColor),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                SizedBox(height: percentHeight(context, 2)),
                controller.dash.isLoading.value
                    ? ShimmerCard()
                    : CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 16 / 5,
                          initialPage: controller.dash.indexBalances.value,
                          // autoPlay: true,
                          // autoPlayInterval: Duration(seconds: 3),
                          // autoPlayAnimationDuration: Duration(milliseconds: 800),
                          // autoPlayCurve: Curves.fastOutSlowIn,
                          // pauseAutoPlayOnTouch: true,
                          viewportFraction: 1.0,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: false,
                          onPageChanged: (index, reason) {
                            return controller.dash.onBalancesChange(index, reason);
                          },
                        ),
                        items: controller.dash.balance.isEmpty
                            ? [
                                XauriusContainer(
                                  child: Center(
                                    child: Text('no_balance'.tr),
                                  ),
                                ),
                              ]
                            : controller.dash.balance.map((balances) {
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
                controller.dash.isLoading.value
                    ? ShimmerText()
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: controller.dash.map<Widget>(controller.dash.balance, (index, url) {
                            return AnimatedContainer(
                              width: controller.dash.indexBalances.value == index ? 20.0 : 7,
                              height: 7.0,
                              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: percentWidth(context, 0.5)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: controller.dash.indexBalances.value == index ? Colors.yellow : Colors.grey,
                              ),
                              duration: Duration(milliseconds: 300),
                            );
                          }),
                        ),
                      ),
                SizedBox(height: percentHeight(context, 5)),
                controller.dash.isLoading.value
                    ? ShimmerText()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            FontAwesomeIcons.chartLine,
                            color: accentColor,
                          ),
                          SizedBox(width: percentWidth(context, 2)),
                          Text(
                            'dash_title_price'.tr,
                            style: textTitle,
                          )
                        ],
                      ),
                SizedBox(height: percentHeight(context, 2)),
                controller.dash.isLoading.value
                    ? ShimmerCard(
                        height: percentHeight(context, 50),
                      )
                    : Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: backgroundPanelColor.withOpacity(0.5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        controller.dash.isLoading.value
                                            ? ShimmerText()
                                            : Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  InkWell(
                                                    borderRadius: BorderRadius.circular(20),
                                                    onTap: () {
                                                      controller.dash.onChangeBuy(true);
                                                    },
                                                    child: Container(
                                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                      decoration: BoxDecoration(
                                                        color: controller.dash.isBuy.value ? greyColor : Colors.transparent,
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
                                                  SizedBox(width: percentWidth(context, 2)),
                                                  InkWell(
                                                    borderRadius: BorderRadius.circular(20),
                                                    onTap: () {
                                                      controller.dash.onChangeBuy(false);
                                                    },
                                                    child: Container(
                                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                      decoration: BoxDecoration(
                                                        color: controller.dash.isBuy.value ? Colors.transparent : greyColor,
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
                                        controller.dash.isLoading.value
                                            ? ShimmerText()
                                            : Text(
                                                controller.dash.isBuy.value
                                                    ? "IDR: ${controller.dash.goldPrice.value.chartpriceBuy}" ?? '-'
                                                    : "IDR: ${controller.dash.goldPrice.value.chartpriceSell}" ?? '-',
                                                style: stylePrimary.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => Get.toNamed(Routes.CHART_VIEW),
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration:
                                          BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: primaryColor, width: 2)),
                                      child: Icon(
                                        FontAwesomeIcons.expandAlt,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Obx(() {
                                if (controller.dash.isLoading.value) {
                                  return Center(child: ShimmerCard());
                                }
                                return SfCartesianChart(
                                  // borderColor: Colors.transparent,
                                  zoomPanBehavior: ZoomPanBehavior(
                                    enableMouseWheelZooming: true,
                                    enablePinching: true,
                                    // enableDoubleTapZooming: true,
                                    enablePanning: true,
                                  ),
                                  onZooming: (ZoomPanArgs args) {},
                                  onZoomStart: (ZoomPanArgs args) {},
                                  onZoomEnd: (ZoomPanArgs args) {},
                                  onZoomReset: (ZoomPanArgs args) {},
                                  primaryXAxis: DateTimeAxis(
                                    // minimum: controller.dashboard.charts.first.cdate,
                                    // maximum: controller.dashboard.charts.last.cdate,
                                    // visibleMinimum: controller.dash.charts.value[controller.dash.charts.length ].cdate,
                                    rangePadding: ChartRangePadding.additional,
                                  ),
                                  primaryYAxis: NumericAxis(
                                    minimum: double.parse(controller.dash.charts[2].chigh) - 10000,
                                    maximum: double.parse(controller.dash.charts.last.chigh) + 10000,
                                    rangePadding: ChartRangePadding.additional,

                                    numberFormat: NumberFormat.compactCurrency(
                                      locale: "in_In",
                                      symbol: "",
                                    ),
                                    // title: AxisTitle(
                                    //   text: 'Stock price in \$',
                                    // ),
                                  ),
                                  axes: [
                                    NumericAxis(
                                      name: "secondyaxis",
                                      opposedPosition: true,
                                    ),
                                  ],
                                  trackballBehavior: TrackballBehavior(
                                    enable: true,
                                    tooltipSettings: InteractiveTooltip(
                                      enable: true,
                                    ),
                                  ),
                                  legend: Legend(
                                    isVisible: false,
                                  ),
                                  title: ChartTitle(text: "XAU/IDR", textStyle: TextStyle(color: textWhiteColor)),
                                  // indicators: <TechnicalIndicators<Chart, dynamic>>[
                                  //   BollingerBandIndicator<Chart, dynamic>(
                                  //     seriesName: "XAU",
                                  //     period: 3,
                                  //     isVisible: false,
                                  //   ),
                                  //   MacdIndicator(seriesName: "XAU", period: 3, shortPeriod: 5, longPeriod: 10, yAxisName: "secondyaxis", isVisible: false),
                                  // ],
                                  series: <ChartSeries>[
                                    HiloOpenCloseSeries<ChartData, dynamic>(
                                      dataSource: controller.dash.charts,
                                      xValueMapper: (ChartData gold, _) => DateTime.parse(controller.formatter.format(gold.cdate)),
                                      highValueMapper: (ChartData gold, _) => num.parse(gold.chigh),
                                      lowValueMapper: (ChartData gold, _) => num.parse(gold.clow),
                                      openValueMapper: (ChartData gold, _) => num.parse(gold.copen),
                                      closeValueMapper: (ChartData gold, _) => num.parse(gold.cclose),
                                      volumeValueMapper: (ChartData gold, _) => num.parse(gold.cclose),
                                      bearColor: primaryColor,
                                      bullColor: textWhiteColor,
                                      enableTooltip: true,
                                    )
                                  ],
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                SizedBox(height: percentHeight(context, 5)),
                controller.dash.isLoading.value
                    ? ShimmerText()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Transform.rotate(
                            angle: 1.6,
                            child: Icon(
                              FontAwesomeIcons.exchangeAlt,
                              color: accentColor,
                            ),
                          ),
                          SizedBox(width: percentWidth(context, 2)),
                          Text(
                            'trans_title_idr'.tr,
                            style: textTitle,
                          ),
                        ],
                      ),
                SizedBox(height: percentHeight(context, 2)),
                controller.dash.isLoading.value
                    ? ShimmerCard()
                    : Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: backgroundPanelColor.withOpacity(0.5),
                        ),
                        child: GridView.count(
                          padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 1), vertical: percentHeight(context, 2)),
                          crossAxisCount: 4,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisSpacing: 5,
                          children: [
                            MenuProduk(
                              onTap: () => controller.router(3),
                              labelTxt: 'trans_buy_xau'.tr,
                              menuIcon: FaIcon(
                                FontAwesomeIcons.arrowCircleDown,
                                color: textWhiteColor,
                              ),
                            ),
                            MenuProduk(
                              onTap: () => controller.router(4),
                              labelTxt: 'trans_sell_xau'.tr,
                              menuIcon: FaIcon(
                                FontAwesomeIcons.arrowCircleUp,
                                color: textWhiteColor,
                              ),
                            ),
                            MenuProduk(
                              onTap: () => controller.router(5),
                              labelTxt: 'trans_redeem_xau'.tr,
                              menuIcon: FaIcon(
                                FontAwesomeIcons.gift,
                                color: textWhiteColor,
                              ),
                            ),
                            // MenuProduk(
                            //   onTap: () => controller.router(6),
                            //   labelTxt: 'trans_send_xau'.tr,
                            //   menuIcon: FaIcon(
                            //     FontAwesomeIcons.telegramPlane,
                            //     color: textWhiteColor,
                            //   ),
                            // ),
                            MenuProduk(
                              onTap: () => controller.router(1),
                              labelTxt: 'trans_top_up'.tr,
                              menuIcon: FaIcon(
                                FontAwesomeIcons.plus,
                                color: textWhiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                SizedBox(height: percentHeight(context, 5)),
                controller.dash.isLoading.value
                    ? ShimmerText()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            FontAwesomeIcons.globeEurope,
                            color: accentColor,
                          ),
                          SizedBox(width: percentWidth(context, 2)),
                          Text(
                            'trans_title_xau'.tr,
                            style: textTitle,
                          ),
                        ],
                      ),
                SizedBox(height: percentHeight(context, 2)),
                Wrap(
                  spacing: percentHeight(context, 2),
                  children: [
                    controller.dash.isLoading.value
                        ? ShimmerCard(
                            width: percentWidth(context, 27),
                            height: percentHeight(context, 15),
                          )
                        : MenuTransaction(
                            onTap: () => controller.router(9),
                            labelTxt: 'trans_send_xau'.tr,
                            menuIcon: Icon(
                              FontAwesomeIcons.telegramPlane,
                              color: textWhiteColor,
                              size: 40,
                            ),
                          ),
                    controller.dash.isLoading.value
                        ? ShimmerCard(
                            width: percentWidth(context, 27),
                            height: percentHeight(context, 15),
                          )
                        : MenuTransaction(
                            onTap: () => controller.router(8),
                            labelTxt: 'trans_receive_xau'.tr,
                            menuIcon: Transform.rotate(
                              angle: 180 * math.pi / 180,
                              child: Icon(
                                FontAwesomeIcons.telegramPlane,
                                color: textWhiteColor,
                                size: 40,
                              ),
                            ),
                          ),
                    // MenuTransaction(
                    //   onTap: () => controller.router(9),
                    //   labelTxt: 'trans_send_xau'.tr,
                    //   menuIcon: Icon(
                    //     FontAwesomeIcons.telegramPlane,
                    //     color: textWhiteColor,
                    //     size: 40,
                    //   ),
                    // ),
                  ],
                ),
                // controller.dash.isLoading.value
                //     ? ShimmerCard()
                //     : GridView.count(
                //         padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 15)),
                //         crossAxisCount: 2,
                //         shrinkWrap: true,
                //         physics: NeverScrollableScrollPhysics(),
                //         crossAxisSpacing: 10,
                //         mainAxisSpacing: 5,
                //         children: [
                //           MenuTransaction(
                //             onTap: () => controller.router(9),
                //             labelTxt: 'trans_send_xau'.tr,
                //             menuIcon: Icon(
                //               FontAwesomeIcons.telegramPlane,
                //               color: textWhiteColor,
                //               size: 40,
                //             ),
                //           ),
                //           MenuTransaction(
                //             onTap: () => controller.router(8),
                //             labelTxt: 'trans_receive_xau'.tr,
                //             menuIcon: Transform.rotate(
                //               angle: 180 * math.pi / 180,
                //               child: Icon(
                //                 FontAwesomeIcons.telegramPlane,
                //                 color: textWhiteColor,
                //                 size: 40,
                //               ),
                //             ),
                //           ),

                // MenuTransaction(
                //   onTap: () => controller.router(10),
                //   labelTxt: 'trans_send'.tr,
                //   menuIcon: FaIcon(
                //     FontAwesomeIcons.exchangeAlt,
                //     color: textWhiteColor,
                //     size: 40,
                //   ),
                // ),
                //   ],
                // ),
                // SizedBox(height: percentHeight(context, 5)),
                // controller.dash.isLoading.value
                //     ? ShimmerText()
                //     : Row(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         children: [
                //           Icon(
                //             FontAwesomeIcons.mobileAlt,
                //             color: accentColor,
                //           ),
                //           SizedBox(width: percentWidth(context, 2)),
                //           Text(
                //             'trans_title_general'.tr,
                //             style: textTitle,
                //           ),
                //         ],
                //       ),
                // SizedBox(height: percentHeight(context, 2)),
                // controller.dash.isLoading.value
                //     ? ShimmerCard()
                //     : GridView.count(
                //         padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 1)),
                //         crossAxisCount: 3,
                //         shrinkWrap: true,
                //         physics: NeverScrollableScrollPhysics(),
                //         crossAxisSpacing: 10,
                //         mainAxisSpacing: 5,
                //         children: [
                //           MenuTransaction(
                //             onTap: () => controller.router(11),
                //             labelTxt: 'trans_credit_general'.tr,
                //             menuIcon: FaIcon(
                //               FontAwesomeIcons.mobileAlt,
                //               color: textWhiteColor,
                //               size: 40,
                //             ),
                //           ),
                //           MenuTransaction(
                //             onTap: () => controller.router(12),
                //             labelTxt: 'trans_electricity_general'.tr,
                //             menuIcon: FaIcon(
                //               FontAwesomeIcons.bolt,
                //               color: textWhiteColor,
                //               size: 40,
                //             ),
                //           ),
                //           MenuTransaction(
                //             onTap: () => controller.router(13),
                //             labelTxt: 'trans_package_general'.tr,
                //             menuIcon: FaIcon(
                //               FontAwesomeIcons.globeAsia,
                //               color: textWhiteColor,
                //               size: 40,
                //             ),
                //           ),
                //         ],
                //       ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
