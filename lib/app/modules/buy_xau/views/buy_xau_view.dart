import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/helpers/validator.dart';
import 'package:flutter_xaurius/widget/xau_container.dart';
import 'package:flutter_xaurius/widget/xau_text_field.dart';

import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../controllers/buy_xau_controller.dart';

class BuyXauView extends GetView<BuyXauController> {
  @override
  Widget build(BuildContext context) {
    var priceBuy = double.parse(controller.goldPriceController.buyPrice);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Beli XAU'),
        ),
        body: Obx(() {
          if (controller.goldPriceController.isLoading.value) {
            return Center(
              child: JumpingDotsProgressIndicator(
                numberOfDots: 3,
                fontSize: 40,
                color: primaryColor,
              ),
            );
          }
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
                              priceBuy.toString() ?? '000.000',
                              style: stylePrimary.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5)),
                        width: percentWidth(context, 100),
                        decoration:
                        BoxDecoration(color: fillColor, border: Border.all(color: brokenWhiteColor), borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonHideUnderline(
                          child: StatefulBuilder(
                            builder: (BuildContext context, StateSetter dropDownState) {
                              return DropdownButton(
                                iconEnabledColor: primaryColor,
                                iconDisabledColor: brokenWhiteColor,
                                dropdownColor: backgroundPanelColor,
                                value: controller.value.floor(),
                                items: [
                                  DropdownMenuItem(
                                    child: Text('ETH (Ethereum)'),
                                    value: 1,
                                    onTap: () {
                                      controller.onChangeBuy(1);
                                    },
                                  ),
                                  DropdownMenuItem(
                                    child: Text('BSC (Binance Smart Chain)'),
                                    value: 2,
                                    onTap: () {
                                      controller.onChangeBuy(2);
                                    },
                                  ),
                                ],
                                onChanged: (value) {
                                  dropDownState(() {
                                    controller.value = value;
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      XauTextField(
                        useObscure: false,
                        labelText: 'Kuantitas (XAU)',
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.,]"))],
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
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
                        labelText: 'Total (IDR) *min 50.000.00',
                        keyboardType: TextInputType.number,
                        controller: controller.totalController,
                        validator: (value) {
                          return validateSubTotal(value);
                        },
                        onChanged: (val) {
                          return controller.onTotalChange(val);
                        },
                      ),
                      SizedBox(height: 30),
                      Obx(() {
                        if (controller.isLoadingForm.value) {
                          return JumpingDotsProgressIndicator(
                            numberOfDots: 3,
                            fontSize: 40,
                            color: primaryColor,
                          );
                        }
                        return RaisedButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            controller.checkBuy();
                          },
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          color: primaryColor,
                          child: Container(
                            width: percentWidth(context, 100),
                            child: Center(
                                child: Text(
                                  'Lanjut',
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
