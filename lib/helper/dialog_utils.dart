import 'package:flutter/material.dart';
import 'package:flutter_xaurius/helper/theme.dart';
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
