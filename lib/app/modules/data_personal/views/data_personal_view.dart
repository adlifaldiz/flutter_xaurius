import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/currency_picker_cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/helpers/validator.dart';
import 'package:flutter_xaurius/app/widget/shimmer_list.dart';
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
          title: Text('personal_data'.tr),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return ShimmerList();
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
                      readOnly: !controller.auth.userData.orangKycEditAvailable,
                      useObscure: false,
                      validator: validateName,
                      controller: controller.namaControl == null ? '' : controller.namaControl,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      labelText: 'full_name'.tr,
                    ),
                    SizedBox(height: 10),
                    XauTextField(
                      readOnly: !controller.auth.userData.orangKycEditAvailable,
                      useObscure: false,
                      validator: validatePhone,
                      controller: controller.nomorControl == null ? '' : controller.nomorControl,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      labelText: 'phone_number'.tr,
                    ),
                    SizedBox(height: 10),
                    XauTextField(
                      ontap: !controller.auth.userData.orangKycEditAvailable
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
                      readOnly: true,
                      useObscure: false,
                      validator: validateDate,
                      controller: controller.tanggalControl == null ? '' : controller.tanggalControl,
                      suffixIcon: Icon(
                        FontAwesomeIcons.calendarAlt,
                        color: primaryColor,
                      ),
                      keyboardType: TextInputType.datetime,
                      maxLines: 1,
                      labelText: 'birth_date'.tr,
                    ),
                    SizedBox(height: 10),
                    XauTextField(
                      readOnly: !controller.auth.userData.orangKycEditAvailable,
                      useObscure: false,
                      validator: validateAddress,
                      controller: controller.alamatControl == null ? '' : controller.alamatControl,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      labelText: 'home_address'.tr,
                    ),
                    SizedBox(height: 10),
                    XauTextField(
                      readOnly: !controller.auth.userData.orangKycEditAvailable,
                      useObscure: false,
                      validator: validateCity,
                      controller: controller.kotaControl == null ? '' : controller.kotaControl,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      labelText: 'city'.tr,
                    ),
                    SizedBox(height: 10),
                    XauTextField(
                      readOnly: !controller.auth.userData.orangKycEditAvailable,
                      useObscure: false,
                      validator: validateKode,
                      controller: controller.kodePosControl == null ? '' : controller.kodePosControl,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      labelText: 'postal_code'.tr,
                    ),
                    SizedBox(height: 10),
                    XauTextField(
                      ontap: !controller.auth.userData.orangKycEditAvailable
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
                      readOnly: true,
                      useObscure: false,
                      validator: validateCountry,
                      controller: controller.negaraControl == null ? '' : controller.negaraControl,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      labelText: 'country'.tr,
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
                          color: primaryColor,
                          fontSize: 40,
                        );
                      }
                      return RaisedButton(
                        onPressed: !controller.auth.userData.orangKycEditAvailable
                            ? () {}
                            : () {
                                controller.kycPersonalData();
                              },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        color: !!controller.auth.userData.orangKycEditAvailable ? primaryColor : disableColor,
                        child: Center(
                          child: Text(
                            'save_btn'.tr,
                            style: buttonStyle,
                          ),
                        ),
                      );
                    }),
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
