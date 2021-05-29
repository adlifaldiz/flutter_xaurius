import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xaurius/api/host.dart';
import 'package:flutter_xaurius/controller/kyc_controller.dart';
import 'package:flutter_xaurius/helper/screen_utils.dart';
import 'package:flutter_xaurius/helper/theme.dart';
import 'package:flutter_xaurius/widget/xau_text_field.dart';
import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class IdentityScreen extends StatefulWidget {
  @override
  _IdentityScreenState createState() => _IdentityScreenState();
}

class _IdentityScreenState extends State<IdentityScreen> {
  KycController _kycController = Get.put(KycController());

  @override
  void initState() {
    _kycController.checkKyc1();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dokumen Identitas'),
        ),
        body: Obx(() {
          if (_kycController.isLoading.value) {
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
                key: _kycController.kyc2Key,
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
                          value: _kycController.valueId.floor(),
                          items: [
                            DropdownMenuItem(
                              child: Text('KTP'),
                              value: 1,
                              onTap: () {
                                setState(() {
                                  _kycController.valueId = 1;
                                });
                              },
                            ),
                            DropdownMenuItem(
                              child: Text('Passport'),
                              value: 2,
                              onTap: () {
                                setState(() {
                                  _kycController.valueId = 2;
                                });
                              },
                            ),
                          ],
                          onChanged: !_kycController.isKycStatus.value
                              ? null
                              : (value) {
                                  _kycController.valueId = _kycController.valueId;
                                },
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    XauTextField(
                      readOnly: !_kycController.isKycStatus.value,
                      useObscure: false,
                      validator: _validateKTP,
                      controller: _kycController.nomorKTP == null ? '' : _kycController.nomorKTP,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      labelText: 'Nomor identitas',
                    ),
                    SizedBox(height: 10),
                    _kycController.selectedImageNetworkKtp.value != ''
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(20), child: Image.network(hostImage + _kycController.selectedImageNetworkKtp.value))
                        : Container(
                            child: Column(
                              children: [
                                _kycController.selectedImagePathKtp.value != ''
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(20), child: Image.file(File(_kycController.selectedImagePathKtp.value)))
                                    : Text('Kamu belum melampirkan foto identitas'),
                                FlatButton(
                                  color: primaryColor,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  onPressed: () {
                                    _kycController.takeImageKTP();
                                  },
                                  child: Text(
                                    _kycController.selectedImagePathKtp.value != '' ? 'Ganti gambar' : 'Pilih gambar',
                                    style: stylePrimaryDark,
                                  ),
                                ),
                              ],
                            ),
                          ),
                    SizedBox(height: 10),
                    XauTextField(
                      readOnly: !_kycController.isKycStatus.value,
                      useObscure: false,
                      validator: _validateNPWP,
                      controller: _kycController.nomorNPWP == null ? '' : _kycController.nomorNPWP,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      labelText: 'Nomor NPWP',
                    ),
                    SizedBox(height: 10),
                    _kycController.selectedImageNetworkKtp.value != ''
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(20), child: Image.network(hostImage + _kycController.selectedImageNetworkNpwp.value))
                        : Container(
                            child: Column(
                              children: [
                                _kycController.selectedImagePathNpwp.value != ''
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(20), child: Image.file(File(_kycController.selectedImagePathNpwp.value)))
                                    : Text('Kamu belum melampirkan foto NPWP'),
                                FlatButton(
                                  color: primaryColor,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  onPressed: () {
                                    _kycController.takeImageNPWP();
                                  },
                                  child: Text(
                                    _kycController.selectedImagePathNpwp.value != '' ? 'Ganti gambar' : 'Pilih gambar',
                                    style: stylePrimaryDark,
                                  ),
                                ),
                              ],
                            ),
                          ),
                    SizedBox(height: 30),
                    Obx(() {
                      if (_kycController.isLoadingForm.value) {
                        return JumpingDotsProgressIndicator(
                          numberOfDots: 3,
                          fontSize: 40,
                          color: primaryColor,
                        );
                      }
                      return RaisedButton(
                        onPressed: () {
                          _kycController.checkIdentity();
                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        color: _kycController.isKycStatus.value ? primaryColor : disableColor,
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
