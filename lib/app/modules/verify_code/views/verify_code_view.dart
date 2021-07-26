import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/helpers/validator.dart';
import 'package:flutter_xaurius/app/modules/tnc/views/tnc_view.dart';
import 'package:flutter_xaurius/app/modules/verify_code/controllers/verify_code_controller.dart';
import 'package:flutter_xaurius/app/widget/xau_tooltip.dart';
import 'package:flutter_xaurius/app/widget/xaurius_button.dart';

import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:progress_indicators/progress_indicators.dart';

class VerifyCodeView extends GetView<VerifyCodeController> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var mode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'verif_app_bar'.tr,
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
              width: Get.width,
              height: Get.height,
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
                autovalidateMode: mode,
                key: formKey,
                child: Column(
                  children: [
                    Text(
                      // 'Silahkan masukkan 6 digit kode verifikasi yang kami kirim ke alamat email: ${controller.email}',
                      'verif_ex'.tr + controller.email,
                      style: TextStyle(color: textWhiteColor),
                    ),
                    SizedBox(height: 20),
                    PinInputTextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) => controller.code = value,
                      validator: validateCode,
                      pinLength: 6,
                      enabled: true,
                      cursor: Cursor(
                        enabled: true,
                        color: textWhiteColor,
                      ),
                      decoration: UnderlineDecoration(

                          // bgColorBuilder: PinListenColorBuilder(Colors.white, Colors.white),
                          // strokeColorBuilder: PinListenColorBuilder(primaryColor, textWhiteColor),
                          // strokeWidth: 2,

                          errorTextStyle: TextStyle(
                            color: redColor,
                            height: 0,
                          ),
                          // obscureStyle: ObscureStyle(isTextObscure: true, obscureText: '*'),
                          textStyle: TextStyle(
                              color: textWhiteColor,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 20.0),
                          colorBuilder: PinListenColorBuilder(
                              primaryColor, textWhiteColor)),
                    ),
                    SizedBox(
                      height: (percentHeight(context, 5)),
                    ),
                    Obx(() {
                      if (controller.isLoadingOTP.value) {
                        return JumpingDotsProgressIndicator(
                          color: primaryColor,
                          fontSize: 40,
                        );
                      }
                      return GestureDetector(
                        onTap: !controller.isStart.value
                            ? () => controller.sendOTP()
                            : () {},
                        child: Text(controller.isStart.value &&
                                !controller.isLoadingOTP.value
                            ? 'Wait ${controller.start.value} sec'
                            : 'Re_verif'.tr),
                      );
                    }),
                    Spacer(),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          XauToolTip(
                            show: controller.showToolTip.value,
                            text: 'regis_agree_err'.tr,
                            child: Checkbox(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1)),
                              checkColor: textWhiteColor,
                              activeColor: primaryColor,
                              value: controller.isAgree.value,
                              onChanged: (value) {
                                return controller.onAgreeChange(value);
                              },
                            ),
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'regis_agree'.tr,
                              style: stylePrimary,
                              children: [
                                TextSpan(
                                  text: 'setting_terms'.tr,
                                  style: stylePrimary.copyWith(
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => _showTnc(context),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
                        text: 'next_btn'.tr,
                        onpressed: () {
                          Get.focusScope.unfocus();
                          final isValid = formKey.currentState.validate();
                          if (!isValid) {
                            mode = AutovalidateMode.onUserInteraction;
                            return;
                          }
                          controller.timer.cancel();
                          controller.start(60);
                          controller.isStart(false);
                          formKey.currentState.save();
                          controller.verifyCode();
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
                      //       child: Text('next_btn'.tr, style: buttonStyle),
                      //     ),
                      //     onPressed: () {
                      //       FocusScope.of(context).unfocus();
                      //       final isValid = formKey.currentState.validate();
                      //       if (!isValid) {
                      //         mode = AutovalidateMode.onUserInteraction;
                      //         return;
                      //       }
                      //       formKey.currentState.save();
                      //       controller.verifyCode();
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

  _showTnc(BuildContext context) {
    showMaterialModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      context: context,
      builder: (context) => TncView(),
    );
  }
}
