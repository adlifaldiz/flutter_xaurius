import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:flutter_xaurius/app/widget/empty_state.dart';
import 'package:flutter_xaurius/app/widget/xau_container.dart';

import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Obx(() {
        if (controller.goldPriceController.isLoading.value) {
          return Center(
            child: JumpingDotsProgressIndicator(
              fontSize: 40,
              color: primaryColor,
            ),
          );
        }

        if (controller.goldPriceController.listBuys == null) {
          return EmptyState();
        }

        return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5)),
            itemCount: controller.goldPriceController.listBuys.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    EdgeInsets.symmetric(vertical: percentWidth(context, 1)),
                child: GestureDetector(
                  onTap: () => Get.toNamed(Routes.INVOICE, arguments: controller
                      .goldPriceController.listBuys[index].invoiceId),
                  child: XauriusContainer(
                      child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Invoice',
                                style: textTitle,
                              ),
                              SizedBox(width: 5),
                              Text(
                                '#' +
                                    controller.goldPriceController
                                        .listBuys[index].invoiceId
                                        .toString(),
                              ),
                            ],
                          ),
                          Text(
                            controller
                                .goldPriceController.listBuys[index].buyStatus
                                .toString(),
                            style: textTitle.copyWith(color: primaryColor),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Kuantitas ',
                            style: stylePrimary,
                          ),
                          Text(
                            controller.goldPriceController.listBuys[index]
                                    .buyQty +
                                ' XAU',
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total ',
                            style: stylePrimary,
                          ),
                          Text(
                            controller.goldPriceController.listBuys[index]
                                    .buyAmount +
                                ' XAU',
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  )),
                ),
              );
            });
      }),
    ));
  }
}
