import 'package:flutter/material.dart';
import 'package:flutter_xaurius/controller/gold_price_controller.dart';
import 'package:flutter_xaurius/helper/screen_utils.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:flutter_xaurius/screen/xautransaction/buy/invoice_screen.dart';
import 'package:flutter_xaurius/widget/empty_state.dart';
import 'package:flutter_xaurius/widget/xau_container.dart';
import 'package:flutter_xaurius/widget/xaurius_card.dart';
import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GoldPriceController _goldPriceController = GoldPriceController();
    _goldPriceController.getBuys();

    return Scaffold(body: SafeArea(
      child: Obx(() {
        if (_goldPriceController.isLoading.value) {
          return Center(
            child: JumpingDotsProgressIndicator(
              fontSize: 40,
              color: primaryColor,
            ),
          );
        }

        if (_goldPriceController.listBuys == null) {
          return EmptyState();
        }

        return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5)),
            itemCount: _goldPriceController.listBuys.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: percentWidth(context, 1)),
                child: GestureDetector(
                  onTap: () => Get.to(InvoiceScreen(invoiceId: _goldPriceController.listBuys[index].invoiceId)),
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
                                '#' + _goldPriceController.listBuys[index].invoiceId.toString(),
                              ),
                            ],
                          ),
                          Text(
                            _goldPriceController.listBuys[index].buyStatus.toString(),
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
                            _goldPriceController.listBuys[index].buyQty + ' XAU',
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
                            _goldPriceController.listBuys[index].buyAmount + ' XAU',
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
