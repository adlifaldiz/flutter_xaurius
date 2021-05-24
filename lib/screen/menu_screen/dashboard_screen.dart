import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_xaurius/helper/screen_utils.dart';
import 'package:flutter_xaurius/model/Sales.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:flutter_xaurius/model/kyc/response_kyc_1_model.dart';
import 'package:flutter_xaurius/resources/api_provider.dart';
import 'package:flutter_xaurius/screen/personal/data_personal_screen.dart';
import 'package:flutter_xaurius/widget/carousel_widget/item1.dart';
import 'package:flutter_xaurius/widget/carousel_widget/item2.dart';
import 'package:flutter_xaurius/widget/carousel_widget/item3.dart';
import 'package:flutter_xaurius/widget/xau_container.dart';

import 'package:flutter_xaurius/widget/xaurius_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with AutomaticKeepAliveClientMixin {
  int _currentIndex = 0;
  SharedPreferences localStorage;

  ApiProvider service = ApiProvider();
  ResponseKyc1 response;
  bool _isLoading = false;
  bool _statusKyc = true;
  bool _statusKycReview = false;
  String nama;
  String email;

  List cardList = [Item1(), Item2(), Item3()];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Selamat Pagi';
    }
    if (hour < 15) {
      return 'Selamat Siang';
    }
    if (hour < 19) {
      return 'Selamat Sore';
    }
    return 'Selamat Malam';
  }

  _chekKyc1() async {
    setState(() {
      _isLoading = true;
    });
    localStorage = await SharedPreferences.getInstance();
    try {
      response = await service.getKyc1(localStorage.getString('token'));
      if (response.success) {
        setState(() {
          _statusKyc = response.data.orang.orangKycEditAvailable;
          _statusKycReview = response.data.orang.orangKycAskForReview;
          nama = response.data.orang.orangName;
          email = response.data.orang.orangEmail;
        });
      } else {
        print(response);
      }
      setState(() {
        _isLoading = false;
      });
    } on TimeoutException catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
    } on SocketException catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
    } on Error catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    greeting();
    _chekKyc1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _isLoading
        ? Center(
            child: JumpingDotsProgressIndicator(
              numberOfDots: 3,
              fontSize: 40,
              color: primaryColor,
            ),
          )
        : Scaffold(
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
                      _chekKyc1();
                    }),
              ],
            ),
            body: SafeArea(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.all(20),
                children: [
                  _statusKyc
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
                      : null,
                  _statusKyc
                      ? SizedBox(
                          height: 20,
                        )
                      : null,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              greeting(),
                              style: TextStyle(letterSpacing: 1, fontWeight: FontWeight.normal, fontSize: 16),
                            ),
                            SizedBox(height: 5),
                            Text(
                              nama ?? email,
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

                  // CarouselSlider(
                  //   options: CarouselOptions(
                  //     autoPlay: true,
                  //     autoPlayInterval: Duration(seconds: 3),
                  //     autoPlayAnimationDuration: Duration(milliseconds: 800),
                  //     autoPlayCurve: Curves.fastOutSlowIn,
                  //     pauseAutoPlayOnTouch: true,
                  //     viewportFraction: 1.0,
                  //     enlargeCenterPage: true,
                  //     enableInfiniteScroll: false,
                  //     onPageChanged: (index, reason) {
                  //       setState(() {
                  //         _currentIndex = index;
                  //       });
                  //     },
                  //   ),
                  //   items: cardList.map((card) {
                  //     return Builder(builder: (BuildContext context) {
                  //       return Container(
                  //         child: card,
                  //       );
                  //     });
                  //   }).toList(),
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: map<Widget>(cardList, (index, url) {
                  //     return Container(
                  //       width: 10.0,
                  //       height: 10.0,
                  //       margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  //       decoration: BoxDecoration(
                  //         shape: BoxShape.circle,
                  //         color: _currentIndex == index ? Colors.yellow : Colors.grey,
                  //       ),
                  //     );
                  //   }),
                  // ),
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
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Buy',
                                style: TextStyle(
                                  color: greenColor,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Sell',
                                style: TextStyle(
                                  color: redColor,
                                ),
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
                        onTap: () {},
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
                        onTap: () {},
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
                          onTap: () {},
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
                          onTap: () {},
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
  }

  @override
  bool get wantKeepAlive => true;
}
