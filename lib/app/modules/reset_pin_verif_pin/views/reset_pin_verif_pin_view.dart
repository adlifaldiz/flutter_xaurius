import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/helpers/validator.dart';
import 'package:flutter_xaurius/app/widget/xaurius_button.dart';

import 'package:get/get.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../controllers/reset_pin_verif_pin_controller.dart';

class ResetPinVerifPinView extends GetView<ResetPinVerifPinController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'confirm_pin_app_bar'.tr,
          style: textAppbarStyleWhite,
        ),
        leading: BackButton(
          color: textWhiteColor,
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    width: MediaQuery.of(context).size.width / 2,
                    bottom: 0,
                    left: 0,
                    child: Image.asset(
                      'assets/images/mesh-left.png',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: controller.formKey,
                autovalidateMode: controller.mode,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('confirm_pin_ex'.tr, style: stylePrimary),
                    SizedBox(height: 20),
                    PinInputTextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) => controller.pinConfirmation = value,
                      // validator: (value) {
                      //   return validateVerifPin(value, controller.pin);
                      // },
                      pinLength: 6,
                      cursor: Cursor(
                        enabled: true,
                        color: textWhiteColor,
                      ),
                      decoration: UnderlineDecoration(
                        errorTextStyle: TextStyle(
                          color: redColor,
                          height: 0,
                        ),
                        obscureStyle: ObscureStyle(isTextObscure: true),
                        textStyle: TextStyle(
                            color: textWhiteColor,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 20.0),
                        colorBuilder:
                            PinListenColorBuilder(primaryColor, textWhiteColor),
                      ),
                    ),
                    Spacer(),
                    Obx(() {
                      if (controller.isLoading.value) {
                        return JumpingDotsProgressIndicator(
                          numberOfDots: 3,
                          fontSize: 40,
                          color: primaryColor,
                        );
                      }

                      return XauriusButton(
                        pressAble: true,
                        text: 'save_btn'.tr,
                        onpressed: () {
                          Get.focusScope.unfocus();
                          final isValid =
                              controller.formKey.currentState.validate();
                          if (!isValid) {
                            controller.mode =
                                AutovalidateMode.onUserInteraction;
                            return;
                          }
                          controller.formKey.currentState.save();
                          controller.verifyResetPin();
                        },
                      );
                      // return Container(
                      //   width: double.infinity,
                      //   child: RaisedButton(
                      //     color: accentColor,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //     child: Padding(
                      //       padding: const EdgeInsets.symmetric(vertical: 12),
                      //       child: Text('save_btn'.tr, style: buttonStyle),
                      //     ),
                      //     onPressed: () {
                      //       final isValid = formKey.currentState.validate();
                      //       if (!isValid) {
                      //         mode = AutovalidateMode.onUserInteraction;
                      //         return;
                      //       }
                      //       formKey.currentState.save();
                      //       controller.verifyPin();
                      //     },
                      //   ),
                      // );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
