import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/currency_picker_cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/helpers/validator.dart';
import 'package:flutter_xaurius/app/widget/xau_text_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../controllers/data_personal_controller.dart';

class DataPersonalView extends GetView<DataPersonalController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Data Personal'),
        ),
        body: Obx(() {
          if (controller.kycController.isLoading.value) {
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
                key: controller.kycController.kyc1Key,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    XauTextField(
                      readOnly: !controller.kycController.isKycStatus.value,
                      useObscure: false,
                      validator: validateName,
                      controller: controller.kycController.namaControl == null ? '' : controller.kycController.namaControl,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      labelText: 'Nama lengkap (KTP)',
                    ),
                    SizedBox(height: 10),
                    XauTextField(
                      readOnly: !controller.kycController.isKycStatus.value,
                      useObscure: false,
                      validator: validatePhone,
                      controller: controller.kycController.nomorControl == null ? '' : controller.kycController.nomorControl,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      labelText: 'Nomor telepon',
                    ),
                    SizedBox(height: 10),
                    XauTextField(
                      ontap: !controller.kycController.isKycStatus.value
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
                              controller.kycController.tanggalControl.text = controller.kycController.formatter.format(date);
                            }, onConfirm: (date) {
                              controller.kycController.tanggalControl.text = controller.kycController.formatter.format(date);
                            }, currentTime: DateTime.now(), locale: LocaleType.id);
                      },
                      readOnly: !controller.kycController.isKycStatus.value,
                      useObscure: false,
                      validator: validateDate,
                      controller: controller.kycController.tanggalControl == null ? '' : controller.kycController.tanggalControl,
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
                      readOnly: !controller.kycController.isKycStatus.value,
                      useObscure: false,
                      validator: validateAddress,
                      controller: controller.kycController.alamatControl == null ? '' : controller.kycController.alamatControl,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      labelText: 'Alamat rumah',
                    ),
                    SizedBox(height: 10),
                    XauTextField(
                      readOnly: !controller.kycController.isKycStatus.value,
                      useObscure: false,
                      validator: validateCity,
                      controller: controller.kycController.kotaControl == null ? '' : controller.kycController.kotaControl,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      labelText: 'Kota',
                    ),
                    SizedBox(height: 10),
                    XauTextField(
                      readOnly: !controller.kycController.isKycStatus.value,
                      useObscure: false,
                      validator: validateKode,
                      controller: controller.kycController.kodePosControl == null ? '' : controller.kycController.kodePosControl,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      labelText: 'Kode pos',
                    ),
                    SizedBox(height: 10),
                    XauTextField(
                      ontap: !controller.kycController.isKycStatus.value
                          ? () {}
                          : () {
                        showCupertinoModalPopup<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return CurrencyPickerCupertino(
                                diameterRatio: 5,
                                backgroundColor: backgroundPanelColor,
                                initialCountry: controller.kycController.selectedCupertinoCurrency,
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
                                  controller.kycController.negaraControl.text = country.isoCode;
                                },
                              );
                            });
                      },
                      readOnly: !controller.kycController.isKycStatus.value,
                      useObscure: false,
                      validator: validateCountry,
                      controller: controller.kycController.negaraControl == null ? '' : controller.kycController.negaraControl,
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
                      if (controller.kycController.isLoadingForm.value) {
                        return JumpingDotsProgressIndicator(
                          numberOfDots: 3,
                          fontSize: 40,
                          color: primaryColor,
                        );
                      }
                      return RaisedButton(
                        onPressed: !controller.kycController.isKycStatus.value
                            ? () {}
                            : () {
                          controller.kycController.postKyc1();
                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        color: controller.kycController.isKycStatus.value ? primaryColor : disableColor,
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
