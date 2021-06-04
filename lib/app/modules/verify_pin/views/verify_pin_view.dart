import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/helpers/validator.dart';
import 'package:flutter_xaurius/app/modules/verify_pin/controllers/verify_pin_controller.dart';

import 'package:get/get.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:progress_indicators/progress_indicators.dart';

class VerifyPinView extends GetView<VerifyPinController> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Konfirmasi Pin',
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
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Sekarang masukkan lagi pin yang sudah kamu buat',
                        style: stylePrimary),
                    SizedBox(height: 20),
                    PinInputTextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) => controller.pinConfirmation = value,
                      validator: (value) {
                        return validateVerifPin(value, Get.arguments['pin']);
                      },
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

                      return Container(
                        width: double.infinity,
                        child: RaisedButton(
                          color: accentColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text('Selesai', style: buttonStyle),
                          ),
                          onPressed: () {
                            final isValid = formKey.currentState.validate();
                            if (!isValid) {
                              return;
                            }
                            formKey.currentState.save();
                            controller.verifyPin(Get.arguments['email'],
                                Get.arguments['code'], Get.arguments['pin']);
                          },
                        ),
                      );
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
