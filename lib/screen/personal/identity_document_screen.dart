import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xaurius/helper/screen_utils.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:flutter_xaurius/model/kyc/response_kyc_1_model.dart';
import 'package:flutter_xaurius/model/kyc/response_kyc_2_model.dart';
import 'package:flutter_xaurius/resources/api_provider.dart';
import 'package:flutter_xaurius/screen/menu_screen/menu_screen.dart';
import 'package:flutter_xaurius/widget/xau_text_field.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IdentityScreen extends StatefulWidget {
  @override
  _IdentityScreenState createState() => _IdentityScreenState();
}

class _IdentityScreenState extends State<IdentityScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  File _imageKTP;
  File _imageNPWP;
  final pickedFile = ImagePicker();
  int _value = 1;
  String _valueIdType = 'KTP';

  var _nomorKTP = TextEditingController();
  var _nomorNPWP = TextEditingController();

  SharedPreferences localStorage;

  ApiProvider service = ApiProvider();
  ResponseKyc2 response;
  bool _autoValidate = false;
  bool _isLoading = false;
  bool _isFormLoading = false;
  bool _statusKyc = true;
  bool _statusKycReview = false;

  _getImageKTP() async {
    final imageKTP = await pickedFile.getImage(source: ImageSource.gallery);
    setState(() {
      if (imageKTP != null) {
        _imageKTP = File(imageKTP.path);

        print('image selected.');
      } else {
        print('No image selected.');
      }
    });
  }

  getImageNPWP() async {
    final imageNpwp = await pickedFile.getImage(source: ImageSource.gallery);
    setState(() {
      if (imageNpwp != null) {
        _imageNPWP = File(imageNpwp.path);

        print('image selected.');
      } else {
        print('No image selected.');
      }
    });
  }

  _chekKyc2() async {
    setState(() {
      _isLoading = true;
    });
    localStorage = await SharedPreferences.getInstance();
    try {
      response = await service.getKyc2(localStorage.getString('token').toString());
      if (response.success) {
        setState(() {
          _nomorKTP.text = response.data.orang.orangIdNum;
          _nomorNPWP.text = response.data.orang.orangNpwpNum;
        });
      } else {
        print(response);
        Get.back();
      }
      setState(() {
        _isLoading = false;
      });
    } on TimeoutException catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
      Get.back();
    } on SocketException catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
      Get.back();
    } on Error catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
      Get.back();
    }
  }

  Future _saveKyc2(BuildContext context) async {
    setState(() {
      _isFormLoading = true;
    });
    localStorage = await SharedPreferences.getInstance();
    if (_formKey.currentState.validate()) {
      print("validate");
      try {
        print("Response");

        response = await service.kyc2(
            _valueIdType.toString(), _nomorKTP.text, _imageKTP.toString(), _nomorNPWP.text, _imageNPWP.toString(), localStorage.getString('token'));

        if (response.success) {
          print("success");
          setState(() {
            _isFormLoading = false;
          });
          Get.snackbar('Ok', 'Berhasil KYC ',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: backgroundPanelColor.withOpacity(0.8),
              colorText: textWhiteColor,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10));
          Get.offAll(MenuScreen());
        } else {
          print("gagal");

          setState(() {
            _isFormLoading = false;
          });
          Get.snackbar('Oops', response.msg,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: backgroundPanelColor.withOpacity(0.8),
              colorText: textWhiteColor,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10));
        }
      } on TimeoutException {
        print("gagal timeout");

        Get.snackbar('Oops', 'Terjadi kesalahan, silahkan coba lagi',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: backgroundPanelColor.withOpacity(0.8),
            colorText: textWhiteColor,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10));
        setState(() {
          _isFormLoading = false;
        });
      } on SocketException {
        print("gagal exception");

        Get.snackbar('Tidak ada koneksi internet', "Cek kembali koneksi internet",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: backgroundPanelColor.withOpacity(0.8),
            colorText: textWhiteColor,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10));
        setState(() {
          _isFormLoading = false;
        });
      } on Error {
        print("gagal erorr");

        setState(() {
          _isFormLoading = false;
        });
      }
    } else {
      print("gagal");

      Get.snackbar('NPWP', 'Test',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: backgroundPanelColor.withOpacity(0.8),
          colorText: textWhiteColor,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10));

      setState(() {
        _autoValidate = true;
        _isFormLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _chekKyc2();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dokumen Identitas'),
        ),
        body: _isLoading
            ? Center(
                child: JumpingDotsProgressIndicator(
                  numberOfDots: 3,
                  fontSize: 40,
                  color: primaryColor,
                ),
              )
            : SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 2)),
                  child: Form(
                    key: _formKey,
                    autovalidate: _autoValidate,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5)),
                          width: percentWidth(context, 100),
                          decoration: BoxDecoration(
                              color: backgroundPanelColor.withOpacity(0.3),
                              border: Border.all(color: brokenWhiteColor),
                              borderRadius: BorderRadius.circular(10)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              iconEnabledColor: primaryColor,
                              iconDisabledColor: brokenWhiteColor,
                              dropdownColor: backgroundPanelColor,
                              onTap: () {
                                Get.snackbar('Test', _valueIdType,
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: backgroundPanelColor.withOpacity(0.8),
                                    colorText: textWhiteColor,
                                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10));
                              },
                              value: _value.floor(),
                              items: [
                                DropdownMenuItem(
                                  child: Text('KTP'),
                                  value: 1,
                                  onTap: () {
                                    setState(() {
                                      _valueIdType = 'KTP';
                                    });
                                  },
                                ),
                                DropdownMenuItem(
                                  child: Text('Passport'),
                                  value: 2,
                                  onTap: () {
                                    setState(() {
                                      _valueIdType = 'Passport';
                                    });
                                  },
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _value = value;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        XauTextField(
                          useObscure: false,
                          validator: _validateKTP,
                          controller: _nomorKTP == null ? '' : _nomorKTP,
                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          labelText: 'Nomor identitas',
                        ),
                        SizedBox(height: 10),
                        _imageKTP == null
                            ? Text('Kamu belum melampirkan foto identitas')
                            : ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.file(_imageKTP)),
                        FlatButton(
                          color: primaryColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          onPressed: _getImageKTP,
                          child: Text(
                            _imageKTP == null ? 'Pilih gambar' : 'Ganti gambar',
                            style: stylePrimaryDark,
                          ),
                        ),
                        SizedBox(height: 10),
                        XauTextField(
                          useObscure: false,
                          validator: _validateNPWP,
                          controller: _nomorNPWP == null ? '' : _nomorNPWP,
                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          labelText: 'Nomor NPWP',
                        ),
                        SizedBox(height: 10),
                        _imageNPWP == null
                            ? Text('Kamu belum melampirkan foto NPWP')
                            : ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.file(_imageNPWP)),
                        FlatButton(
                          color: primaryColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          onPressed: getImageNPWP,
                          child: Text(
                            _imageNPWP == null ? 'Pilih gambar' : 'Ganti gambar',
                            style: stylePrimaryDark,
                          ),
                        ),
                        SizedBox(height: 30),
                        _isFormLoading
                            ? Center(
                                child: JumpingDotsProgressIndicator(
                                  numberOfDots: 3,
                                  fontSize: 40,
                                  color: primaryColor,
                                ),
                              )
                            : RaisedButton(
                                onPressed: () {
                                  _saveKyc2(context);
                                },
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                color: primaryColor,
                                child: Center(
                                  child: Text(
                                    'Simpan',
                                    style: buttonStyle,
                                  ),
                                ),
                              )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  String _validateKTP(String value) {
    if (value.isEmpty) {
      return 'Nomor KTP tidak boleh kosong';
    } else {
      return null;
    }
  }

  String _validateNPWP(String value) {
    if (value.isEmpty) {
      return 'Nomor NPWP tidak boleh kosong';
    } else {
      return null;
    }
  }
}
