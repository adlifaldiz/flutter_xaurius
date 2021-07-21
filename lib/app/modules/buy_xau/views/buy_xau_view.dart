import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_xaurius/app/widget/xaurius_button.dart';
import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';

import 'package:flutter_xaurius/app/helpers/intl_formats.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/helpers/validator.dart';
import 'package:flutter_xaurius/app/widget/xau_container.dart';
import 'package:flutter_xaurius/app/widget/xau_text_field.dart';

import '../controllers/buy_xau_controller.dart';

class BuyXauView extends GetView<BuyXauController> {
  @override
  Widget build(BuildContext context) {
    AutovalidateMode mode = AutovalidateMode.disabled;
    return Obx(
      () => AbsorbPointer(
        absorbing: controller.isLoading.value,
        child: GestureDetector(
          onTap: () => Get.focusScope.unfocus(),
          child: Scaffold(
            appBar: AppBar(
              title: Text('trans_buy_xau'.tr + ' XAU'),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 3)),
                  child: Form(
                    key: controller.buyKey,
                    autovalidateMode: mode,
                    child: Column(
                      children: [
                        XauriusContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'XAU/IDR',
                                style: stylePrimary.copyWith(color: primaryColor, fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(width: 10),
                              Text(
                                customCurrency(controller.dash.goldPrice.value.chartpriceBuy) ?? '000.000',
                                style: stylePrimary.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        XauTextField(
                          useObscure: false,
                          labelText: 'quantity_xau'.tr,
                          inputFormatters: [
                            // FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\,?\d*)')),
                            FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\,?\.?\d*')),
                          ],
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          suffixIcon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('XAU'),
                            ],
                          ),
                          validator: (val) {
                            return validateToken(val);
                          },
                          controller: controller.qtyController,
                          onChanged: (val) {
                            return controller.onQtyChange(val);
                          },
                        ),
                        SizedBox(height: 10),
                        XauTextField(
                          useObscure: false,
                          labelText: 'total_xau'.tr + ' (*min 50.000)',
                          keyboardType: TextInputType.number,
                          controller: controller.totalController,
                          readOnly: false,
                          prefixIcon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Rp'),
                            ],
                          ),
                          validator: (val) {
                            return validateSubTotal(controller.totalController);
                          },
                          onChanged: (val) {
                            return controller.onTotalChange(val);
                          },
                        ),
                        SizedBox(height: 30),
                        Obx(() {
                          if (controller.isLoading.value) {
                            return JumpingDotsProgressIndicator(
                              numberOfDots: 3,
                              fontSize: 40,
                              color: primaryColor,
                            );
                          }
                          return XauriusButton(
                            pressAble: true,
                            text: 'next_btn'.tr,
                            onpressed: () {
                              Get.focusScope.unfocus();
                              controller.checkBuy();
                            },
                          );
                          // return RaisedButton(
                          //   onPressed: () {
                          //     Get.focusScope.unfocus();
                          //     controller.checkBuy();
                          //   },
                          //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          //   color: primaryColor,
                          //   child: Container(
                          //     width: percentWidth(context, 100),
                          //     child: Center(
                          //         child: Text(
                          //       'next_btn'.tr,
                          //       style: buttonStyle,
                          //     )),
                          //   ),
                          // );
                        })
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
