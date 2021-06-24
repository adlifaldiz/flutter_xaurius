import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return GestureDetector(
      onTap: () => Get.focusScope.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('trans_buy_xau'.tr + ' XAU'),
        ),
        body: Obx(() {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 3)),
                child: Form(
                  key: controller.buyKey,
                  autovalidateMode: AutovalidateMode.always,
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
                      SizedBox(height: 20),
                      // Container(
                      //   padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5)),
                      //   width: percentWidth(context, 100),
                      //   decoration:
                      //       BoxDecoration(color: fillColor, border: Border.all(color: brokenWhiteColor), borderRadius: BorderRadius.circular(10)),
                      //   child: DropdownButtonHideUnderline(
                      //     child: StatefulBuilder(
                      //       builder: (BuildContext context, StateSetter dropDownState) {
                      //         return DropdownButton(
                      //           iconEnabledColor: primaryColor,
                      //           iconDisabledColor: brokenWhiteColor,
                      //           dropdownColor: backgroundPanelColor,
                      //           value: controller.value.floor(),
                      //           items: [
                      //             DropdownMenuItem(
                      //               child: Text('ETH (Ethereum)'),
                      //               value: 1,
                      //               onTap: () {
                      //                 controller.onChangeBuy(1);
                      //               },
                      //             ),
                      //             DropdownMenuItem(
                      //               child: Text('BSC (Binance Smart Chain)'),
                      //               value: 2,
                      //               onTap: () {
                      //                 controller.onChangeBuy(2);
                      //               },
                      //             ),
                      //             DropdownMenuItem(
                      //               child: Text('Private'),
                      //               value: 3,
                      //               onTap: () {
                      //                 controller.onChangeBuy(3);
                      //               },
                      //             ),
                      //           ],
                      //           onChanged: (value) {
                      //             dropDownState(() {
                      //               controller.value = value;
                      //             });
                      //           },
                      //         );
                      //       },
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 10),
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
                        labelText: 'total_xau'.tr,
                        keyboardType: TextInputType.number,
                        controller: controller.totalController,
                        prefixIcon: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Rp'),
                          ],
                        ),
                        validator: (value) {
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
                        return RaisedButton(
                          onPressed: () {
                            Get.focusScope.unfocus();
                            controller.checkBuy();
                          },
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          color: primaryColor,
                          child: Container(
                            width: percentWidth(context, 100),
                            child: Center(
                                child: Text(
                              'next_btn'.tr,
                              style: buttonStyle,
                            )),
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({this.decimalRange}) : assert(decimalRange == null || decimalRange > 0);

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    if (decimalRange != null) {
      String value = newValue.text;

      if (value.contains(".") && value.substring(value.indexOf(".") + 1).length > decimalRange) {
        truncated = oldValue.text;
        newSelection = oldValue.selection;
      } else if (value == ".") {
        truncated = "0.";

        newSelection = newValue.selection.copyWith(
          baseOffset: math.min(truncated.length, truncated.length + 1),
          extentOffset: math.min(truncated.length, truncated.length + 1),
        );
      }

      return TextEditingValue(
        text: truncated,
        selection: newSelection,
        composing: TextRange.empty,
      );
    }
    return newValue;
  }
}
