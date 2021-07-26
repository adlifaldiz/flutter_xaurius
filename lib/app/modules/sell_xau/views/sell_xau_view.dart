import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/intl_formats.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/widget/xau_container.dart';
import 'package:flutter_xaurius/app/widget/xau_text_field.dart';

import 'package:get/get.dart';

import '../controllers/sell_xau_controller.dart';

class SellXauView extends GetView<SellXauController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: AppBar(
            title: Text('sell_title'.tr),
          ),
          body: Obx(() {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: percentWidth(context, 5),
                      vertical: percentHeight(context, 3)),
                  child: Column(
                    children: [
                      XauriusContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'XAU/IDR',
                              style: stylePrimary.copyWith(
                                  color: primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(width: 10),
                            Text(
                              customCurrency(controller
                                      .dash.goldPrice.value.chartpriceSell) ??
                                  '000.000',
                              style: stylePrimary.copyWith(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      // SizedBox(height: 20),
                      // XauTextField(
                      //   useObscure: false,
                      //   readOnly: true,
                      //   labelText: 'Harga Unit (IDR/XAU)',
                      // ),
                      SizedBox(height: 10),
                      XauTextField(
                        useObscure: false,
                        labelText: 'Kuantitas (XAU)',
                        controller: controller.qtyController,
                        onChanged: (val) {
                          controller.countLive(val);
                        },
                      ),
                      SizedBox(height: 10),
                      XauTextField(
                        useObscure: false,
                        labelText: 'Total (IDR) *min 50.000.00',
                        controller: controller.totalController,
                        // onChanged: (val) {},
                      ),
                      // SizedBox(height: 10),
                      // XauTextField(
                      //   useObscure: false,
                      //   labelText: 'Harga GAS (IDR)',
                      //   controller: null,
                      // ),
                      // SizedBox(height: 10),
                      // XauTextField(
                      //   useObscure: false,
                      //   labelText: 'Discount (0.5%)',
                      //   controller: null,
                      //   onChanged: (val) {},
                      // ),
                      SizedBox(height: 20),
                      XauriusContainer(
                        child: Column(
                          children: [
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text('Sub Total'),
                            //     Text('955.000 IDR'),
                            //   ],
                            // ),
                            // SizedBox(height: 10),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text('XAU'),
                            //     Text('1 XAU'),
                            //   ],
                            // ),
                            // Divider(
                            //   height: 20,
                            //   thickness: 2,
                            //   color: primaryColor.withOpacity(0.5),
                            // ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text('Total Pembyaran'),
                            //     Text('0 IDR'),
                            //   ],
                            // ),
                            //SizedBox(height: 30),
                            RaisedButton(
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              color: primaryColor,
                              child: Container(
                                width: percentWidth(context, 100),
                                child: Center(
                                    child: Text(
                                  'sell_now'.tr,
                                  style: buttonStyle,
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          })),
    );
  }
}
