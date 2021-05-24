import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_xaurius/blocs/bloc.dart';
import 'package:flutter_xaurius/model/auth/signup_model.dart';
import 'package:flutter_xaurius/resources/api_provider.dart';
import 'package:flutter_xaurius/screen/signup/create_pin.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:get/get.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:toast/toast.dart';

class VerifCode extends StatefulWidget {
  final String email;

  VerifCode({Key key, this.email}) : super(key: key);

  @override
  _VerifCodeState createState() => _VerifCodeState();
}

class _VerifCodeState extends State<VerifCode> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ApiProvider service = ApiProvider();
  SignUpModel response;
  bool isLoading = false;

  var _autoValidate = false;
  final _codeControl = TextEditingController();

  void _savePref(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    if (_formKey.currentState.validate()) {
      try {
        response = await service.addCode(widget.email, _codeControl.text);
        if (response.status == "success") {
          Get.to(CreatePin(email: widget.email, code: _codeControl.text));
          setState(() {
            isLoading = false;
          });
          Get.snackbar('Ok', response.message,
              backgroundColor: backgroundPanelColor.withOpacity(0.8),
              snackPosition: SnackPosition.BOTTOM,
              colorText: textWhiteColor,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10));
        } else {
          setState(() {
            isLoading = false;
          });
          Get.snackbar('Oops', response.message,
              backgroundColor: backgroundPanelColor.withOpacity(0.8),
              snackPosition: SnackPosition.BOTTOM,
              colorText: textWhiteColor,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10));
        }
      } on TimeoutException {
        Get.snackbar('Oops', 'Terjadi kesalahan, silahkan coba lagi',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: backgroundPanelColor.withOpacity(0.8),
            colorText: textWhiteColor,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10));
        setState(() {
          isLoading = false;
        });
      } on SocketException {
        Get.snackbar('Tidak ada koneksi internet', "Cek kembali koneksi internet",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: backgroundPanelColor.withOpacity(0.8),
            colorText: textWhiteColor,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10));
        setState(() {
          isLoading = false;
        });
      } on Error {
        Get.snackbar('Oops', 'Terjadi kesalahan',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: backgroundPanelColor.withOpacity(0.8),
            colorText: textWhiteColor,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10));
        setState(() {
          isLoading = false;
        });
      }
    } else {
      if (_codeControl.text.isEmpty) {
        Get.snackbar('Kode', 'Kode verifikasi tidak boleh kosong',
            backgroundColor: backgroundPanelColor.withOpacity(0.8),
            snackPosition: SnackPosition.BOTTOM,
            colorText: textWhiteColor,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10));
      } else if (_codeControl.text.length < 6) {
        Get.snackbar('6 Digit', 'Kode verifikasi harus 6 digit',
            backgroundColor: backgroundPanelColor.withOpacity(0.8),
            snackPosition: SnackPosition.BOTTOM,
            colorText: textWhiteColor,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10));
      }
      setState(() {
        _autoValidate = true;
        isLoading = false;
      });
    }
  }

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
                autovalidate: _autoValidate,
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      'Silahkan masukkan 6 digit kode verifikasi yang kami kirim ke alamat email: ${widget.email.replaceRange(2, widget.email.length - 10, '*' * (4))}',
                      style: TextStyle(color: textWhiteColor),
                    ),
                    SizedBox(height: 20),
                    PinInputTextFormField(
                      keyboardType: TextInputType.number,
                      controller: _codeControl,
                      validator: _validateCode,
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
                    Container(
                      width: double.infinity,
                      child: isLoading
                          ? JumpingDotsProgressIndicator(
                              numberOfDots: 3,
                              fontSize: 40,
                              color: primaryColor,
                            )
                          : RaisedButton(
                              color: accentColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                child: Text('Lanjutkan', style: buttonStyle),
                              ),
                              onPressed: () {
                                _savePref(context);
                              },
                            ),
                    ),
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

String _validateCode(String value) {
  if (value.isEmpty) {
    return 'Kode verifikasi tidak boleh kosong';
  } else if (value.length < 6) {
    return 'Kode verifikasi harus 6 digit';
  } else {
    return null;
  }
}
