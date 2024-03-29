import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:flutter_xaurius/app/widget/xaurius_button.dart';
import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';

import 'package:flutter_xaurius/app/helpers/intl_formats.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/widget/shimmer_card.dart';
import 'package:flutter_xaurius/app/widget/shimmer_text.dart';
import 'package:flutter_xaurius/app/widget/xau_container.dart';

import '../controllers/invoice_controller.dart';

class InvoiceView extends GetView<InvoiceController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AbsorbPointer(
        absorbing: controller.isLoadingForm.value,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              Get.arguments == null ? 'Invoice' : 'Invoice #${controller.invoiceNumber}',
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 3)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      controller.isLoading.value
                          ? Expanded(
                              child: ShimmerText(
                                height: percentHeight(context, 5),
                              ),
                            )
                          : Text(
                              'Invoice #' + controller.responseDetailInvoice.value.data.invoice.id.toString(),
                              style: textTitle.copyWith(color: primaryColor, fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                      SizedBox(width: percentWidth(context, 5)),
                      controller.isLoading.value
                          ? Expanded(
                              child: ShimmerText(
                                height: percentHeight(context, 5),
                              ),
                            )
                          : Text(
                              controller.responseDetailInvoice.value.data.buy.buyStatus,
                              style: textTitle.copyWith(color: primaryColor, fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                    ],
                  ),
                  SizedBox(height: percentHeight(context, 3)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      controller.isLoading.value
                          ? Expanded(child: ShimmerText())
                          : Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'invoice_billed'.tr,
                                    style: textTitle,
                                  ),
                                  Text(
                                    controller.responseDetailInvoice.value.data.invoice.invoiceVa.customerData.custName,
                                    style: textTitle.copyWith(
                                        color: primaryColor, fontSize: 16, fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                      SizedBox(width: percentWidth(context, 5)),
                      controller.isLoading.value
                          ? Expanded(child: ShimmerText())
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Total IDR',
                                  style: textTitle,
                                ),
                                Text(
                                  formatCurrency(controller.responseDetailInvoice.value.data.invoice.invoiceTotal),
                                  style: textTitle.copyWith(
                                      color: primaryColor, fontSize: 16, fontWeight: FontWeight.w600),
                                ),
                              ],
                            )
                    ],
                  ),
                  SizedBox(height: percentHeight(context, 5)),
                  controller.isLoading.value
                      ? ShimmerCard(
                          height: percentHeight(context, 25),
                        )
                      : XauriusContainer(
                          child: Column(
                            children: [
                              Text(
                                'Unit',
                                style: textTitle,
                              ),
                              // SizedBox(height: percentHeight(context, 5)),
                              Divider(thickness: 2, height: 30, color: primaryColor),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'unit_price_buy'.tr,
                                      style: textTitle,
                                    ),
                                  ),
                                  SizedBox(width: percentWidth(context, 5)),
                                  Text(
                                    customCurrency(controller.responseDetailInvoice.value.data.buy.buyUnitPrice) +
                                        ' IDR',
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              ),
                              SizedBox(height: percentHeight(context, 2)),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Expanded(
                              //       child: Text(
                              //         'network'.tr,
                              //         style: textTitle,
                              //       ),
                              //     ),
                              //     SizedBox(width: percentWidth(context, 5)),
                              //     Text(
                              //       controller.responseDetailInvoice.value.data.buy.buyNetwork,
                              //       textAlign: TextAlign.end,
                              //     ),
                              //   ],
                              // ),
                              // SizedBox(height: percentHeight(context, 5)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'quantity_xau'.tr,
                                      style: textTitle,
                                    ),
                                  ),
                                  SizedBox(width: percentWidth(context, 5)),
                                  Text(
                                    controller.responseDetailInvoice.value.data.buy.buyQty + ' XAU',
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              ),
                              Divider(thickness: 2, height: 30, color: primaryColor),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'sub_total'.tr,
                                    style: textTitle,
                                  ),
                                  Text(
                                    customCurrency(controller.responseDetailInvoice.value.data.buy.buyAmount) + ' IDR',
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                  SizedBox(height: percentHeight(context, 2)),
                  controller.isLoading.value
                      ? ShimmerCard(
                          height: percentHeight(context, 35),
                        )
                      : XauriusContainer(
                          child: Column(
                            children: [
                              Text(
                                'invoice_desc'.tr,
                                style: textTitle,
                              ),
                              // SizedBox(height: percentHeight(context, 5)),
                              Divider(thickness: 2, height: 30, color: primaryColor),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'discount'.tr,
                                    style: textTitle,
                                  ),
                                  Expanded(
                                      child: Text(
                                    customCurrency(
                                            controller.responseDetailInvoice.value.data.invoice.invoiceDiscount) +
                                        ' IDR',
                                    textAlign: TextAlign.end,
                                  )),
                                ],
                              ),
                              SizedBox(height: percentHeight(context, 2)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'admin_fee'.tr,
                                    style: textTitle,
                                  ),
                                  Expanded(
                                      child: Text(
                                    customCurrency(controller.responseDetailInvoice.value.data.invoice.invoiceAdmfee) +
                                        ' IDR',
                                    textAlign: TextAlign.end,
                                  )),
                                ],
                              ),
                              SizedBox(height: percentHeight(context, 2)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'gas_fee'.tr,
                                    style: textTitle,
                                  ),
                                  Text(
                                    customCurrency(controller.responseDetailInvoice.value.data.invoice.invoiceGas) +
                                        ' IDR',
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              ),
                              SizedBox(height: percentHeight(context, 2)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'invoice_voucher'.tr,
                                    style: textTitle,
                                  ),
                                  Text(
                                    customCurrency(
                                            controller.responseDetailInvoice.value.data.invoice.invoiceVoucherValue) +
                                        ' IDR',
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              ),
                              Divider(thickness: 2, height: 30, color: primaryColor),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total',
                                    style: textTitle,
                                  ),
                                  Text(
                                    customCurrency(controller.responseDetailInvoice.value.data.invoice.invoiceTotal) +
                                        ' IDR',
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                  // SizedBox(height: percentHeight(context, 5)),
                  // XauriusContainer(
                  //   child: Column(
                  //     children: [
                  //       Text(
                  //         'payment'.tr,
                  //         style: textTitle,
                  //       ),
                  //       // SizedBox(height: percentHeight(context, 5)),
                  //       Divider(thickness: 2, height: 30, color: primaryColor),

                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text(
                  //             controller.responseDetailInvoice.value.data.invoice.invoiceVa.vaNumber == '000' ? 'invoice_method'.tr : 'bank_name'.tr,
                  //             style: textTitle,
                  //           ),
                  //           Text(controller.responseDetailInvoice.value.data.invoice.invoiceVa.bankName),
                  //         ],
                  //       ),
                  //       SizedBox(height: percentHeight(context, 5)),
                  //       controller.responseDetailInvoice.value.data.invoice.invoiceVa.vaNumber == '000'
                  //           ? Container()
                  //           : Row(
                  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 Text(
                  //                   'bank_num_name'.tr,
                  //                   style: textTitle,
                  //                 ),
                  //                 SelectableText(
                  //                   controller.responseDetailInvoice.value.data.invoice.invoiceVa.vaNumber,
                  //                   textAlign: TextAlign.end,
                  //                 ),
                  //               ],
                  //             ),
                  //       controller.responseDetailInvoice.value.data.invoice.invoiceVa.vaNumber == '000' ? SizedBox() : SizedBox(height: percentHeight(context, 5)),
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text(
                  //             'bank_acc_name'.tr,
                  //             style: textTitle,
                  //           ),
                  //           Expanded(
                  //             child: Text(
                  //               controller.responseDetailInvoice.value.data.invoice.invoiceVa.customerData.custName,
                  //               textAlign: TextAlign.end,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //       SizedBox(height: percentHeight(context, 5)),
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text(
                  //             'Total',
                  //             style: textTitle,
                  //           ),
                  //           Text(
                  //             customCurrency(controller.responseDetailInvoice.value.data.invoice.invoiceTotal) + ' IDR',
                  //             textAlign: TextAlign.end,
                  //           ),
                  //         ],
                  //       ),
                  //       SizedBox(height: percentHeight(context, 5)),
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text(
                  //             'pay_before'.tr,
                  //             style: textTitle,
                  //           ),
                  //           Text(
                  //             controller.formattedDate.value.toString(),
                  //             textAlign: TextAlign.end,
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: percentHeight(context, 5)),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return ShimmerText(height: percentHeight(context, 5));
                    }
                    if (controller.isLoadingForm.value) {
                      return JumpingDotsProgressIndicator(
                        color: primaryColor,
                        fontSize: 40,
                      );
                    }

                    if (controller.responseDetailInvoice.value.data.buy.buyStatus == 'expire' ||
                        controller.responseDetailInvoice.value.data.buy.buyStatus == 'done') {
                      return Container();
                    }
                    return XauriusButton(
                      pressAble: true,
                      text: controller.responseDetailInvoice.value.data.invoice.invoiceVa.vaNumber == '000'
                          ? 'invoice_confirm'.tr
                          : 'made_payment_btn'.tr,
                      onpressed: () {
                        Get.focusScope.unfocus();
                        controller.madePayment();
                      },
                    );
                    // return RaisedButton(
                    //   onPressed: () {
                    //     Get.focusScope.unfocus();
                    //     controller.madePayment();
                    //   },
                    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    //   color: primaryColor,
                    //   child: Container(
                    //     width: percentWidth(context, 100),
                    //     child: Center(
                    //       child: Text(
                    //         controller.responseDetailInvoice.value.data.invoice.invoiceVa.vaNumber == '000'
                    //             ? 'invoice_confirm'.tr
                    //             : 'made_payment_btn'.tr,
                    //         style: buttonStyle,
                    //       ),
                    //     ),
                    //   ),
                    // );
                  }),
                  SizedBox(height: percentHeight(context, 2)),
                  !controller.fromBuy.value
                      ? Container()
                      : controller.isLoading.value
                          ? ShimmerText(
                              height: percentHeight(context, 5),
                            )
                          : RaisedButton(
                              onPressed: () async {
                                Get.until((route) => Get.currentRoute == Routes.MENU);
                              },
                              padding: EdgeInsets.symmetric(
                                  vertical: percentHeight(context, 1.9), horizontal: percentWidth(context, 5)),
                              shape:
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(percentWidth(context, 3))),
                              color: controller.responseDetailInvoice.value.data.buy.buyStatus == 'done'
                                  ? primaryColor
                                  : backgroundPanelColor,
                              child: Container(
                                width: percentWidth(context, 100),
                                child: Center(
                                  child: Text(
                                    'back_dashboard'.tr,
                                    style: controller.responseDetailInvoice.value.data.buy.buyStatus == 'done'
                                        ? buttonStyle
                                        : buttonStyle.copyWith(color: brokenWhiteColor),
                                  ),
                                ),
                              ),
                            ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
