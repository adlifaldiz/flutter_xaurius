import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_xaurius/controller/dashboard_controller.dart';
import 'package:flutter_xaurius/controller/kyc_controller.dart';
import 'package:flutter_xaurius/helper/screen_utils.dart';
import 'package:flutter_xaurius/model/Sales.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:flutter_xaurius/controller/gold_price_controller.dart';
import 'package:flutter_xaurius/screen/artikel/article.dart';
import 'package:flutter_xaurius/screen/personal/data_personal_screen.dart';
import 'package:flutter_xaurius/screen/social/media.dart';

import 'package:flutter_xaurius/widget/xau_container.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:progress_indicators/progress_indicators.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardScreen extends StatelessWidget {
  DashboardController _dashboardController = Get.put(DashboardController());
  GoldPriceController _goldController = Get.put(GoldPriceController());
  KycController _kycController = Get.put(KycController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              onPressed: () {}),
          IconButton(
              icon: FaIcon(
                FontAwesomeIcons.bullhorn,
                color: brokenWhiteColor,
                size: 20,
              ),
              onPressed: () {
                // _chekKyc1();
              }),
        ],
      ),
      body: Obx(() {
        if (_dashboardController.goldPriceController.isLoading.value || _dashboardController.kycController.isLoading.value) {
          Center(
            child: JumpingDotsProgressIndicator(
              numberOfDots: 3,
              fontSize: 40,
              color: primaryColor,
            ),
          );
        }
        return SafeArea(
          child: LiquidPullToRefresh(
            color: backgroundPanelColor,
            backgroundColor: primaryColor,
            key: _dashboardController.refreshIndicatorKey,
            onRefresh: _dashboardController.onRefresh,
            showChildOpacityTransition: false,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(20),
              children: [
                _kycController.isKycReview.value
                    ? XauriusContainer(
                        child: Column(
                          children: [
                            Text('Akun kamu sedang di review'),
                          ],
                        ),
                      )
                    : Container(),
                _kycController.isKycReview.value
                    ? SizedBox(
                        height: 20,
                      )
                    : Container(),
                _kycController.isKycStatus.value
                    ? XauriusContainer(
                        child: Column(
                          children: [
                            Text('Kamu Belum melakukan KYC'),
                            FlatButton(
                              color: primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              onPressed: () => Get.to(DataPersonalScreen()),
                              child: Text(
                                'KYC Sekarang',
                                style: stylePrimaryDark,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
                _kycController.isKycStatus.value
                    ? SizedBox(
                        height: 20,
                      )
                    : Container(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _dashboardController.greeting(),
                            style: TextStyle(letterSpacing: 1, fontWeight: FontWeight.normal, fontSize: 16),
                          ),
                          SizedBox(height: 5),
                          Text(
                            _kycController.isLoading.value
                                ? '-'
                                : _kycController.nama.string == null
                                    ? _kycController.email.string
                                    : _kycController.nama.string,
                            overflow: TextOverflow.fade,
                            style: TextStyle(letterSpacing: 1, fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'XAU: ',
                            style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 16),
                            children: <TextSpan>[
                              TextSpan(text: '00.00', style: TextStyle(fontWeight: FontWeight.bold, color: brokenWhiteColor)),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            text: 'IDR: ',
                            style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 16),
                            children: <TextSpan>[
                              TextSpan(text: 'no', style: TextStyle(fontWeight: FontWeight.bold, color: brokenWhiteColor)),
                              TextSpan(text: '.00', style: TextStyle(color: brokenWhiteColor)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Transform.rotate(
                      angle: 0.8,
                      child: Icon(
                        FontAwesomeIcons.wifi,
                        color: accentColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Harga XAU/IDR',
                      style: textTitle,
                    )
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
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
                              child: Text(
                                _goldController.isLoading.value
                                    ? '-'
                                    : _dashboardController.isBuy.value
                                        ? "IDR: ${_goldController.buyPrice}" ?? '-'
                                        : "IDR: ${_goldController.sellPrice}" ?? '-',
                                style: stylePrimary.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  onTap: () {
                                    _dashboardController.onChangeBuy(true);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: _dashboardController.isBuy.value ? textBlackColor : Colors.transparent,
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
                                    _dashboardController.onChangeBuy(false);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: _dashboardController.isBuy.value ? Colors.transparent : textBlackColor,
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
                          ],
                        ),
                        SfCartesianChart(
                          primaryXAxis: DateTimeAxis(),
                          primaryYAxis: NumericAxis(
                            minimum: 80,
                            maximum: 130,
                            numberFormat: NumberFormat.currency(
                              locale: "en_US",
                              symbol: "\$",
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
                          title: ChartTitle(text: "XAU/IDR 2021", textStyle: TextStyle(color: textWhiteColor)),
                          indicators: <TechnicalIndicators<SalesData, dynamic>>[
                            BollingerBandIndicator<SalesData, dynamic>(
                              seriesName: "XAU Stock",
                              period: 3,
                              isVisible: false,
                            ),
                            MacdIndicator(
                                seriesName: "XAU Stock", period: 1, shortPeriod: 3, longPeriod: 5, yAxisName: "secondyaxis", isVisible: false),
                          ],
                          series: <ChartSeries>[
                            HiloOpenCloseSeries<SalesData, dynamic>(
                                dataSource: chartData,
                                xValueMapper: (SalesData sales, _) => sales.x,
                                highValueMapper: (SalesData sales, _) => sales.high,
                                lowValueMapper: (SalesData sales, _) => sales.low,
                                openValueMapper: (SalesData sales, _) => sales.open,
                                closeValueMapper: (SalesData sales, _) => sales.close,
                                volumeValueMapper: (SalesData sales, _) => sales.close,
                                name: "XAU Stock",
                                bearColor: textWhiteColor,
                                bullColor: accentColor)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Transform.rotate(
                          angle: 0.8,
                          child: Icon(
                            FontAwesomeIcons.wifi,
                            color: accentColor,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Artikel',
                          style: textTitle,
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () => Get.to(Article()),
                      child: Text(
                        'Lihat semua',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  height: percentHeight(context, 20),
                  width: percentWidth(context, 100),
                  padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 2)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: backgroundPanelColor,
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          width: percentWidth(context, 50),
                          decoration: BoxDecoration(color: textBlackColor, borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                child: Image.asset(
                                  'assets/images/item2.png',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: percentHeight(context, 8),
                                ),
                              ),
                              SizedBox(height: 5),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                    style: stylePrimary.copyWith(fontSize: 10),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Transform.rotate(
                          angle: 0.8,
                          child: Icon(
                            FontAwesomeIcons.wifi,
                            color: accentColor,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Sosial media',
                          style: textTitle,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => Get.to(Media()),
                      child: Text(
                        'Lihat semua',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
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
        );
      }),
    );
  }
}
