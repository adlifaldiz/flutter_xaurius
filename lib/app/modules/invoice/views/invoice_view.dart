import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';

import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../controllers/invoice_controller.dart';

class InvoiceView extends GetView<InvoiceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Get.arguments == null ? 'Invoice' : 'Invoice #${Get.arguments}',
        ),
      ),
      body: Obx(() {
        if (controller.isLoadingForm.value) {
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
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
