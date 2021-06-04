import 'package:flutter/material.dart';
import 'package:flutter_xaurius/helper/screen_utils.dart';
import 'package:flutter_xaurius/helper/theme.dart';

import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../controllers/invoice_xau_controller.dart';

class InvoiceXauView extends GetView<InvoiceXauController> {
  final int invoiceId;

  const InvoiceXauView({Key key, this.invoiceId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    InvoiceXauController _invoiceController = Get.put(InvoiceXauController());
    _invoiceController.getDetailInvoice(invoiceId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          invoiceId == null ? 'Invoice' : 'Invoice #$invoiceId',
        ),
      ),
      body: Obx(() {
        if (_invoiceController.isLoadingForm.value) {
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
                  'Invoice #' + _invoiceController.responseDetailInvoice.value.data.invoice.id.toString(),
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
                          'Rp.' + _invoiceController.responseDetailInvoice.value.data.invoice.invoiceTotal + '0',
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
