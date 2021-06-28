import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';

import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/helpers/validator.dart';
import 'package:flutter_xaurius/app/widget/xau_text_field.dart';

import '../controllers/upload_document_controller.dart';

class UploadDocumentView extends GetView<UploadDocumentController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AbsorbPointer(
        absorbing: controller.isLoading.value,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              title: Text('identity_document'.tr),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 2)),
                child: Form(
                  key: controller.kyc2Key,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5)),
                        width: percentWidth(context, 100),
                        decoration: BoxDecoration(
                            color: backgroundPanelColor.withOpacity(0.3),
                            border: Border.all(color: brokenWhiteColor),
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            iconEnabledColor: primaryColor,
                            iconDisabledColor: brokenWhiteColor,
                            dropdownColor: backgroundPanelColor,
                            value: controller.valueIdType.toString(),
                            items: controller.listIdType.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: !controller.auth.userData.orangKycEditAvailable
                                ? null
                                : (value) {
                                    controller.valueIdType.value = value;
                                  },
                          ),
                        ),
                      ),
                      SizedBox(height: percentHeight(context, 2)),
                      XauTextField(
                        readOnly: !controller.auth.userData.orangKycEditAvailable,
                        useObscure: false,
                        validator: validateKTP,
                        controller: controller.nomorKTP,
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        labelText: 'id_num'.tr,
                      ),
                      SizedBox(height: percentHeight(context, 2)),
                      controller.selectedImagePathKtp.value.isEmpty
                          ? Column(
                              children: [
                                Icon(
                                  CupertinoIcons.photo,
                                  size: percentWidth(context, 50),
                                  color: brokenWhiteColor,
                                ),
                                Text('id_pict_notif'.tr),
                              ],
                            )
                          : controller.selectedImagePathKtp.value != controller.auth.userData.orangIdFile.url
                              ? ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.file(File(controller.selectedImagePathKtp.value)))
                              : ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.network(controller.selectedImagePathKtp.value)),
                      !controller.auth.userData.orangKycEditAvailable
                          ? Container()
                          : FlatButton(
                              color: primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                controller.takeImageKTP();
                              },
                              child: Text(
                                controller.selectedImagePathKtp.value != '' ? 'change_btn'.tr : 'choose_btn'.tr,
                                style: stylePrimaryDark,
                              ),
                            ),
                      SizedBox(height: percentHeight(context, 2)),
                      XauTextField(
                        readOnly: !controller.auth.userData.orangKycEditAvailable,
                        useObscure: false,
                        validator: controller.selectedImagePathNpwp.isNotEmpty ? validateNPWP : null,
                        controller: controller.nomorNPWP,
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        labelText: 'npwp_notif'.tr + ' (optional)',
                      ),
                      SizedBox(height: percentHeight(context, 2)),
                      controller.selectedImagePathNpwp.value.isEmpty
                          ? Column(
                              children: [
                                Icon(
                                  CupertinoIcons.photo,
                                  size: percentWidth(context, 50),
                                  color: brokenWhiteColor,
                                ),
                                Text('npwp_pict_notif'.tr),
                              ],
                            )
                          : controller.selectedImagePathNpwp.value != controller.auth.userData.orangNpwpFile.url
                              ? ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.file(File(controller.selectedImagePathNpwp.value)))
                              : ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.network(controller.selectedImagePathNpwp.value)),
                      !controller.auth.userData.orangKycEditAvailable
                          ? Container()
                          : FlatButton(
                              color: primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                controller.takeImageNPWP();
                              },
                              child: Text(
                                controller.selectedImagePathNpwp.value != '' ? 'change_btn'.tr : 'choose_btn'.tr,
                                style: stylePrimaryDark,
                              ),
                            ),
                      SizedBox(height: percentHeight(context, 5)),
                      Obx(() {
                        if (controller.isLoading.value) {
                          return JumpingDotsProgressIndicator(
                            numberOfDots: 3,
                            fontSize: 40,
                            color: primaryColor,
                          );
                        }
                        return RaisedButton(
                          onPressed: !controller.auth.userData.orangKycEditAvailable
                              ? null
                              : () {
                                  controller.checkIdentity();
                                },
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          color: controller.auth.userData.orangKycEditAvailable ? primaryColor : disableColor,
                          child: Center(
                            child: Text(
                              'save_btn'.tr,
                              style: buttonStyle,
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
