import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/service/localization_service.dart';

import 'package:get/get.dart';

import '../controllers/onboard_language_controller.dart';

class OnboardLanguageView extends GetView<OnboardLanguageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              alignment: Alignment.bottomRight,
              image: AssetImage(
                'assets/images/mesh-bottom.png',
              ),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5)),
          width: Get.width,
          height: Get.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/xaurius_logo_yellow.png',
                width: percentWidth(context, 25),
              ),
              SizedBox(height: 50),
              Text(
                'on_boarding_lang_title'.tr,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 30),
              Text(
                'on_boarding_lang_subtitle'.tr,
              ),
              SizedBox(height: 10),
              Obx(
                () => Container(
                  padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5)),
                  width: percentWidth(context, 100),
                  decoration: BoxDecoration(color: fillColor, border: Border.all(color: brokenWhiteColor), borderRadius: BorderRadius.circular(10)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      iconEnabledColor: primaryColor,
                      iconDisabledColor: brokenWhiteColor,
                      dropdownColor: backgroundPanelColor,
                      value: controller.langValue.value,
                      items: LocalizationService.langs.map((value) {
                        return DropdownMenuItem<String>(
                          child: Text(value),
                          value: value,
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        controller.onLangChange(newValue);
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: RaisedButton(
                  color: accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text('next_btn'.tr, style: buttonStyle),
                  ),
                  onPressed: () {
                    return controller.onProceed();
                  },
                ),
              ),
              SizedBox(height: 40),
              Container(
                width: Get.width,
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
    );
  }
}
