import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/widget/xau_container.dart';

import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../controllers/invoice_controller.dart';

class InvoiceView extends GetView<InvoiceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Get.arguments == null ? 'Invoice' : 'Invoice #${controller.invoiceNumber}',
        ),
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
            padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 3)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Invoice #' + controller.responseDetailInvoice.value.data.invoice.id.toString(),
                  style: textTitle.copyWith(color: primaryColor, fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Billed to',
                          style: textTitle,
                        ),
                        Text(
                          'Test',
                          style: textTitle.copyWith(color: primaryColor, fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Total IDR',
                          style: textTitle,
                        ),
                        Text(
                          'Rp.' + controller.responseDetailInvoice.value.data.invoice.invoiceTotal + '0',
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
                          Text(controller.responseDetailInvoice.value.data.buy.buyUnitPrice),
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
                          Text(controller.responseDetailInvoice.value.data.buy.buyNetwork),
                        ],
                      ),
                      SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Kuantitas',
                            style: textTitle,
                          ),
                          Text(controller.responseDetailInvoice.value.data.buy.buyQty + ' XAU'),
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
                          Text(controller.responseDetailInvoice.value.data.buy.buyAmount + ' IDR'),
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
                        'Descrption',
                        style: textTitle,
                      ),
                      // SizedBox(height: 20),
                      Divider(thickness: 2, height: 30, color: primaryColor),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Discount',
                            style: textTitle,
                          ),
                          Text(controller.responseDetailInvoice.value.data.invoice.invoiceDiscount + ' IDR'),
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
                          Text(controller.responseDetailInvoice.value.data.invoice.invoiceAdmfee + ' IDR'),
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
                          Text(controller.responseDetailInvoice.value.data.invoice.invoiceGas + ' IDR'),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Voucher',
                            style: textTitle,
                          ),
                          Text(controller.responseDetailInvoice.value.data.invoice.invoiceVoucherValue + ' IDR'),
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
                          Text(controller.responseDetailInvoice.value.data.invoice.invoiceTotal.toString() + ' IDR'),
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
                        'Informasi Pembayaran',
                        style: textTitle,
                      ),
                      // SizedBox(height: 20),
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
                          Text(controller.responseDetailInvoice.value.data.invoice.invoiceVa.vaNumber),
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
                          Text(controller.responseDetailInvoice.value.data.invoice.invoiceVa.customerData.custName),
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
                          Text(controller.responseDetailInvoice.value.data.invoice.invoiceTotal),
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
                          Text(controller.responseDetailInvoice.value.data.invoice.invoiceVa.vaExpiryDate.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                RaisedButton(
                  onPressed: () {
                    Get.focusScope.unfocus();
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
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
