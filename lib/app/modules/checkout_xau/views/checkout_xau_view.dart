import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_xaurius/app/modules/info/faq_screen.dart';
import 'package:flutter_xaurius/helper/dialog_utils.dart';
import 'package:flutter_xaurius/helper/screen_utils.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:flutter_xaurius/helper/validator.dart';
import 'package:flutter_xaurius/widget/xau_container.dart';
import 'package:flutter_xaurius/widget/xau_text_field.dart';

import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/checkout_xau_controller.dart';

class CheckoutXauView extends GetView<CheckoutXauController> {
  final String buyId;

  CheckoutXauView({Key key, this.buyId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckoutXauController _checkOutController = Get.put(CheckoutXauController());
    _checkOutController.getCheckOut();

    return Scaffold(
      appBar: AppBar(
        title: Text('Check Out'),
      ),
      body: Obx(() {
        if (_checkOutController.isLoading.value) {
          return Center(
            child: JumpingDotsProgressIndicator(
              fontSize: 40,
              color: primaryColor,
            ),
          );
        }
        return GestureDetector(
          onTap: () => Get.focusScope.unfocus(),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 3)),
                    child: XauriusContainer(
                      child: Column(
                        children: [
                          Text(
                            'Contract Address',
                            style: textTitle,
                          ),
                          // SizedBox(height: 20),
                          Divider(thickness: 2, height: 30, color: primaryColor),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Apa itu Contract Address? ',
                              style: stylePrimary.copyWith(fontSize: 12),
                              children: [
                                TextSpan(
                                  text: 'Klik disini',
                                  style: stylePrimary.copyWith(
                                    fontSize: 12,
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: new TapGestureRecognizer()..onTap = () => Get.to(FAQScreen()),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Contract Address Ethereum',
                            style: textTitle,
                          ),
                          GestureDetector(
                            onTap: () {
                              successSnackbar('Copied to Clipboard', _checkOutController.ethAddress);
                              Clipboard.setData(new ClipboardData(text: _checkOutController.ethAddress));
                            },
                            child: Text(
                              _checkOutController.ethAddress,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Contract Address Binance Smart Chain',
                            style: textTitle,
                            textAlign: TextAlign.center,
                          ),
                          GestureDetector(
                            onTap: () {
                              successSnackbar('Copied to Clipboard', _checkOutController.bscAddress);
                              Clipboard.setData(new ClipboardData(text: _checkOutController.bscAddress));
                            },
                            child: Text(
                              _checkOutController.bscAddress,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 3)),
                    child: XauriusContainer(
                      child: Column(
                        children: [
                          Text(
                            'Unit',
                            style: textTitle,
                          ),
                          // SizedBox(height: 20),
                          Divider(thickness: 2, height: 30, color: primaryColor),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Buy Unit Price',
                                style: textTitle,
                              ),
                              Text(_checkOutController.responseCheckOut.value.data.buy.buyUnitPrice),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Network',
                                style: textTitle,
                              ),
                              Text(_checkOutController.responseCheckOut.value.data.buy.buyNetwork),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 1)),
                    child: XauriusContainer(
                      child: Column(
                        children: [
                          Text(
                            'Total Perhitungan',
                            style: textTitle,
                          ),
                          // SizedBox(height: 20),
                          Divider(thickness: 2, height: 30, color: primaryColor),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Kuantitas',
                                style: textTitle,
                              ),
                              Text(_checkOutController.responseCheckOut.value.data.buy.buyQty + ' XAU'),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sub total',
                                style: textTitle,
                              ),
                              Text(_checkOutController.responseCheckOut.value.data.buy.buyAmount + ' IDR'),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Discount',
                                style: textTitle,
                              ),
                              Text(_checkOutController.responseCheckOut.value.data.invoiceCalculation.discount + ' IDR'),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Biaya admin',
                                style: textTitle,
                              ),
                              Text(_checkOutController.responseCheckOut.value.data.invoiceCalculation.admfee + ' IDR'),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Biaya GAS',
                                style: textTitle,
                              ),
                              Text(_checkOutController.responseCheckOut.value.data.invoiceCalculation.gas.toStringAsFixed(2) + ' IDR'),
                            ],
                          ),
                          // SizedBox(height: 20),
                          Divider(thickness: 2, height: 30, color: primaryColor),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: textTitle,
                              ),
                              Text(_checkOutController.responseCheckOut.value.data.invoiceCalculation.total.toString() + ' IDR'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 3)),
                    child: XauriusContainer(
                      child: Column(
                        children: [
                          Text(
                            'Pembayaran',
                            style: textTitle,
                          ),
                          Divider(thickness: 2, height: 30, color: primaryColor),

                          // SizedBox(height: 20),
                          Form(
                            key: _checkOutController.checkOutKey,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            child: Column(
                              children: [
                                XauTextField(
                                  ontap: () {},
                                  useObscure: false,
                                  controller: _checkOutController.walletController,
                                  validator: validateWallet,
                                  labelText: 'Wallet address',
                                ),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: 'Kamu bisa menggunakan Metamask Wallet untuk membuat Wallet Address secara gratis, ',
                                    style: stylePrimary.copyWith(fontSize: 12),
                                    children: [
                                      TextSpan(
                                        text: 'disini',
                                        style: stylePrimary.copyWith(
                                          fontSize: 12,
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        recognizer: new TapGestureRecognizer()..onTap = () => launch('https://metamask.io/download.html'),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5)),
                                  width: percentWidth(context, 100),
                                  decoration: BoxDecoration(
                                      color: fillColor, border: Border.all(color: brokenWhiteColor), borderRadius: BorderRadius.circular(10)),
                                  child: DropdownButtonHideUnderline(
                                    child: StatefulBuilder(
                                      builder: (BuildContext context, StateSetter dropDownState) {
                                        return DropdownButton(
                                          iconEnabledColor: primaryColor,
                                          iconDisabledColor: brokenWhiteColor,
                                          dropdownColor: backgroundPanelColor,
                                          value: _checkOutController.merchantId,
                                          items: _checkOutController.listVaMerchant.map((element) {
                                            return new DropdownMenuItem(
                                              child: Text(element.merchantName),
                                              value: int.parse(element.merchantId),
                                              onTap: () {
                                                _checkOutController.onChangeMerchant(int.parse(element.merchantId));
                                              },
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            dropDownState(() {
                                              // _value = value;
                                              _checkOutController.onChangeMerchant(value);
                                            });
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 20),
                          XauTextField(
                            useObscure: false,
                            controller: _checkOutController.voucherController,
                            labelText: 'Voucher *(optional)',
                          ),
                          SizedBox(height: 20),

                          Obx(() {
                            if (_checkOutController.isLoadingForm.value) {
                              return JumpingDotsProgressIndicator(
                                numberOfDots: 3,
                                fontSize: 40,
                                color: primaryColor,
                              );
                            }
                            return RaisedButton(
                              onPressed: () {
                                Get.focusScope.unfocus();
                                // successSnackbar('title', _checkOutController.merchantId.toString());
                                _checkOutController.checkCheckOut();
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
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
