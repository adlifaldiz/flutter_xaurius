import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/data/model/dashboard/chart_data.dart';
import 'package:flutter_xaurius/app/helpers/intl_formats.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:flutter_xaurius/app/widget/coming_soon.dart';
import 'package:flutter_xaurius/app/widget/menu_produk.dart';
import 'package:flutter_xaurius/app/widget/menu_transaction.dart';
import 'package:flutter_xaurius/app/widget/shimmer_card.dart';
import 'package:flutter_xaurius/app/widget/shimmer_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_xaurius/app/widget/xau_container.dart';
import 'package:intl/intl.dart';

import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controllers/transaction_controller.dart';

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
                              SizedBox(width: 10),
                              Text(
                                'Saldo',
                                style: textTitle,
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () => Get.toNamed(Routes.TOP_UP),
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
                                    'Top Up',
                                    style: stylePrimary.copyWith(color: textBlackColor),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                SizedBox(height: 10),
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
                                    child: Text('Kamu belum memiliki saldo'),
                                  ),
                                ),
                              ]
                            : controller.dash.balance.map((balances) {
                                return Builder(builder: (BuildContext context) {
                                  return Container(
                                    padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 3)),
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      color: backgroundPanelColor,
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
                Padding(
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
                SizedBox(height: 30),
                controller.dash.isLoading.value
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
                            'Harga XAU/IDR',
                            style: textTitle,
                          )
                        ],
                      ),
                SizedBox(height: 10),
                Container(
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
                                            SizedBox(width: 10),
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
                                  SizedBox(height: 10),
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
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: primaryColor, width: 2)),
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
                              visibleMinimum: controller.dash.charts.value[controller.dash.charts.length - 5].cdate,
                              rangePadding: ChartRangePadding.round,
                            ),
                            primaryYAxis: NumericAxis(
                              minimum: double.parse(controller.dash.charts.value.first.chigh) - 25000,
                              maximum: double.parse(controller.dash.charts.value.last.chigh) + 25000,
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
                                  dataSource: controller.dash.charts.value,
                                  xValueMapper: (ChartData gold, _) => gold.cdatestr,
                                  highValueMapper: (ChartData gold, _) => num.parse(gold.chigh),
                                  lowValueMapper: (ChartData gold, _) => num.parse(gold.clow),
                                  openValueMapper: (ChartData gold, _) => num.parse(gold.copen),
                                  closeValueMapper: (ChartData gold, _) => num.parse(gold.cclose),
                                  volumeValueMapper: (ChartData gold, _) => num.parse(gold.cclose),
                                  name: "XAU",
                                  bearColor: primaryColor,
                                  bullColor: textWhiteColor)
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
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
                          SizedBox(width: 10),
                          Text(
                            'Transaksi XAU',
                            style: textTitle,
                          ),
                        ],
                      ),
                SizedBox(height: 10),
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
                          crossAxisCount: 5,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisSpacing: 5,
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
                controller.dash.isLoading.value
                    ? ShimmerText()
                    : Row(
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
                controller.dash.isLoading.value
                    ? ShimmerCard()
                    : GridView.count(
                        padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 1)),
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
                controller.dash.isLoading.value
                    ? ShimmerText()
                    : Row(
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
                controller.dash.isLoading.value
                    ? ShimmerCard()
                    : GridView.count(
                        padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 1)),
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
        );
      }),
    );
  }
}
