import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_xaurius/app/helpers/regex_rule.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/helpers/validator.dart';
import 'package:flutter_xaurius/app/widget/xau_text_field.dart';
import 'package:flutter_xaurius/app/widget/xaurius_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../controllers/send_xau_controller.dart';

class SendXauView extends GetView<SendXauController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AbsorbPointer(
        absorbing: controller.isLoading.value,
        child: GestureDetector(
          onTap: () => Get.focusScope.unfocus(),
          child: Scaffold(
            appBar: AppBar(
              title: Text('trans_send_xau'.tr),
            ),
            body: Obx(
              () => SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 2)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView(
                        shrinkWrap: true,
                        children: controller.balance.where((itemBalance) => itemBalance.balanceSymbol == "XAU").map((itemBalance) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 3)),
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: backgroundPanelColor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            foregroundDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    alignment: Alignment.bottomRight,
                                    image: AssetImage(
                                      'assets/images/mesh-bottom.png',
                                    ))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  itemBalance.balanceSymbol,
                                  style: textTitle.copyWith(color: primaryColor),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  itemBalance.balanceValue,
                                  style: textTitle.copyWith(fontSize: 20),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      // SizedBox(height: percentHeight(context, 5)),
                      // Text('Deposit fee'),
                      // SizedBox(height: percentHeight(context, 1)),
                      // Text(
                      //   '0,00003',
                      //   style: textTitle,
                      // ),
                      SizedBox(height: percentHeight(context, 5)),
                      Text('Network Adress'),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: percentHeight(context, 0.8), horizontal: percentWidth(context, 5)),
                        width: percentWidth(context, 100),
                        decoration:
                            BoxDecoration(color: fillColor, border: Border.all(color: brokenWhiteColor), borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            iconEnabledColor: primaryColor,
                            iconDisabledColor: brokenWhiteColor,
                            dropdownColor: backgroundPanelColor,
                            value: controller.valueNetwork.toString(),
                            items: controller.listNetwork.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              controller.valueNetwork.value = value;
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: percentHeight(context, 2)),
                      Text('reciepent_address'.tr),
                      Obx(
                        () => Form(
                          key: controller.wdKey,
                          autovalidateMode: controller.mode.value,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              XauTextField(
                                useObscure: false,
                                controller: controller.addressController,
                                validator: (value) => validateWdAddress(value),
                                suffixIcon: GestureDetector(
                                  onTap: () => _showQrScan(context),
                                  child: Icon(
                                    Icons.qr_code_scanner,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                              SizedBox(height: percentHeight(context, 2)),
                              Text('amount'.tr),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: XauTextField(
                                      useObscure: false,
                                      onChanged: (value) => controller.onQtyChange(value),
                                      controller: controller.xauController,
                                      validator: (value) => validateWdToken(value, controller.xauBalance.value),
                                      textInputAction: TextInputAction.done,
                                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\,?\.?\d*')),
                                      ],
                                      suffixIcon: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('XAU'),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5)),
                                    child: Icon(
                                      FontAwesomeIcons.exchangeAlt,
                                      color: brokenWhiteColor,
                                    ),
                                  ),
                                  Expanded(
                                    child: XauTextField(
                                      useObscure: false,
                                      controller: controller.idrController,
                                      onChanged: (value) => controller.onTotalChange(value),
                                      validator: (value) => validateWdIdr(controller.xauController.text, controller.xauBalance.value),
                                      textInputAction: TextInputAction.done,
                                      keyboardType: TextInputType.number,
                                      suffixIcon: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('IDR'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: percentHeight(context, 2)),
                              Text('OTP'),
                              Row(
                                children: [
                                  Expanded(
                                    child: XauTextField(
                                      useObscure: false,
                                      controller: controller.otpController,
                                      validator: (value) => validateWdOtp(value),
                                      textInputAction: TextInputAction.done,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(numberValidationRule))],
                                    ),
                                  ),
                                  SizedBox(width: percentWidth(context, 5)),
                                  Obx(
                                    () {
                                      if (controller.isLoadingOTP.value) {
                                        return JumpingDotsProgressIndicator(
                                          fontSize: 20,
                                          color: primaryColor,
                                        );
                                      }
                                      return XauriusButton(
                                        pressAble: true,
                                        text: 'trans_send_xau'.tr + ' OTP',
                                        onpressed: () => controller.isStart.value ? null : controller.sendOTP(),
                                      );
                                      // return RaisedButton(
                                      //   onPressed: () => controller.isStart.value ? null : controller.sendOTP(),
                                      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                      //   color: controller.isStart.value ? disableColor : primaryColor,
                                      //   child: Center(
                                      //     child: Text(
                                      //       'trans_send_xau'.tr + ' OTP',
                                      //       style: buttonStyle,
                                      //     ),
                                      //   ),
                                      // );
                                    },
                                  ),
                                ],
                              ),
                              controller.isStart.value && !controller.isLoadingOTP.value ? Text('Wait ${controller.start.value} sec') : Container(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: percentHeight(context, 5)),
                      Obx(
                        () {
                          if (controller.isLoading.value) {
                            return JumpingDotsProgressIndicator(
                              fontSize: 40,
                              color: primaryColor,
                            );
                          }
                          return XauriusButton(
                            pressAble: true,
                            text: 'trans_send_xau'.tr,
                            onpressed: () {
                              Get.focusScope.unfocus();
                              controller.checkWD();
                            },
                          );
                          // return RaisedButton(
                          //   onPressed: () {
                          //     Get.focusScope.unfocus();
                          //     controller.checkWD();
                          //   },
                          //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          //   color: primaryColor,
                          //   child: Center(
                          //     child: Text(
                          //       'Proceed',
                          //       style: buttonStyle,
                          //     ),
                          //   ),
                          // );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _showQrScan(BuildContext context) {
    showCupertinoModalBottomSheet(
      isDismissible: true,
      context: context,
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('QR Scanner'),
          ),
          body: Stack(
            children: [
              QRView(
                key: controller.qrKey,
                onQRViewCreated: controller.onQRViewCreated,
                overlay: QrScannerOverlayShape(
                    borderColor: Colors.red, borderRadius: 10, borderLength: 30, borderWidth: 10, cutOutSize: controller.scanArea),
              ),
            ],
          ),
        );
      },
    );
  }
}
