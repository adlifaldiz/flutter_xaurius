import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_xaurius/model/auth/signup_model.dart';
import 'package:flutter_xaurius/model/auth/login_model.dart';
import 'package:flutter_xaurius/resources/api_provider.dart';
import 'package:flutter_xaurius/screen/menu_screen/menu_screen.dart';
import 'package:flutter_xaurius/screen/auth_screen/signup_screen.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  SharedPreferences localStorage;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _usernameControl = TextEditingController();
  final _passwordControl = TextEditingController();

  var _autoValidate = false;
  var selected = false;
  ApiProvider service = ApiProvider();
  LoginModel response;
  bool isLoading = false;
  String username;
  String password;

  void _savePref(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    if (_formKey.currentState.validate()) {
      try {
        response = await service.login(_usernameControl.text, _passwordControl.text);
        if (response.success) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool('isUser', true);
          prefs.setString('token', response.token.toString());
          Get.offAll(MenuScreen());
          setState(() {
            isLoading = false;
          });
          Get.snackbar('Ok', 'Berhasil login',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: backgroundPanelColor.withOpacity(0.8),
              colorText: textWhiteColor,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10));
        } else {
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
        setState(() {
          isLoading = false;
        });
      }
    } else {
      Get.snackbar('Form kosong', 'Form tidak boleh kosong',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: backgroundPanelColor.withOpacity(0.8),
          colorText: textWhiteColor,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10));

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
                        key: _formKey,
                        autovalidate: _autoValidate,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Alamat Email', style: styleLabel),
                            SizedBox(height: 5),
                            TextFormField(
                              onSaved: (String value) {
                                username = value;
                              },
                              controller: _usernameControl,
                              validator: _validateUsername,
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
                            TextFormField(
                              onSaved: (String value) {
                                password = value;
                              },
                              controller: _passwordControl,
                              validator: _validatePassword,
                              obscureText: true,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
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
                                hintStyle: stylePrimary,
                                hintText: 'Pin',
                                prefixIcon: Icon(
                                  Icons.lock_outline_rounded,
                                  color: primaryColor,
                                ),
                              ),
                            ),
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
                                      onTap: () => Get.to(SignUpScreen()),
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
                                        child: Text('Login', style: buttonStyle),
                                      ),
                                      onPressed: () {
                                        FocusScope.of(context).unfocus();
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
}

String _validateUsername(String value) {
  if (value.isEmpty) {
    return 'Alamat email tidak boleh kosong';
  } else if (!validateEmailStructure(value)) {
    return 'Format email salah';
  } else {
    return null;
  }
}

String _validatePassword(String value) {
  if (value.isEmpty) {
    return 'Pin tidak boleh kosong';
  } else {
    return null;
  }
}

bool validateEmailStructure(String value) {
  String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(value);
}
