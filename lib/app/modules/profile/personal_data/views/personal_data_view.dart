import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/currency_picker_cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_xaurius/app/controller/kyc_controller.dart';
import 'package:flutter_xaurius/helper/screen_utils.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:flutter_xaurius/helper/validator.dart';
import 'package:flutter_xaurius/widget/xau_text_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../controllers/personal_data_controller.dart';

class PersonalDataView extends GetView<PersonalDataController> {
  @override
  Widget build(BuildContext context) {
    KycController _kycController = Get.put(KycController());
    _kycController.onInit();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Data Personal'),
        ),
        body: Obx(() {
          if (_kycController.isLoading.value) {
            return Center(
              child: JumpingDotsProgressIndicator(
                numberOfDots: 3,
                fontSize: 40,
                color: primaryColor,
              ),
            );
          }

          return SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 2)),
              child: Form(
                key: _kycController.kyc1Key,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    XauTextField(
                      readOnly: !_kycController.isKycStatus.value,
                      useObscure: false,
                      validator: validateName,
                      controller: _kycController.namaControl == null ? '' : _kycController.namaControl,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      labelText: 'Nama lengkap (KTP)',
                    ),
                    SizedBox(height: 10),
                    XauTextField(
                      readOnly: !_kycController.isKycStatus.value,
                      useObscure: false,
                      validator: validatePhone,
                      controller: _kycController.nomorControl == null ? '' : _kycController.nomorControl,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      labelText: 'Nomor telepon',
                    ),
                    SizedBox(height: 10),
                    XauTextField(
                      ontap: !_kycController.isKycStatus.value
                          ? () {}
                          : () {
                              DatePicker.showDatePicker(context,
                                  theme: DatePickerTheme(
                                      backgroundColor: backgroundPanelColor,
                                      itemStyle: stylePrimary,
                                      doneStyle: stylePrimary,
                                      cancelStyle: stylePrimary.copyWith(color: primaryColor)),
                                  showTitleActions: true,
                                  // minTime: DateTime(2018, 3, 5),
                                  maxTime: DateTime.now(), onChanged: (date) {
                                _kycController.tanggalControl.text = _kycController.formatter.format(date);
                              }, onConfirm: (date) {
                                _kycController.tanggalControl.text = _kycController.formatter.format(date);
                              }, currentTime: DateTime.now(), locale: LocaleType.id);
                            },
                      readOnly: !_kycController.isKycStatus.value,
                      useObscure: false,
                      validator: validateDate,
                      controller: _kycController.tanggalControl == null ? '' : _kycController.tanggalControl,
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
                      readOnly: !_kycController.isKycStatus.value,
                      useObscure: false,
                      validator: validateAddress,
                      controller: _kycController.alamatControl == null ? '' : _kycController.alamatControl,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      labelText: 'Alamat rumah',
                    ),
                    SizedBox(height: 10),
                    XauTextField(
                      readOnly: !_kycController.isKycStatus.value,
                      useObscure: false,
                      validator: validateCity,
                      controller: _kycController.kotaControl == null ? '' : _kycController.kotaControl,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      labelText: 'Kota',
                    ),
                    SizedBox(height: 10),
                    XauTextField(
                      readOnly: !_kycController.isKycStatus.value,
                      useObscure: false,
                      validator: validateKode,
                      controller: _kycController.kodePosControl == null ? '' : _kycController.kodePosControl,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      labelText: 'Kode pos',
                    ),
                    SizedBox(height: 10),
                    XauTextField(
                      ontap: !_kycController.isKycStatus.value
                          ? () {}
                          : () {
                              showCupertinoModalPopup<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CurrencyPickerCupertino(
                                      diameterRatio: 5,
                                      backgroundColor: backgroundPanelColor,
                                      initialCountry: _kycController.selectedCupertinoCurrency,
                                      pickerSheetHeight: percentHeight(context, 50),
                                      pickerItemHeight: percentHeight(context, 5),
                                      itemBuilder: (Country country) {
                                        return Row(
                                          children: [
                                            // country == null
                                            //     ? CountryPickerUtils.getDefaultFlagImage(null)
                                            //     : CountryPickerUtils.getDefaultFlagImage(country),
                                            SizedBox(width: 10),
                                            Text(
                                              '(${country.isoCode}) ${country.name}',
                                              style: stylePrimary,
                                            ),
                                          ],
                                        );
                                      },
                                      onValuePicked: (Country country) {
                                        _kycController.negaraControl.text = country.isoCode;
                                      },
                                    );
                                  });
                            },
                      readOnly: !_kycController.isKycStatus.value,
                      useObscure: false,
                      validator: validateCountry,
                      controller: _kycController.negaraControl == null ? '' : _kycController.negaraControl,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      labelText: 'Negara',
                      suffixIcon: Column(
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
                      ),
                    ),
                    SizedBox(height: 30),
                    Obx(() {
                      if (_kycController.isLoadingForm.value) {
                        return JumpingDotsProgressIndicator(
                          numberOfDots: 3,
                          fontSize: 40,
                          color: primaryColor,
                        );
                      }
                      return RaisedButton(
                        onPressed: !_kycController.isKycStatus.value
                            ? () {}
                            : () {
                                _kycController.postKyc1();
                              },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        color: _kycController.isKycStatus.value ? primaryColor : disableColor,
                        child: Center(
                          child: Text(
                            'Simpan',
                            style: buttonStyle,
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
