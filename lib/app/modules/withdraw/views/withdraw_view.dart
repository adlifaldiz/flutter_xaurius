import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/widget/xau_text_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../controllers/withdraw_controller.dart';

class WithdrawView extends GetView<WithdrawController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Withdraw Crypto'),
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
                  SizedBox(height: percentHeight(context, 5)),
                  Text('Deposit fee'),
                  SizedBox(height: percentHeight(context, 1)),
                  Text(
                    '0,00003',
                    style: textTitle,
                  ),
                  SizedBox(height: percentHeight(context, 5)),
                  Text('Receipents Adress'),
                  XauTextField(
                    useObscure: false,
                    controller: controller.addressController,
                    suffixIcon: GestureDetector(
                      onTap: () => _showQrScan(context),
                      child: Icon(
                        Icons.qr_code_scanner,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(height: percentHeight(context, 2)),
                  Text('Amount'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: XauTextField(
                          useObscure: false,
                          onChanged: (value) => controller.onQtyChange(value),
                          controller: controller.xauController,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
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
                  SizedBox(height: percentHeight(context, 5)),
                  RaisedButton(
                    onPressed: () => null,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    color: primaryColor,
                    child: Center(
                      child: Text(
                        'Proceed',
                        style: buttonStyle,
                      ),
                    ),
                  )
                ],
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
