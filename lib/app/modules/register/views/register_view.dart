import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/helpers/validator.dart';
import 'package:flutter_xaurius/app/widget/xau_text_field.dart';

import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final _formKey = GlobalKey<FormState>();
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
                      bottom: 0,
                      left: 0,
                      child: Image.asset(
                        'assets/images/mesh-left.png',
                      ),
                    )
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
                        'Selamat datang',
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              color: textWhiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Untuk mendaftarkan diri.\nSilahkan mendaftar dengan\nmengisi alamat email kamu',
                        style: Theme.of(context).textTheme.subhead.copyWith(
                              color: brokenWhiteColor,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      SizedBox(height: 50),
                      Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Alamat Email', style: styleLabel),
                            SizedBox(height: 5),
                            XauTextField(
                              useObscure: false,
                              onChanged: (val) => controller.email = val,
                              validator: validateEmail,
                              hintText: 'Alamat email',
                              prefixIcon: Icon(
                                Icons.account_circle_rounded,
                                color: primaryColor,
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Sudah punya akun?',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subhead
                                          .copyWith(
                                            color: textWhiteColor,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                    GestureDetector(
                                      onTap: () => Get.back(),
                                      child: Text(
                                        'Login disini',
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subhead
                                            .copyWith(
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    child: Text('Daftar Sekarang',
                                        style: buttonStyle),
                                  ),
                                  onPressed: () {
                                    FocusScope.of(context).unfocus();
                                    final isValidEmail =
                                        _formKey.currentState.validate();
                                    if (!isValidEmail) {
                                      return;
                                    }
                                    _formKey.currentState.save();
                                    controller.register();
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
