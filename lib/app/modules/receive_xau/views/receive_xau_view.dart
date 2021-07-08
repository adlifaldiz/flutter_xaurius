import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/widget/xau_text_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../controllers/receive_xau_controller.dart';

class ReceiveXauView extends GetView<ReceiveXauController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('trans_receive_xau'.tr),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(percentWidth(context, 2.5)),
                        decoration: BoxDecoration(color: backgroundPanelColor, borderRadius: BorderRadius.circular(5)),
                        child: QrImage(
                          padding: EdgeInsets.all(0),
                          data: controller.addressController.text,
                          version: QrVersions.auto,
                          size: percentWidth(context, 30),
                          gapless: true,
                          foregroundColor: brokenWhiteColor,
                        ),
                      ),
                      SizedBox(width: percentWidth(context, 5)),
                      Column(
                        children: [
                          Text('Your QR', style: textTitle.copyWith(fontSize: 25)),
                          Text('Scan for faster\ntransactions', style: stylePrimary),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: percentHeight(context, 5)),
                  XauTextField(
                    readOnly: true,
                    useObscure: false,
                    controller: controller.addressController,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: controller.addressController.text));
                        successSnackbar('Copied', controller.addressController.text);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.copy,
                            color: primaryColor,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: percentHeight(context, 5)),
                  RaisedButton(
                    onPressed: () => Get.back(),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    color: primaryColor,
                    child: Center(
                      child: Text(
                        'Done',
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
}
