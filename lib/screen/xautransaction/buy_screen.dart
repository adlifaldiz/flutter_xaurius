import 'package:flutter/material.dart';
import 'package:flutter_xaurius/controller/buy_controller.dart';
import 'package:flutter_xaurius/helper/screen_utils.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:flutter_xaurius/helper/validator.dart';
import 'package:flutter_xaurius/widget/xau_container.dart';
import 'package:flutter_xaurius/widget/xau_text_field.dart';
import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';

class BuyScreen extends StatelessWidget {
  BuyController _buyController = Get.put(BuyController());

  @override
  Widget build(BuildContext context) {
    _buyController.goldPriceController.getBuys();
    var priceBuy = double.parse(_buyController.goldPriceController.buyPrice);

    return Scaffold(
      appBar: AppBar(
        title: Text('Beli XAU'),
      ),
      body: Obx(() {
        if (_buyController.goldPriceController.isLoading.value) {
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
                key: _buyController.buyKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                              value: _buyController.value.floor(),
                              items: [
                                DropdownMenuItem(
                                  child: Text('ETH (Ethereum)'),
                                  value: 1,
                                  onTap: () {
                                    _buyController.onChangeBuy(1);
                                  },
                                ),
                                DropdownMenuItem(
                                  child: Text('BSC (Binance Smart Chain)'),
                                  value: 2,
                                  onTap: () {
                                    _buyController.onChangeBuy(2);
                                  },
                                ),
                              ],
                              onChanged: (value) {
                                dropDownState(() {
                                  _buyController.value = value;
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
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        return validateToken(val);
                      },
                      controller: _buyController.qtyController,
                      onChanged: (val) {
                        if (val.isEmpty) {
                          _buyController.qtyController.text = '0';
                        }
                        var value = double.parse(val);
                        var total = priceBuy * value;
                        _buyController.totalController.text = total.toString();
                      },
                    ),
                    SizedBox(height: 10),
                    XauTextField(
                      useObscure: false,
                      labelText: 'Total (IDR) *min 50.000.00',
                      keyboardType: TextInputType.number,
                      controller: _buyController.totalController,
                      validator: (value) {
                        return validateSubTotal(value);
                      },
                      onChanged: (val) {
                        if (val.isEmpty) {
                          _buyController.totalController.text = '0';
                        }
                        var value = double.parse(val);
                        var total = value / priceBuy;
                        _buyController.qtyController.text = total.toStringAsFixed(10);
                      },
                    ),
                    SizedBox(height: 30),
                    Obx(() {
                      if (_buyController.isLoadingForm.value) {
                        return JumpingDotsProgressIndicator(
                          numberOfDots: 3,
                          fontSize: 40,
                          color: primaryColor,
                        );
                      }
                      return RaisedButton(
                        onPressed: () {
                          _buyController.checkBuy();
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
    );
  }
}
