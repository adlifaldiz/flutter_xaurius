import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/helpers/validator.dart';
import 'package:flutter_xaurius/app/widget/xau_text_field.dart';
import 'package:flutter_xaurius/app/widget/xaurius_button.dart';

import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../controllers/bank_controller.dart';

class BankView extends GetView<BankController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var mode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bank_account'.tr),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 2)),
          child: Form(
            key: _formKey,
            autovalidateMode: mode,
            child: Column(
              children: [
                XauTextField(
                  useObscure: false,
                  validator: validateNameBank,
                  controller: controller.namaBankControl == null ? '' : controller.namaBankControl,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  labelText: 'bank_name'.tr,
                ),
                SizedBox(height: 10),
                XauTextField(
                  useObscure: false,
                  validator: validateNameAccBank,
                  controller: controller.namaAkunControl == null ? '' : controller.namaAkunControl,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  labelText: 'bank_acc_name'.tr,
                ),
                SizedBox(height: 10),
                XauTextField(
                  useObscure: false,
                  validator: validateNumAccBank,
                  controller: controller.nomorAkunControl,
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  labelText: 'bank_num_name'.tr,
                ),
                SizedBox(height: 30),
                Obx(() {
                  if (controller.isLoading.value) {
                    return Center(
                      child: JumpingDotsProgressIndicator(
                        numberOfDots: 3,
                        fontSize: 40,
                        color: primaryColor,
                      ),
                    );
                  }
                  return XauriusButton(
                    pressAble: true,
                    text: 'save_btn'.tr,
                    onpressed: () {
                      Get.focusScope.unfocus();
                      final isValid = _formKey.currentState.validate();
                      if (!isValid) {
                        mode = AutovalidateMode.onUserInteraction;
                        return;
                      }
                      _formKey.currentState.save();
                      controller.updateBank();
                    },
                  );
                  // return RaisedButton(
                  //   onPressed: () {
                  //     final isValid = _formKey.currentState.validate();
                  //     if (!isValid) {
                  //       mode = AutovalidateMode.onUserInteraction;
                  //       return;
                  //     }
                  //     _formKey.currentState.save();
                  //     controller.updateBank();
                  //   },
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10)),
                  //   color: primaryColor,
                  //   child: Center(
                  //     child: Text(
                  //       'save_btn'.tr,
                  //       style: buttonStyle,
                  //     ),
                  //   ),
                  // );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
