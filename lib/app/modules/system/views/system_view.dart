import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/service/localization_service.dart';
import 'package:flutter_xaurius/app/widget/menu_tile.dart';
import 'package:flutter_xaurius/app/widget/xau_container.dart';
import 'package:flutter_xaurius/app/widget/xau_container_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/system_controller.dart';

class SystemView extends GetView<SystemController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('setting_system'.tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 2)),
        child: Column(
          children: [
            // XauriusContainerList(
            //   child: Obx(
            //     () => MenuTile(
            //       icon: !controller.lightMode.value ? FontAwesomeIcons.sun : FontAwesomeIcons.moon,
            //       title: 'system_light_mode'.tr,
            //       suffix: CupertinoSwitch(
            //         onChanged: (bool value) async => controller.onSwitchChange(value),
            //         value: controller.lightMode.value,
            //         activeColor: primaryColor,
            //         trackColor: greyColor,
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(height: 20),
            XauriusContainerList(
                padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 2)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('system_choose_lang'.tr),
                    Obx(
                      () => Container(
                        padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5)),
                        width: percentWidth(context, 100),
                        decoration:
                            BoxDecoration(color: fillColor, border: Border.all(color: brokenWhiteColor), borderRadius: BorderRadius.circular(10)),
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
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
