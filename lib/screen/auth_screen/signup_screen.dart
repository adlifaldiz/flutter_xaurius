import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xaurius/blocs/bloc.dart';
import 'package:flutter_xaurius/model/auth/signup_model.dart';
import 'package:flutter_xaurius/resources/api_provider.dart';
import 'package:flutter_xaurius/screen/signup/verif_code.dart';
import 'package:flutter_xaurius/widget/xau_text_field.dart';
import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';

import 'package:toast/toast.dart';

import '../../helper/theme.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailControl = TextEditingController();
  ApiProvider service = ApiProvider();
  var _autoValidate = false;
  var selected = false;
  bool isLoading = false;
  SignUpModel response;

  void _savePref(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    if (_formKey.currentState.validate()) {
      try {
        response = await service.addEmail(_emailControl.text);
        if (response.success) {
          Get.to(VerifCode(email: _emailControl.text));
          setState(() {
            isLoading = false;
          });
          Get.snackbar('Ok', response.message,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: backgroundPanelColor.withOpacity(0.8),
              colorText: textWhiteColor,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10));
        } else {
          Get.to(VerifCode(email: _emailControl.text));

          setState(() {
            isLoading = false;
          });
          Get.snackbar('Oops', response.message,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: backgroundPanelColor.withOpacity(0.8),
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
      setState(() {
        _autoValidate = true;
        isLoading = false;
      });
    }
  }

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
                        autovalidate: _autoValidate,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Alamat Email', style: styleLabel),
                            SizedBox(height: 5),
                            XauTextField(
                              useObscure: false,
                              validator: _validateEmail,
                              controller: _emailControl,
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
                                      style: Theme.of(context).textTheme.subhead.copyWith(
                                            color: textWhiteColor,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                    GestureDetector(
                                      onTap: () => Get.back(),
                                      child: Text(
                                        'Login disini',
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
                                        child: Text('Daftar Sekarang', style: buttonStyle),
                                      ),
                                      onPressed: () {
                                        _savePref(context);
                                      },
                                    ),
                            ),
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

  String _validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email tidak boleh kosong';
    } else if (!validateEmailStructure(value)) {
      return 'Format email salah';
    } else {
      return null;
    }
  }

  // String _validatePassword(String value) {
  //   if (value.isEmpty) {
  //     return 'Password can\'t be empty';
  //   } else if (value.length < 8) {
  //     return 'Password at least 8 character';
  //   } else if (!validatePasswordStructure(value)) {
  //     return 'Password at least have Symbols, Uppercases and Numbers';
  //   } else {
  //     return null;
  //   }
  // }

  // String _validateConfirmationPassword(String value) {
  //   String confPassword = _confPassword.toString();
  //   if (value.isEmpty) {
  //     return 'Password can\'t be empty';
  //   } else if (value != confPassword) {
  //     return 'Password no match';
  //   } else {
  //     return null;
  //   }
  // }

  // bool validatePasswordStructure(String value) {
  //   String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  //   RegExp regExp = new RegExp(pattern);
  //   return regExp.hasMatch(value);
  // }

  bool validateEmailStructure(String value) {
    String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
