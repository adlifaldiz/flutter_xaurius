import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/helpers/validator.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:flutter_xaurius/app/widget/xau_container.dart';
import 'package:flutter_xaurius/app/widget/xau_text_field.dart';

import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Out'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
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
                          SizedBox(height: 20),
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
                                  recognizer: new TapGestureRecognizer()..onTap = () => Get.toNamed(Routes.FAQ),
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
                              successSnackbar('Copied to Clipboard', controller.ethAddress);
                              Clipboard.setData(new ClipboardData(text: controller.ethAddress));
                            },
                            child: Text(
                              controller.ethAddress,
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
                              successSnackbar('Copied to Clipboard', controller.bscAddress);
                              Clipboard.setData(new ClipboardData(text: controller.bscAddress));
                            },
                            child: Text(
                              controller.bscAddress,
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
                          SizedBox(height: 20),
                          Divider(thickness: 2, height: 30, color: primaryColor),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Buy Unit Price',
                                style: textTitle,
                              ),
                              Text(controller.responseCheckOut.value.data.buy.buyUnitPrice),
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
                              Text(controller.responseCheckOut.value.data.buy.buyNetwork),
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
                          SizedBox(height: 20),
                          Divider(thickness: 2, height: 30, color: primaryColor),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Kuantitas',
                                style: textTitle,
                              ),
                              Text(controller.responseCheckOut.value.data.buy.buyQty + ' XAU'),
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
                              Text(controller.responseCheckOut.value.data.buy.buyAmount + ' IDR'),
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
                              Text(controller.responseCheckOut.value.data.invoiceCalculation.discount + ' IDR'),
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
                              Expanded(
                                  child: Text(
                                controller.responseCheckOut.value.data.invoiceCalculation.admfee + ' IDR',
                                textAlign: TextAlign.end,
                              )),
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
                              Text(controller.responseCheckOut.value.data.invoiceCalculation.gas.toStringAsFixed(2) + ' IDR'),
                            ],
                          ),
                          SizedBox(height: 20),
                          Divider(thickness: 2, height: 30, color: primaryColor),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: textTitle,
                              ),
                              Text(controller.responseCheckOut.value.data.invoiceCalculation.total.toString() + ' IDR'),
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
                          SizedBox(height: 20),
                          Form(
                            key: controller.checkOutKey,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            child: Column(
                              children: [
                                XauTextField(
                                  ontap: () {},
                                  useObscure: false,
                                  controller: controller.walletController,
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
                                        recognizer: TapGestureRecognizer()..onTap = () => launch('https://metamask.io/download.html'),
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
                                          value: controller.merchantId,
                                          items: controller.listVaMerchant.map((element) {
                                            return new DropdownMenuItem(
                                              child: Text(element.merchantName),
                                              value: int.parse(element.merchantId),
                                              onTap: () {
                                                controller.onChangeMerchant(int.parse(element.merchantId));
                                              },
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            dropDownState(() {
                                              // _value = value;
                                              controller.onChangeMerchant(value);
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
                            controller: controller.voucherController,
                            labelText: 'Voucher *(optional)',
                          ),
                          SizedBox(height: 20),
                          Obx(() {
                            if (controller.isLoadingForm.value) {
                              return JumpingDotsProgressIndicator(color: primaryColor, fontSize: 40);
                            }
                            return RaisedButton(
                              onPressed: () {
                                Get.focusScope.unfocus();
                                controller.checkCheckOut();
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              color: primaryColor,
                              child: Container(
                                width: percentWidth(context, 100),
                                child: Center(
                                  child: Text(
                                    'Lanjut',
                                    style: buttonStyle,
                                  ),
                                ),
                              ),
                            );
                          }),
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
