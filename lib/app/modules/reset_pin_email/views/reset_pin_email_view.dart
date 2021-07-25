import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/helpers/validator.dart';
import 'package:flutter_xaurius/app/widget/xau_text_field.dart';
import 'package:flutter_xaurius/app/widget/xaurius_button.dart';

import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../controllers/reset_pin_email_controller.dart';

class ResetPinEmailView extends GetView<ResetPinEmailController> {
  final _formKey = GlobalKey<FormState>();
  var mode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Email',
            style: textAppbarStyleWhite,
          ),
          leading: BackButton(
            color: textWhiteColor,
          ),
        ),
        body: AbsorbPointer(
          absorbing: controller.isLoading.value,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
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
                    //         bottom: 0,
                    //         left: 0,
                    //         child: Image.asset(
                    //           'assets/images/mesh-left.png',
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //   Image.asset(
                            //     'assets/images/logo_ss.png',
                            //     width: 150,
                            //   ),
                            //   SizedBox(height: percentHeight(context, 3)),
                            //   Text(
                            //     'regis_welcome'.tr,
                            //     style:
                            //         Theme.of(context).textTheme.headline4.copyWith(
                            //               color: textWhiteColor,
                            //               fontWeight: FontWeight.bold,
                            //             ),
                            //   ),
                            //   SizedBox(height: percentHeight(context, 5)),
                            //   Text(
                            //     'regis_exp'.tr,
                            //     style: Theme.of(context).textTheme.subhead.copyWith(
                            //           color: brokenWhiteColor,
                            //           fontWeight: FontWeight.normal,
                            //         ),
                            //   ),
                            SizedBox(height: percentHeight(context, 5)),
                            Form(
                              key: _formKey,
                              autovalidateMode: mode,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('regis_email'.tr, style: styleLabel),
                                  SizedBox(height: 5),
                                  XauTextField(
                                    useObscure: false,
                                    onChanged: (val) => controller.email = val,
                                    validator: validateEmail,
                                    controller: controller.emailController,
                                    hintText: 'regis_email'.tr,
                                    prefixIcon: Icon(
                                      Icons.account_circle_rounded,
                                      color: primaryColor,
                                    ),
                                  ),
                                  SizedBox(height: percentHeight(context, 3)),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
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
                                        FocusScope.of(context).unfocus();
                                        // final isValidEmail =
                                        //     _formKey.currentState.validate();
                                        // if (!isValidEmail) {
                                        //   mode =
                                        //       AutovalidateMode.onUserInteraction;
                                        //   return;
                                        // }
                                        //_formKey.currentState.save();
                                        //  controller.register();
                                        controller.router();
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
                                    //       child: Text('regis_btn'.tr, style: buttonStyle),
                                    //     ),
                                    //     onPressed: () {
                                    //       FocusScope.of(context).unfocus();
                                    //       final isValidEmail = _formKey.currentState.validate();
                                    //       if (!isValidEmail) {
                                    //         mode = AutovalidateMode.onUserInteraction;
                                    //         return;
                                    //       }
                                    //       _formKey.currentState.save();
                                    //       controller.register();
                                    //     },
                                    //   ),
                                    // );
                                  }),
                                ],
                              ),
                            ),
                            // Container(
                            //   width: MediaQuery.of(context).size.width,
                            //   padding: EdgeInsets.symmetric(vertical: 30),
                            //   child: Text(
                            //     '\u00a9 2021 Xaurius. PT. Xaurius Asset Digital',
                            //     textAlign: TextAlign.center,
                            //     style: Theme.of(context)
                            //         .textTheme
                            //         .subtitle1
                            //         .copyWith(
                            //           color: accentColor,
                            //         ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
