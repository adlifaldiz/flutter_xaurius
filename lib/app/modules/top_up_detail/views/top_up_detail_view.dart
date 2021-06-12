import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
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
        if (controller.isLoading.value) {
          return Center(
            child: JumpingDotsProgressIndicator(
              color: primaryColor,
              fontSize: 40,
            ),
          );
        }
        return SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  'Invoice #' + controller.responseDetailInvoices.value.data.invoice.id.toString(),
                  style: textTitle.copyWith(color: primaryColor, fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
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
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Total IDR',
                          style: textTitle,
                        ),
                        Text(
                          'Rp.' + controller.responseDetailInvoices.value.data.invoice.invoiceTotal + '0',
                          style: textTitle.copyWith(color: primaryColor, fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
                XauriusContainer(
                  child: Column(
                    children: [
                      Text(
                        'Informasi Pembayaran',
                        style: textTitle,
                      ),

                      Divider(thickness: 2, height: 30, color: primaryColor),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       'Nama Bank',
                      //       style: textTitle,
                      //     ),
                      //     Text(controller.responseDetailInvoice.value.data.buy.buyAddress),
                      //   ],
                      // ),
                      // SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nomor Akun',
                            style: textTitle,
                          ),
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
                          Text(
                            'Nama Akun',
                            style: textTitle,
                          ),
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
                          Text(
                            'Total',
                            style: textTitle,
                          ),
                          Text(
                            controller.responseDetailInvoices.value.data.invoice.invoiceTotal,
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Bayar sebelum',
                            style: textTitle,
                          ),
                          Text(
                            controller.formattedDate.value.toString(),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                XauriusContainer(
                  child: Column(
                    children: [
                      Text(
                        'Cara Pembayaran',
                        style: textTitle,
                      ),
                      // SizedBox(height: 20),
                      Divider(thickness: 2, height: 30, color: primaryColor),
                      ExpansionTile(
                        title: Text("ATM Bersama"),
                        // tilePadding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5)),
                        // childrenPadding: EdgeInsets.zero,
                        collapsedIconColor: brokenWhiteColor,
                        collapsedTextColor: brokenWhiteColor,
                        collapsedBackgroundColor: Colors.transparent,
                        iconColor: primaryColor,
                        textColor: primaryColor,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: percentWidth(context, 100),
                              padding: EdgeInsets.all(percentWidth(context, 5)),
                              decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(10)),
                              child: Column(children: [Text('Lorem ipsum dolor sit amet, ')]),
                            ),
                          )
                        ],
                      ),
                      ExpansionTile(
                        title: Text("Internet Banking"),
                        // tilePadding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5)),
                        // childrenPadding: EdgeInsets.zero,
                        collapsedIconColor: brokenWhiteColor,
                        collapsedTextColor: brokenWhiteColor,
                        collapsedBackgroundColor: backgroundPanelColor,
                        iconColor: primaryColor,
                        textColor: primaryColor,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: percentWidth(context, 100),
                              padding: EdgeInsets.all(percentWidth(context, 5)),
                              decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(10)),
                              child: Column(children: [Text('Lorem ipsum dolor sit amet, ')]),
                            ),
                          )
                        ],
                      ),
                      ExpansionTile(
                        title: Text("M-Banking"),
                        // tilePadding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5)),
                        // childrenPadding: EdgeInsets.zero,
                        collapsedIconColor: brokenWhiteColor,
                        collapsedTextColor: brokenWhiteColor,
                        collapsedBackgroundColor: backgroundPanelColor,
                        iconColor: primaryColor,
                        textColor: primaryColor,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: percentWidth(context, 100),
                              padding: EdgeInsets.all(percentWidth(context, 5)),
                              decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(10)),
                              child: Column(children: [Text('Lorem ipsum dolor sit amet, ')]),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Obx(() {
                  if (controller.isLoadingForm.value) {
                    return JumpingDotsProgressIndicator(
                      color: primaryColor,
                      fontSize: 40,
                    );
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
                          'Saya sudah bayar',
                          style: buttonStyle,
                        ),
                      ),
                    ),
                  );
                }),
                SizedBox(height: 20),
              ],
            ),
          ),
        );
      }),
    );
  }
}
