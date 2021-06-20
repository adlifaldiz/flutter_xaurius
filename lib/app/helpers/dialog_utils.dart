import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/modules/setting/controllers/setting_controller.dart';
import 'package:get/get.dart';

successSnackbar(String title, String message) {
  Get.snackbar(
    title,
    message,
    backgroundColor: backgroundPanelColor.withOpacity(0.7),
    colorText: brokenWhiteColor,
  );
}

failSnackbar(String title, String message) {
  Get.snackbar(
    title,
    message,
    backgroundColor: redColor.withOpacity(0.7),
    colorText: brokenWhiteColor,
  );
}

dialogConnection(String title, String subTitle, VoidCallback onTap) {
  Get.defaultDialog(
    backgroundColor: backgroundPanelColor,
    title: title ?? 'Oops',
    middleText: subTitle ?? 'Cek kembali koneksi internet',
    textConfirm: 'Ok',
    confirmTextColor: textBlackColor,
    buttonColor: primaryColor,
    barrierDismissible: false,
    onWillPop: onTap,
    onConfirm: onTap,
  );
}

showLogout(SettingController settingController) {
  Get.defaultDialog(
    title: 'you_sure'.tr,
    middleText: 'close_app'.tr,
    backgroundColor: backgroundPanelColor,
    cancel: RaisedButton(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: () => Get.back(),
      child: Text(
        'no_btn'.tr,
        style: stylePrimary,
      ),
    ),
    confirm: RaisedButton(
      color: primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: settingController.logout,
      child: Text(
        'yes_btn'.tr,
        style: buttonStyle,
      ),
    ),
  );
}
