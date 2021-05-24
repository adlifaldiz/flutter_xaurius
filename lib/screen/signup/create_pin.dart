import 'package:flutter/material.dart';
import 'package:flutter_xaurius/screen/signup/verif_pin.dart';
import 'package:flutter_xaurius/helper/theme.dart';

import 'package:get/get.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:toast/toast.dart';

class CreatePin extends StatefulWidget {
  final String email, code;
  CreatePin({Key key, this.email, this.code}) : super(key: key);

  @override
  _CreatePinState createState() => _CreatePinState();
}

class _CreatePinState extends State<CreatePin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  var _autoValidate = false;
  final _pinControl = TextEditingController();

  void _savePref(BuildContext context) {
    setState(() {
      isLoading = true;
    });
    if (_formKey.currentState.validate()) {
      setState(() {
        isLoading = false;
      });
      Get.to(VerifPin(email: widget.email, code: widget.code, pin: _pinControl.text));
      Get.snackbar('Ok', 'Berhasil',
          backgroundColor: backgroundPanelColor.withOpacity(0.8),
          snackPosition: SnackPosition.BOTTOM,
          colorText: textWhiteColor,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10));
    } else {
      if (_pinControl.text.isEmpty) {
        Get.snackbar('Pin kosong', 'Pin tidak boleh kosong',
            backgroundColor: backgroundPanelColor.withOpacity(0.8),
            snackPosition: SnackPosition.BOTTOM,
            colorText: textWhiteColor,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10));
      } else if (_pinControl.text.length < 6) {
        Get.snackbar('6 digit', 'Pin harus 6 digit',
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
                key: _formKey,
                autovalidate: _autoValidate,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Sekarang buat pin kamu dengan memasukkan 6 digit unik yang mudah diingat', style: stylePrimary),
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

String _validatePin(String value) {
  if (value.isEmpty) {
    return 'Pin tidak boleh kosong';
  } else if (value.length < 6) {
    return 'Pin harus 6 digit';
  } else {
    return null;
  }
}
