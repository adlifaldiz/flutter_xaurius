import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/helpers/validator.dart';
import 'package:get/get.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                      top: 0,
                      right: 0,
                      child: Image.asset(
                        'assets/images/mesh-right.png',
                      ),
                    ),
                  ],
                ),
              ),
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
                      SizedBox(height: 20),
                      Text(
                        'Selamat Datang:)',
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              color: textWhiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Untuk memulai aplikasi\nSilahkan login dengan email dan pin kamu',
                        style: Theme.of(context).textTheme.subhead.copyWith(
                              color: brokenWhiteColor,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      SizedBox(height: 50),
                      Form(
                        key: formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Alamat Email', style: styleLabel),
                            SizedBox(height: 5),
                            TextFormField(
                              onSaved: (value) => controller.email = value,
                              validator: validateEmail,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              style: stylePrimary,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                                fillColor: fillColor,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: primaryColor, width: 2),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: brokenWhiteColor),
                                ),
                                errorStyle: styleError,
                                hintText: 'Alamat email',
                                hintStyle: stylePrimary,
                                prefixIcon: Icon(
                                  Icons.account_circle_rounded,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text('Pin', style: styleLabel),
                            SizedBox(height: 5),
                            PinInputTextFormField(
                              keyboardType: TextInputType.number,
                              onChanged: (value) => controller.pin = value,
                              validator: (value) {
                                return validateVerifPin(value, controller.pin);
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
                            // TextFormField(
                            //   onSaved: (value) => controller.pin = value,
                            //   validator: validatePin,
                            //   obscureText: true,
                            //   keyboardType: TextInputType.number,
                            //   textInputAction: TextInputAction.done,
                            //   style: stylePrimary,
                            //   decoration: InputDecoration(
                            //     contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                            //     fillColor: fillColor,
                            //     filled: true,
                            //     border: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(10.0),
                            //     ),
                            //     focusedBorder: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(10.0),
                            //       borderSide: BorderSide(color: primaryColor, width: 2),
                            //     ),
                            //     enabledBorder: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(10.0),
                            //       borderSide: BorderSide(color: brokenWhiteColor),
                            //     ),
                            //     errorStyle: styleError,
                            //     hintStyle: stylePrimary,
                            //     hintText: 'Pin',
                            //     prefixIcon: Icon(
                            //       Icons.lock_outline_rounded,
                            //       color: primaryColor,
                            //     ),
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Belum punya akun?',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.subhead.copyWith(
                                            color: textWhiteColor,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                    GestureDetector(
                                      onTap: () => Get.toNamed(Routes.REGISTER),
                                      child: Text(
                                        'Daftar disini',
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
                            ),
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
                                    child: Text('Login', style: buttonStyle),
                                  ),
                                  onPressed: () {
                                    FocusScope.of(context).unfocus();
                                    final isValid = formKey.currentState.validate();
                                    if (!isValid) {
                                      return;
                                    }
                                    formKey.currentState.save();
                                    controller.login();
                                  },
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(vertical: 30),
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
    );
  }
}