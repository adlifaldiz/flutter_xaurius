import 'dart:async';
import 'dart:io';

// import 'package:country_picker/country_picker.dart';
import 'package:country_currency_pickers/countries.dart';
import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/country_pickers.dart';
import 'package:country_currency_pickers/currency_picker_cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_xaurius/helper/screen_utils.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:flutter_xaurius/model/kyc/response_kyc_1_model.dart';
import 'package:flutter_xaurius/resources/api_provider.dart';
import 'package:flutter_xaurius/widget/xau_text_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataPersonalScreen extends StatefulWidget {
  @override
  _DataPersonalScreenState createState() => _DataPersonalScreenState();
}

class _DataPersonalScreenState extends State<DataPersonalScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Country _selectedCupertinoCurrency = CountryPickerUtils.getCountryByIsoCode('ID');
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  bool _autoValidate = false;
  SharedPreferences localStorage;

  ApiProvider service = ApiProvider();
  ResponseKyc1 response;
  bool _isLoading = false;
  bool _isFormLoading = false;
  bool _statusKyc = true;
  bool _statusKycReview = false;

  DateTime _tempDate;

  final String name = 'Indonesia';
  var _namaControl = TextEditingController();
  var _nomorControl = TextEditingController();
  var _tanggalControl = TextEditingController();
  var _alamatControl = TextEditingController();
  var _kotaControl = TextEditingController();
  var _kodePosControl = TextEditingController();
  var _negaraControl = TextEditingController();

  _chekKyc1() async {
    setState(() {
      _isLoading = true;
    });
    localStorage = await SharedPreferences.getInstance();
    try {
      response = await service.getKyc1(localStorage.getString('token'));
      if (response.success) {
        setState(() {
          _tempDate = DateTime.parse(response.data.orang.orangBirthday);

          _namaControl.text = response.data.orang.orangName;
          _nomorControl.text = response.data.orang.orangPhone;
          _tanggalControl.text = formatter.format(_tempDate);
          _alamatControl.text = response.data.orang.orangAddrStreet;
          _kotaControl.text = response.data.orang.orangAddrCity;
          _kodePosControl.text = response.data.orang.orangAddrPostal;
          _negaraControl.text = response.data.orang.orangAddrCountry;
        });
      } else {
        print(response);
      }
      setState(() {
        _isLoading = false;
      });
    } on TimeoutException catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
    } on SocketException catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
    } on Error catch (e) {
      print(e);
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _saveKyc1(BuildContext context) async {
    setState(() {
      _isFormLoading = true;
    });
    localStorage = await SharedPreferences.getInstance();
    if (_formKey.currentState.validate()) {
      try {
        response = await service.kyc1(_namaControl.text, _nomorControl.text, _tanggalControl.text, _alamatControl.text, _kotaControl.text,
            _kodePosControl.text, _negaraControl.text, localStorage.getString('token'));
        if (response.success) {
          setState(() {
            _isFormLoading = false;
            _chekKyc1();
          });
          Get.snackbar('Ok', 'Berhasil KYC tahap pertama',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: backgroundPanelColor.withOpacity(0.8),
              colorText: textWhiteColor,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10));
        } else {
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
        Get.snackbar('Oops', 'Terjadi kesalahan, silahkan coba lagi',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: backgroundPanelColor.withOpacity(0.8),
            colorText: textWhiteColor,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10));
        setState(() {
          _isFormLoading = false;
        });
      } on SocketException {
        Get.snackbar('Tidak ada koneksi internet', "Cek kembali koneksi internet",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: backgroundPanelColor.withOpacity(0.8),
            colorText: textWhiteColor,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10));
        setState(() {
          _isFormLoading = false;
        });
      } on Error {
        setState(() {
          _isFormLoading = false;
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
        _isFormLoading = false;
      });
    }
  }

  @override
  void initState() {
    _chekKyc1();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Data Personal'),
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
                        SizedBox(height: 10),
                        XauTextField(
                          useObscure: false,
                          validator: _validateName,
                          controller: _namaControl ?? '',
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          labelText: 'Nama lengkap (KTP)',
                        ),
                        SizedBox(height: 10),
                        XauTextField(
                          useObscure: false,
                          validator: _validatePhone,
                          controller: _nomorControl ?? '',
                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          labelText: 'Nomor telepon',
                        ),
                        SizedBox(height: 10),
                        XauTextField(
                          ontap: () {
                            DatePicker.showDatePicker(context,
                                theme: DatePickerTheme(
                                    backgroundColor: backgroundPanelColor,
                                    itemStyle: stylePrimary,
                                    doneStyle: stylePrimary,
                                    cancelStyle: stylePrimary.copyWith(color: primaryColor)),
                                showTitleActions: true,
                                // minTime: DateTime(2018, 3, 5),
                                maxTime: DateTime.now(), onChanged: (date) {
                              setState(() {
                                _tanggalControl.text = formatter.format(date);
                              });
                            }, onConfirm: (date) {
                              _tanggalControl.text = formatter.format(date);
                            }, currentTime: DateTime.now(), locale: LocaleType.id);
                          },
                          readOnly: true,
                          useObscure: false,
                          validator: _validateDate,
                          controller: _tanggalControl ?? '',
                          suffixIcon: Icon(
                            FontAwesomeIcons.calendarAlt,
                            color: primaryColor,
                          ),
                          keyboardType: TextInputType.datetime,
                          maxLines: 1,
                          labelText: 'Tanggal lahir',
                        ),
                        SizedBox(height: 10),
                        XauTextField(
                          useObscure: false,
                          validator: _validateAddress,
                          controller: _alamatControl ?? '',
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          labelText: 'Alamat rumah',
                        ),
                        SizedBox(height: 10),
                        XauTextField(
                          useObscure: false,
                          validator: _validateCity,
                          controller: _kotaControl ?? '',
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          labelText: 'Kota',
                        ),
                        SizedBox(height: 10),
                        XauTextField(
                          useObscure: false,
                          validator: _validateKode,
                          controller: _kodePosControl ?? '',
                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          labelText: 'Kode pos',
                        ),
                        SizedBox(height: 10),
                        XauTextField(
                          ontap: () {
                            showCupertinoModalPopup<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return CurrencyPickerCupertino(
                                    diameterRatio: 5,
                                    backgroundColor: backgroundPanelColor,
                                    initialCountry: _selectedCupertinoCurrency,
                                    itemBuilder: (Country country) {
                                      return Row(
                                        children: [
                                          CountryPickerUtils.getDefaultFlagImage(country),
                                          SizedBox(width: 10),
                                          Text(
                                            country.name,
                                            style: stylePrimary,
                                          ),
                                        ],
                                      );
                                    },
                                    onValuePicked: (Country country) => setState(() => _negaraControl.text = country.name),
                                  );
                                });
                          },
                          readOnly: true,
                          useObscure: false,
                          validator: _validateCountry,
                          controller: _negaraControl ?? '',
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          labelText: 'Negara',
                          suffixIcon: GestureDetector(
                              onTap: () {},
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.caretUp,
                                    size: 14,
                                    color: primaryColor,
                                  ),
                                  Icon(
                                    FontAwesomeIcons.caretDown,
                                    size: 14,
                                    color: primaryColor,
                                  ),
                                ],
                              )),
                        ),
                        SizedBox(height: 30),
                        _isFormLoading
                            ? JumpingDotsProgressIndicator(
                                numberOfDots: 3,
                                fontSize: 40,
                                color: primaryColor,
                              )
                            : RaisedButton(
                                onPressed: () {
                                  _saveKyc1(context);
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

  String _validateName(String value) {
    if (value.isEmpty) {
      return 'Nama tidak boleh kosong';
    } else {
      return null;
    }
  }

  String _validatePhone(String value) {
    if (value.isEmpty) {
      return 'Nomor Telepon tidak boleh kosong';
    } else {
      return null;
    }
  }

  String _validateDate(String value) {
    if (value.isEmpty) {
      return 'Tanggal lahir tidak boleh kosong';
    } else {
      return null;
    }
  }

  String _validateAddress(String value) {
    if (value.isEmpty) {
      return 'Alamat tidak boleh kosong';
    } else {
      return null;
    }
  }

  String _validateCity(String value) {
    if (value.isEmpty) {
      return 'Kota tidak boleh kosong';
    } else {
      return null;
    }
  }

  String _validateKode(String value) {
    if (value.isEmpty) {
      return 'Kode pos tidak boleh kosong';
    } else {
      return null;
    }
  }

  String _validateCountry(String value) {
    if (value.isEmpty) {
      return 'Negara tidak boleh kosong';
    } else {
      return null;
    }
  }

  Widget _buildDialogItem(Country country) {
    return Container(
      child: Text(country.name),
    );
  }
}
