import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';

import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../controllers/deposit_controller.dart';

class DepositView extends GetView<DepositController> {
  @override
  Widget build(BuildContext context) {
    var x = Get.width * 0.1;
    return GestureDetector(
      onTap: () => Get.focusScope.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Deposit Crypto'),
        ),
        body: Obx(
          () => SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                  horizontal: percentWidth(context, 5),
                  vertical: percentHeight(context, 2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView(
                    shrinkWrap: true,
                    children: controller.balanceDummy
                        .where(
                            (itemBalance) => itemBalance.balanceSymbol == "XAU")
                        .map((itemBalance) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: percentWidth(context, 5),
                            vertical: percentHeight(context, 3)),
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
                  Center(
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              width: Get.width * 0.1,
                              color: backgroundPanelColor.withOpacity(0.1),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Container(
                              child: QrImage(
                            data: controller.address.toString(),
                            version: QrVersions.auto,
                            size: Get.width * 0.5,
                            gapless: false,
                            backgroundColor: Colors.white,
                          )))),
                  SizedBox(height: percentHeight(context, 4)),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            width: Get.width * 0.8,
                            child: TextField(
                              readOnly: true,
                              controller: controller.linkText,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white10,
                              ),
                            )),
                        // Expanded(
                        //     child: ButtonTheme(
                        //         minWidth: x,
                        //            shape: RoundedRectangleBorder(
                        //                borderRadius: BorderRadius.circular(5)),
                        //         height: x,
                        //         child: Center(
                        //             child: RaisedButton(
                        //                 onPressed: () => Clipboard.setData(
                        //                     ClipboardData(
                        //                         text: controller.address
                        //                             .toString())),
                        //                 padding: EdgeInsets.zero,
                        //                 child: Center(
                        //                     child: Icon(
                        //                   Icons.content_copy,
                        //                   color: Colors.white,
                        //                 ))))))
                      ]),
                  SizedBox(height: percentHeight(context, 2)),
                  RaisedButton(
                    onPressed: () => Clipboard.setData(
                        ClipboardData(text: controller.address.toString())),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: primaryColor,
                    child: Center(
                      child: Text(
                        'Copy Adress',
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
                    borderColor: Colors.red,
                    borderRadius: 10,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: controller.scanArea),
              ),
            ],
          ),
        );
      },
    );
  }
}
