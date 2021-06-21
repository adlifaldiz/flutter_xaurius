import 'package:flutter/material.dart';
import 'package:flutter_xaurius/helper/screen_utils.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:flutter_xaurius/helper/validator.dart';
import 'package:flutter_xaurius/widget/xau_text_field.dart';

import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../controllers/bank_account_controller.dart';

class BankAccountView extends GetView<BankAccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank'),
      ),
      body: Obx(() {
        if (controller.kycController.isLoading.value) {
          return Center(
            child: JumpingDotsProgressIndicator(
              numberOfDots: 3,
              fontSize: 40,
              color: primaryColor,
            ),
          );
        }
        return SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 2)),
            child: Form(
              key: controller.bankKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  XauTextField(
                    useObscure: false,
                    validator: validateNameBank,
                    controller: controller.namaBankControl == null ? '' : controller.namaBankControl,
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    labelText: 'Nama Bank',
                  ),
                  SizedBox(height: 10),
                  XauTextField(
                    useObscure: false,
                    validator: validateNameAccBank,
                    controller: controller.namaAkunControl == null ? '' : controller.namaAkunControl,
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    labelText: 'Nama Akun Bank',
                  ),
                  SizedBox(height: 10),
                  XauTextField(
                    useObscure: false,
                    validator: validateNumAccBank,
                    controller: controller.nomorAkunControl,
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    labelText: 'Nomor Akun Bank',
                  ),
                  SizedBox(height: 30),
                  Obx(() {
                    if (controller.isLoadingForm.value) {
                      return Center(
                        child: JumpingDotsProgressIndicator(
                          numberOfDots: 3,
                          fontSize: 40,
                          color: primaryColor,
                        ),
                      );
                    }
                    return RaisedButton(
                      onPressed: () {
                        controller.checkPostBank();
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      color: primaryColor,
                      child: Center(
                        child: Text(
                          'Simpan',
                          style: buttonStyle,
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
