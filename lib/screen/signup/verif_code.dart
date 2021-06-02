import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/controller/verif_code_controller.dart';
import 'package:flutter_xaurius/helper/validator.dart';

import 'package:flutter_xaurius/helper/theme.dart';
import 'package:get/get.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:progress_indicators/progress_indicators.dart';

class VerifCode extends StatelessWidget {
  VerifCodeController _controller = Get.put(VerifCodeController());
  final String email;
  VerifCode({Key key, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Verifikasi Kode',
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _controller.formKey,
                child: Column(
                  children: [
                    Text(
                      'Silahkan masukkan 6 digit kode verifikasi yang kami kirim ke alamat email: ${email.replaceRange(3, email.length - 10, '*' * (4))}',
                      style: TextStyle(color: textWhiteColor),
                    ),
                    SizedBox(height: 20),
                    PinInputTextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        _controller.code = value;
                      },
                      onSaved: (value) {
                        _controller.code = value;
                      },
                      controller: _controller.codeController,
                      validator: (value) {
                        return validateCode(value);
                      },
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
                          textStyle: TextStyle(color: textWhiteColor, fontWeight: FontWeight.w400, fontStyle: FontStyle.normal, fontSize: 20.0),
                          colorBuilder: PinListenColorBuilder(primaryColor, textWhiteColor)),
                    ),
                    Spacer(),
                    Obx(() {
                      if (_controller.isLoading.value) {
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
                            FocusScope.of(context).unfocus();
                            _controller.checkCode(email);
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
