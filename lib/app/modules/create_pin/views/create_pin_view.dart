import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/helpers/validator.dart';
import 'package:flutter_xaurius/app/modules/create_pin/controllers/create_pin_controller.dart';

import 'package:get/get.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:progress_indicators/progress_indicators.dart';

class CreatePinView extends GetView<CreatePinController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Buat Pin',
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Sekarang buat pin kamu dengan memasukkan 6 digit unik yang mudah diingat', style: stylePrimary),
                    SizedBox(height: 20),
                    PinInputTextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        controller.pin = value;
                      },
                      onSaved: (value) {
                        controller.pin = value;
                      },
                      controller: controller.pinController,
                      validator: (value) {
                        return validatePin(value);
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
                        textStyle: TextStyle(color: textWhiteColor, fontWeight: FontWeight.w400, fontStyle: FontStyle.normal, fontSize: 20.0),
                        colorBuilder: PinListenColorBuilder(primaryColor, textWhiteColor),
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
                            child: Text('Lanjutkan', style: buttonStyle),
                          ),
                          onPressed: () {
                            controller.checkPin(Get.arguments['email'], Get.arguments['code']);
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
