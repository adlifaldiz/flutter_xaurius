import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_xaurius/app/data/model/dashboard/chart_data.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controllers/chart_view_controller.dart';

class ChartViewView extends GetView<ChartViewController> {
  @override
  Widget build(BuildContext context) {
    if (GetPlatform.isAndroid) {
      Future.delayed(Duration(seconds: 1), () {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
        ]);
      });
    } else {
      Future.delayed(Duration(seconds: 1), () {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
        ]);
      });
    }

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
            ]);
            Get.back();
          },
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
          ]);
          Get.back();

          return true;
        },
        child: SafeArea(
          child: SfCartesianChart(
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
              // minimum: controller.dashboardboard.charts.first.cdate,
              // maximum: controller.dashboardboard.charts.last.cdate,
              // visibleMinimum: controller.dashboard.charts.value[controller.dashboard.charts.length ].cdate,
              rangePadding: ChartRangePadding.additional,
            ),
            primaryYAxis: NumericAxis(
              minimum: double.parse(controller.dashboard.charts[2].chigh) - 10000,
              maximum: double.parse(controller.dashboard.charts.last.chigh) + 10000,
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
                  dataSource: controller.dashboard.charts,
                  xValueMapper: (ChartData gold, _) => DateTime.parse(controller.formatter.format(gold.cdate)),
                  highValueMapper: (ChartData gold, _) => num.parse(gold.chigh),
                  lowValueMapper: (ChartData gold, _) => num.parse(gold.clow),
                  openValueMapper: (ChartData gold, _) => num.parse(gold.copen),
                  closeValueMapper: (ChartData gold, _) => num.parse(gold.cclose),
                  volumeValueMapper: (ChartData gold, _) => num.parse(gold.cclose),
                  name: "XAU",
                  bearColor: primaryColor,
                  bullColor: textWhiteColor)
            ],
          ),
        ),
      ),
    );
  }
}
