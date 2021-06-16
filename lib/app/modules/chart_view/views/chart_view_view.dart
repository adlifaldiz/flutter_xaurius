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
    Future.delayed(Duration(seconds: 1), () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
      ]);
    });

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
              visibleMinimum: controller.dashboard.charts.value[controller.dashboard.charts.length - 30].cdate,
              rangePadding: ChartRangePadding.round,
            ),
            primaryYAxis: NumericAxis(
              rangePadding: ChartRangePadding.round,
              minimum: double.parse(controller.dashboard.charts.value.first.chigh) - 25000,
              maximum: double.parse(controller.dashboard.charts.value.last.chigh) + 25000,
              numberFormat: NumberFormat.currency(
                locale: "in_In",
                symbol: "\Rp ",
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
              hideDelay: 0,
              enable: true,
              tooltipSettings: InteractiveTooltip(
                color: backgroundPanelColor,
                borderColor: Colors.transparent,
                textStyle: stylePrimary.copyWith(fontSize: 12),
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
            //     isVisible: true,
            //   ),
            //   MacdIndicator(seriesName: "XAU", period: 3, shortPeriod: 5, longPeriod: 10, yAxisName: "secondyaxis", isVisible: true),
            // ],
            series: <ChartSeries>[
              HiloOpenCloseSeries<ChartData, dynamic>(
                dataSource: controller.dashboard.charts.value,
                xValueMapper: (ChartData gold, _) => gold.cdate,
                highValueMapper: (ChartData gold, _) => num.parse(gold.chigh),
                lowValueMapper: (ChartData gold, _) => num.parse(gold.clow),
                openValueMapper: (ChartData gold, _) => num.parse(gold.copen),
                closeValueMapper: (ChartData gold, _) => num.parse(gold.cclose),
                volumeValueMapper: (ChartData gold, _) => num.parse(gold.cclose),
                name: "XAU",
                bearColor: primaryColor,
                bullColor: textWhiteColor,
                enableTooltip: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
