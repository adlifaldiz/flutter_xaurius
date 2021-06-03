import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/data/provider/api_url.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/widget/xau_text_field.dart';

import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../controllers/upload_document_controller.dart';

class UploadDocumentView extends GetView<UploadDocumentController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dokumen Identitas'),
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
                key: controller.kycController.kyc2Key,
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
                          value: controller.kycController.valueId.floor(),
                          items: [
                            DropdownMenuItem(
                              child: Text('KTP'),
                              value: 1,
                              onTap: () => controller.updateValueId(1),
                            ),
                            DropdownMenuItem(
                              child: Text('Passport'),
                              value: 2,
                              onTap: () => controller.updateValueId(2),
                            ),
                          ],
                          onChanged: !controller.kycController.isKycStatus.value
                              ? null
                              : (value) {
                            controller.kycController.valueId = controller.kycController.valueId;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    XauTextField(
                      readOnly: !controller.kycController.isKycStatus.value,
                      useObscure: false,
                      validator: _validateKTP,
                      controller: controller.kycController.nomorKTP == null ? '' : controller.kycController.nomorKTP,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      labelText: 'Nomor identitas',
                    ),
                    SizedBox(height: 10),
                    controller.kycController.selectedImageNetworkKtp.value != ''
                        ? ClipRRect(
                        borderRadius: BorderRadius.circular(20), child: Image.network(hostImage + controller.kycController.selectedImageNetworkKtp.value))
                        : Container(
                      child: Column(
                        children: [
                          controller.kycController.selectedImagePathKtp.value != ''
                              ? ClipRRect(
                              borderRadius: BorderRadius.circular(20), child: Image.file(File(controller.kycController.selectedImagePathKtp.value)))
                              : Text('Kamu belum melampirkan foto identitas'),
                          FlatButton(
                            color: primaryColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              controller.kycController.takeImageKTP();
                            },
                            child: Text(
                              controller.kycController.selectedImagePathKtp.value != '' ? 'Ganti gambar' : 'Pilih gambar',
                              style: stylePrimaryDark,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    XauTextField(
                      readOnly: !controller.kycController.isKycStatus.value,
                      useObscure: false,
                      validator: _validateNPWP,
                      controller: controller.kycController.nomorNPWP == null ? '' : controller.kycController.nomorNPWP,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      labelText: 'Nomor NPWP',
                    ),
                    SizedBox(height: 10),
                    controller.kycController.selectedImageNetworkKtp.value != ''
                        ? ClipRRect(
                        borderRadius: BorderRadius.circular(20), child: Image.network(hostImage + controller.kycController.selectedImageNetworkNpwp.value))
                        : Container(
                      child: Column(
                        children: [
                          controller.kycController.selectedImagePathNpwp.value != ''
                              ? ClipRRect(
                              borderRadius: BorderRadius.circular(20), child: Image.file(File(controller.kycController.selectedImagePathNpwp.value)))
                              : Text('Kamu belum melampirkan foto NPWP'),
                          FlatButton(
                            color: primaryColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              controller.kycController.takeImageNPWP();
                            },
                            child: Text(
                              controller.kycController.selectedImagePathNpwp.value != '' ? 'Ganti gambar' : 'Pilih gambar',
                              style: stylePrimaryDark,
                            ),
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
                        onPressed: () {
                          controller.kycController.checkIdentity();
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

  String _validateKTP(String value) {
    if (value.isEmpty) {
      return 'Nomor KTP tidak boleh kosong';
    } else {
      return null;
    }
  }

  String _validateNPWP(String value) {
    if (value.isEmpty) {
      return 'Nomor NPWP tidak boleh kosong';
    } else {
      return null;
    }
  }
}
