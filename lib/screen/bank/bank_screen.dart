import 'package:flutter/material.dart';
import 'package:flutter_xaurius/controller/bank_controller.dart';
import 'package:flutter_xaurius/helper/screen_utils.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:flutter_xaurius/helper/validator.dart';
import 'package:flutter_xaurius/widget/xau_text_field.dart';
import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';

class BankScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BankController _bankController = Get.put(BankController());
    _bankController.onInit();

    return Scaffold(
      appBar: AppBar(
        title: Text('Bank'),
      ),
      body: Obx(() {
        if (_bankController.kycController.isLoading.value) {
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
              key: _bankController.bankKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  XauTextField(
                    useObscure: false,
                    validator: validateNameBank,
                    controller: _bankController.namaBankControl == null ? '' : _bankController.namaBankControl,
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    labelText: 'Nama Bank',
                  ),
                  SizedBox(height: 10),
                  XauTextField(
                    useObscure: false,
                    validator: validateNameAccBank,
                    controller: _bankController.namaAkunControl == null ? '' : _bankController.namaAkunControl,
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    labelText: 'Nama Akun Bank',
                  ),
                  SizedBox(height: 10),
                  XauTextField(
                    useObscure: false,
                    validator: validateNumAccBank,
                    controller: _bankController.nomorAkunControl,
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    labelText: 'Nomor Akun Bank',
                  ),
                  SizedBox(height: 30),
                  Obx(() {
                    if (_bankController.isLoadingForm.value) {
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
                        _bankController.checkPostBank();
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
