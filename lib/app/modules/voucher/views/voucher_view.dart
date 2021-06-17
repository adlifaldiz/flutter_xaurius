import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/intl_formats.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/widget/empty_state.dart';
import 'package:flutter_xaurius/app/widget/xau_container.dart';

import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../controllers/voucher_controller.dart';

class VoucherView extends GetView<VoucherController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voucher Kamu'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.auth.isLoading.value) {
          return Center(
            child: JumpingDotsProgressIndicator(
              color: primaryColor,
              fontSize: 40,
            ),
          );
        }

        if (controller.auth.userVouchers.isEmpty) {
          return EmptyState();
        }

        return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 1)),
            itemCount: controller.auth.userVouchers.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: percentHeight(context, 1)),
                child: XauriusContainer(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          alignment: Alignment.bottomRight,
                          image: AssetImage(
                            'assets/images/mesh-bottom.png',
                          ))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.auth.userVouchers[index].voucherCode,
                            style: textTitle,
                          ),
                          Text(
                            controller.auth.userVouchers[index].voucherStatus,
                            style: textTitle.copyWith(color: primaryColor),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        customCurrency(controller.auth.userVouchers[index].voucherValue, symbol: 'Rp '),
                        style: textTitle,
                      ),
                    ],
                  ),
                ),
              );
            });
      }),
    );
  }
}
