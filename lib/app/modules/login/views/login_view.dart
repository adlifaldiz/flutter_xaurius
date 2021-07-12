import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/helpers/validator.dart';
import 'package:flutter_xaurius/app/widget/xau_text_field.dart';
import 'package:flutter_xaurius/app/widget/xaurius_button.dart';
import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: GestureDetector(
        onTap: () => Get.focusScope.unfocus(),
        child: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                // Container(
                //   width: double.infinity,
                //   height: double.infinity,
                //   child: Stack(
                //     children: [
                //       Positioned(
                //         width: MediaQuery.of(context).size.width / 2,
                //         top: 0,
                //         right: 0,
                //         child: Image.asset(
                //           'assets/images/mesh-right.png',
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/logo_ss.png',
                          width: 150,
                        ),
                        SizedBox(height: percentHeight(context, 3)),
                        Text(
                          'login_welcome'.tr,
                          style: Theme.of(context).textTheme.headline4.copyWith(
                                color: textWhiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        SizedBox(height: percentHeight(context, 3)),
                        Text(
                          'login_exp'.tr,
                          style: Theme.of(context).textTheme.subhead.copyWith(
                                color: brokenWhiteColor,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                        SizedBox(height: percentHeight(context, 5)),
                        Form(
                          key: controller.formKey,
                          autovalidateMode: controller.mode.value,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('login_email'.tr, style: styleLabel),
                              SizedBox(height: percentHeight(context, 1)),
                              XauTextField(
                                onSaved: (value) => controller.email = value,
                                validator: validateEmail,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                useObscure: false,
                                hintText: 'login_email'.tr,
                                prefixIcon: Icon(
                                  Icons.account_circle_rounded,
                                  color: primaryColor,
                                ),
                              ),
                              SizedBox(height: percentHeight(context, 2)),
                              Text('Pin', style: styleLabel),
                              SizedBox(height: percentHeight(context, 1)),
                              XauTextField(
                                onSaved: (value) => controller.pin = value,
                                validator: validatePin,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                maxLength: 6,
                                inputFormatters: [LengthLimitingTextInputFormatter(6)],
                                useObscure: true,
                                hintText: 'Pin',
                                prefixIcon: Icon(
                                  Icons.lock_outline_rounded,
                                  color: primaryColor,
                                ),
                              ),
                              SizedBox(height: percentHeight(context, 3)),
                              Container(
                                width: Get.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'login_no_account'.tr,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.subhead.copyWith(
                                            color: textWhiteColor,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                    GestureDetector(
                                      onTap: () => controller.router(),
                                      child: Text(
                                        'login_regis_btn'.tr,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context).textTheme.subhead.copyWith(
                                              color: accentColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: percentHeight(context, 3)),
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
                                  text: 'login_btn'.tr,
                                  onpressed: () {
                                    Get.focusScope.unfocus();
                                    final isValid = controller.formKey.currentState.validate();
                                    if (!isValid) {
                                      controller.mode.value = AutovalidateMode.onUserInteraction;
                                      return;
                                    }
                                    controller.formKey.currentState.save();
                                    controller.login();
                                  },
                                );
                                // return Container(
                                //   width: Get.width,
                                //   child: RaisedButton(
                                //     color: accentColor,
                                //     shape: RoundedRectangleBorder(
                                //       borderRadius: BorderRadius.circular(10),
                                //     ),
                                //     child: Padding(
                                //       padding: const EdgeInsets.symmetric(vertical: 12),
                                //       child: Text('login_btn'.tr, style: buttonStyle),
                                //     ),
                                //     onPressed: () {
                                //       FocusScope.of(context).unfocus();
                                //       final isValid = controller.formKey.currentState.validate();
                                //       if (!isValid) {
                                //         controller.mode.value = AutovalidateMode.onUserInteraction;
                                //         return;
                                //       }
                                //       controller.formKey.currentState.save();
                                //       controller.login();
                                //     },
                                //   ),
                                // );
                              }),
                            ],
                          ),
                        ),
                        Container(
                          width: Get.width,
                          padding: EdgeInsets.symmetric(vertical: percentHeight(context, 5)),
                          child: Text(
                            '\u00a9 2021 Xaurius. PT. Xaurius Asset Digital',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.subtitle1.copyWith(
                                  color: accentColor,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
