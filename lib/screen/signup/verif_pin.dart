import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_xaurius/model/auth/signup_model.dart';
import 'package:flutter_xaurius/resources/api_provider.dart';
import 'package:flutter_xaurius/screen/auth_screen/login_screen.dart';
import 'package:get/get.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:toast/toast.dart';

import '../../helper/theme.dart';

class VerifPin extends StatefulWidget {
  final String email, code, pin;
  VerifPin({Key key, this.email, this.code, this.pin}) : super(key: key);

  @override
  _VerifPinState createState() => _VerifPinState();
}

class _VerifPinState extends State<VerifPin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  var _autoValidate = false;
  final _pinControl = TextEditingController();
  ApiProvider service = ApiProvider();
  SignUpModel response;

  Future<void> _savePref(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    if (_formKey.currentState.validate()) {
      try {
        response = await service.addpin(widget.email, widget.code, widget.pin, _pinControl.text);
        if (response.success) {
          Get.offAll(LoginScreen());
          setState(() {
            isLoading = false;
          });
          Get.snackbar('Ok', 'Silahkan login',
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
      if (_pinControl.text.isEmpty) {
        Get.snackbar('Pin kosong', 'Konfirmasi Pin tidak boleh kosong',
            backgroundColor: backgroundPanelColor.withOpacity(0.8),
            snackPosition: SnackPosition.BOTTOM,
            colorText: textWhiteColor,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10));
      } else if (_pinControl.text.length < 6) {
        Get.snackbar('6 Digit', 'Konfirmasi Pin harus 6 digit',
            backgroundColor: backgroundPanelColor.withOpacity(0.8),
            snackPosition: SnackPosition.BOTTOM,
            colorText: textWhiteColor,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10));
      } else if (_pinControl.text != widget.pin) {
        Get.snackbar('Tidak cocok', 'Konfirmasi pin tidak cocok',
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
                key: _formKey,
                autovalidate: _autoValidate,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Sekarang masukkan lagi pin yang sudah kamu buat', style: stylePrimary),
                    SizedBox(height: 20),
                    PinInputTextFormField(
                      keyboardType: TextInputType.number,
                      controller: _pinControl,
                      validator: _validatePin,
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
                        textStyle: TextStyle(color: textWhiteColor, fontWeight: FontWeight.w400, fontStyle: FontStyle.normal, fontSize: 20.0),
                        colorBuilder: PinListenColorBuilder(primaryColor, textWhiteColor),
                      ),
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
                                child: Text('Selesai', style: buttonStyle),
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

  String _validatePin(String value) {
    if (value.isEmpty) {
      return 'Confirmation Pin Cannot be empty';
    } else if (value.length < 6) {
      return 'Confirmation Pin must be 6 digits';
    } else if (value != widget.pin) {
      return 'Confirmation Pin not match';
    } else {
      return null;
    }
  }
}
