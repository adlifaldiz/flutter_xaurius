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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Data Personal'),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
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
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    XauTextField(
                      readOnly: controller.isKycStatus.value,
                      useObscure: false,
                      validator: validateName,
                      controller: controller.namaControl == null ? '' : controller.namaControl,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      labelText: 'Nama lengkap (KTP)',
                    ),
                    SizedBox(height: 10),
                    XauTextField(
                      readOnly: controller.isKycStatus.value,
                      useObscure: false,
                      validator: validatePhone,
                      controller: controller.nomorControl == null ? '' : controller.nomorControl,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      labelText: 'Nomor telepon',
                    ),
                    SizedBox(height: 10),
                    XauTextField(
                      ontap: controller.isKycStatus.value
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
                              controller.tanggalControl.text = controller.formatter.format(date);
                            }, onConfirm: (date) {
                              controller.tanggalControl.text = controller.formatter.format(date);
                            }, currentTime: DateTime.now(), locale: LocaleType.id);
                      },
                      readOnly: controller.isKycStatus.value,
                      useObscure: false,
                      validator: validateDate,
                      controller: controller.tanggalControl == null ? '' : controller.tanggalControl,
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
                      readOnly: controller.isKycStatus.value,
                      useObscure: false,
                      validator: validateAddress,
                      controller: controller.alamatControl == null ? '' : controller.alamatControl,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      labelText: 'Alamat rumah',
                    ),
                    SizedBox(height: 10),
                    XauTextField(
                      readOnly: controller.isKycStatus.value,
                      useObscure: false,
                      validator: validateCity,
                      controller: controller.kotaControl == null ? '' : controller.kotaControl,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      labelText: 'Kota',
                    ),
                    SizedBox(height: 10),
                    XauTextField(
                      readOnly: controller.isKycStatus.value,
                      useObscure: false,
                      validator: validateKode,
                      controller: controller.kodePosControl == null ? '' : controller.kodePosControl,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      labelText: 'Kode pos',
                    ),
                    SizedBox(height: 10),
                    XauTextField(
                      ontap: controller.isKycStatus.value
                          ? () {}
                          : () {
                        showCupertinoModalPopup<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return CurrencyPickerCupertino(
                                diameterRatio: 5,
                                backgroundColor: backgroundPanelColor,
                                initialCountry: controller.selectedCupertinoCurrency,
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
                                  controller.negaraControl.text = country.isoCode;
                                },
                              );
                            });
                      },
                      readOnly: controller.isKycStatus.value,
                      useObscure: false,
                      validator: validateCountry,
                      controller: controller.negaraControl == null ? '' : controller.negaraControl,
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
                      if (controller.isLoading.value) {
                        return JumpingDotsProgressIndicator(
                          numberOfDots: 3,
                          fontSize: 40,
                          color: primaryColor,
                        );
                      }
                      return RaisedButton(
                        onPressed: controller.isKycStatus.value
                            ? () {}
                            : () {
                          controller.kycPersonalData();
                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        color: !controller.isKycStatus.value ? primaryColor : disableColor,
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
