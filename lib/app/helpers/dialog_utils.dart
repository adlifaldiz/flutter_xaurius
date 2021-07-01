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

dialogPermission(String title, String subTitle, VoidCallback onTap) {
  Get.defaultDialog(
    backgroundColor: backgroundPanelColor,
    title: title ?? 'Grant Permission',
    middleText: subTitle ?? 'Grant Camera permision for Scan QR Code',
    textConfirm: 'Open Settings',
    confirmTextColor: textBlackColor,
    buttonColor: primaryColor,
    barrierDismissible: true,
    confirm: RaisedButton(
      color: primaryColor,
      onPressed: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(
        'Open Settings',
        style: buttonStyle,
      ),
    ),
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
    confirm: RaisedButton(
      color: primaryColor,
      onPressed: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(
        'ok',
        style: buttonStyle,
      ),
    ),
  );
}
