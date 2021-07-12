import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/intl_formats.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/widget/shimmer_card.dart';
import 'package:flutter_xaurius/app/widget/shimmer_text.dart';
import 'package:flutter_xaurius/app/widget/xau_container.dart';

import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../controllers/top_up_detail_controller.dart';

class TopUpDetailView extends GetView<TopUpDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice #' + controller.invoiceId.toString()),
      ),
      body: Obx(() {
        return SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    controller.isLoading.value
                        ? Expanded(
                            child: ShimmerText(
                              height: percentHeight(context, 3),
                            ),
                          )
                        : Text(
                            'Invoice #' + controller.responseDetailInvoices.value.data.invoice.id.toString(),
                            style: textTitle.copyWith(color: primaryColor, fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                    SizedBox(width: percentWidth(context, 5)),
                    controller.isLoading.value
                        ? Expanded(
                            child: ShimmerText(
                              height: percentHeight(context, 3),
                            ),
                          )
                        : Text(
                            controller.responseDetailInvoices.value.data.invoice.invoiceBayar ? 'done' : 'pending',
                            style: textTitle.copyWith(color: primaryColor, fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: controller.isLoading.value
                          ? ShimmerText(
                              height: percentHeight(context, 3),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Billed to',
                                  style: textTitle,
                                ),
                                Text(
                                  controller.responseDetailInvoices.value.data.invoice.invoiceVa.customerData.custName,
                                  style: textTitle.copyWith(color: primaryColor, fontSize: 16, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                    ),
                    SizedBox(width: percentWidth(context, 5)),
                    controller.isLoading.value
                        ? Expanded(
                            child: ShimmerText(
                              height: percentHeight(context, 3),
                            ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Total IDR',
                                style: textTitle,
                              ),
                              Text(
                                formatCurrency(controller.responseDetailInvoices.value.data.invoice.invoiceTotal),
                                style: textTitle.copyWith(color: primaryColor, fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ],
                          )
                  ],
                ),
                SizedBox(height: 20),
                controller.isLoading.value
                    ? ShimmerCard(
                        height: percentHeight(context, 35),
                      )
                    : XauriusContainer(
                        child: Column(
                          children: [
                            Text(
                              'payment'.tr,
                              style: textTitle,
                            ),
                            Divider(thickness: 2, height: 30, color: primaryColor),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'bank_name'.tr,
                                  style: textTitle,
                                ),
                                SizedBox(width: percentWidth(context, 5)),
                                Text(controller.responseDetailInvoices.value.data.invoice.invoiceVa.bankName),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'bank_num_name'.tr,
                                    style: textTitle,
                                  ),
                                ),
                                SizedBox(width: percentWidth(context, 5)),
                                SelectableText(
                                  controller.responseDetailInvoices.value.data.invoice.invoiceVa.vaNumber,
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'bank_acc_name'.tr,
                                    style: textTitle,
                                  ),
                                ),
                                SizedBox(width: percentWidth(context, 5)),
                                Text(
                                  controller.responseDetailInvoices.value.data.invoice.invoiceVa.customerData.custName,
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Total',
                                    style: textTitle,
                                  ),
                                ),
                                SizedBox(width: percentWidth(context, 5)),
                                Text(
                                  customCurrency(controller.responseDetailInvoices.value.data.invoice.invoiceTotal) + ' IDR',
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'pay_before'.tr,
                                    style: textTitle,
                                  ),
                                ),
                                SizedBox(width: percentWidth(context, 5)),
                                Text(
                                  controller.formattedDate.value.toString(),
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                // SizedBox(height: 20),
                // XauriusContainer(
                //   child: Column(
                //     children: [
                //       Text(
                //         'Cara Pembayaran',
                //         style: textTitle,
                //       ),
                //       // SizedBox(height: 20),
                //       Divider(thickness: 2, height: 30, color: primaryColor),
                //       ExpansionTile(
                //         title: Text("ATM Bersama"),
                //         // tilePadding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5)),
                //         // childrenPadding: EdgeInsets.zero,
                //         collapsedIconColor: brokenWhiteColor,
                //         collapsedTextColor: brokenWhiteColor,
                //         collapsedBackgroundColor: Colors.transparent,
                //         iconColor: primaryColor,
                //         textColor: primaryColor,
                //         children: [
                //           Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: Container(
                //               width: percentWidth(context, 100),
                //               padding: EdgeInsets.all(percentWidth(context, 5)),
                //               decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(10)),
                //               child: Column(children: [Text('Lorem ipsum dolor sit amet, ')]),
                //             ),
                //           )
                //         ],
                //       ),
                //       ExpansionTile(
                //         title: Text("Internet Banking"),
                //         // tilePadding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5)),
                //         // childrenPadding: EdgeInsets.zero,
                //         collapsedIconColor: brokenWhiteColor,
                //         collapsedTextColor: brokenWhiteColor,
                //         collapsedBackgroundColor: backgroundPanelColor,
                //         iconColor: primaryColor,
                //         textColor: primaryColor,
                //         children: [
                //           Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: Container(
                //               width: percentWidth(context, 100),
                //               padding: EdgeInsets.all(percentWidth(context, 5)),
                //               decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(10)),
                //               child: Column(children: [Text('Lorem ipsum dolor sit amet, ')]),
                //             ),
                //           )
                //         ],
                //       ),
                //       ExpansionTile(
                //         title: Text("M-Banking"),
                //         // tilePadding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5)),
                //         // childrenPadding: EdgeInsets.zero,
                //         collapsedIconColor: brokenWhiteColor,
                //         collapsedTextColor: brokenWhiteColor,
                //         collapsedBackgroundColor: backgroundPanelColor,
                //         iconColor: primaryColor,
                //         textColor: primaryColor,
                //         children: [
                //           Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: Container(
                //               width: percentWidth(context, 100),
                //               padding: EdgeInsets.all(percentWidth(context, 5)),
                //               decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(10)),
                //               child: Column(children: [Text('Lorem ipsum dolor sit amet, ')]),
                //             ),
                //           )
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(height: 20),
                Obx(() {
                  if (controller.isLoading.value) {
                    return ShimmerText(
                      height: percentHeight(context, 5),
                    );
                  }
                  if (controller.isLoadingForm.value) {
                    return JumpingDotsProgressIndicator(
                      color: primaryColor,
                      fontSize: 40,
                    );
                  }
                  if (controller.responseDetailInvoices.value.data.invoice.invoiceBayar) {
                    return Container();
                  }
                  return RaisedButton(
                    onPressed: () {
                      Get.focusScope.unfocus();
                      controller.madePayment();
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    color: primaryColor,
                    child: Container(
                      width: percentWidth(context, 100),
                      child: Center(
                        child: Text(
                          'made_payment_btn'.tr,
                          style: buttonStyle,
                        ),
                      ),
                    ),
                  );
                }),
                SizedBox(height: 10),
                controller.isLoading.value
                    ? ShimmerText(
                        height: percentHeight(context, 5),
                      )
                    : RaisedButton(
                        onPressed: () async {
                          // Get.toNamed(Routes.MENU);
                          Get.back();
                          Get.back();
                          Get.back();
                        },
                        padding: EdgeInsets.symmetric(vertical: percentHeight(context, 1.9), horizontal: percentWidth(context, 5)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(percentWidth(context, 3))),
                        color: backgroundPanelColor,
                        child: Container(
                          width: percentWidth(context, 100),
                          child: Center(
                            child: Text(
                              'back_dashboard'.tr,
                              style: buttonStyle.copyWith(color: brokenWhiteColor),
                            ),
                          ),
                        ),
                      ),
                SizedBox(height: 10),
              ],
            ),
          ),
        );
      }),
    );
  }
}
