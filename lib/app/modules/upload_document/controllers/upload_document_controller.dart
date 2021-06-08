import 'dart:io';
import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadDocumentController extends GetxController {
  final GlobalKey<FormState> kyc2Key = GlobalKey<FormState>();
  ApiRepository _repo = ApiRepository();
  final auth = Get.find<AuthController>();
  var isLoading = false.obs;
  var idTypeValue = 'KTP'.obs;

  List<String> listIdType = [
    'KTP',
    'Passport',
  ];

  var selectedImagePathKtp = ''.obs;
  var selectedImageNetworkKtp = ''.obs;
  var selectedImagePathNpwp = ''.obs;
  var selectedImageNetworkNpwp = ''.obs;

  TextEditingController nomorKTP;
  TextEditingController nomorNPWP;

  void updateValueId(RxString changeIdType) {
    idTypeValue.value = changeIdType.value;
    update();
  }

  @override
  void onInit() {
    setTextController();
    auth.getProfileData();
    setText();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Future kycDocument(idType) async {
  //   isLoading(true);
  //   final resp = await _repo.kycDocument(idType, nomorKTP.text, File(selectedImagePathKtp.value), nomorNPWP.text, File(selectedImagePathNpwp.value), auth.token);
  //   if(resp.success) {
  //     successSnackbar('Sukses', 'Berhasil melengkapi data kyc tahap pertama');
  //   } else {
  //     dialogConnection('Oops', resp.message, () {
  //       Get.back();
  //     });
  //   }
  //   isLoading(false);
  // }


  void setTextController() {
    nomorKTP = TextEditingController();
    nomorNPWP = TextEditingController();
  }

  void setText() {
    nomorKTP.text = auth.userData.orangIdNum;
    nomorNPWP.text = auth.userData.orangNpwpNum;
    auth.userData.orangIdType != null ? idTypeValue.value = auth.userData.orangIdType : idTypeValue.value = 'KTP';
    auth.userData.orangIdFile.url != null ? selectedImageNetworkKtp.value = auth.userData.orangIdFile.url : selectedImageNetworkKtp.value = '';
    auth.userData.orangNpwpFile.url != null ? selectedImageNetworkNpwp.value = auth.userData.orangNpwpFile.url : selectedImageNetworkNpwp.value = '';
    update();
  }

  void takeImageKTP() async {
    try {
      final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedImagePathKtp.value = pickedFile.path;
        print('image selected.');
      } else {
        failSnackbar('Fail', 'Kamu belum memilih foto');
      }
      update();
    } catch (e) {
      failSnackbar('Fail', 'Terjadi Kesalahan $e');
    }
  }

  void takeImageNPWP() async {
    try {
      final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedImagePathNpwp.value = pickedFile.path;
        print('image selected.');
      } else {
        failSnackbar('Fail', 'Kamu belum memilih foto');
      }
      update();
    } catch (e) {
      failSnackbar('Fail', 'Terjadi Kesalahan $e');
    }
  }

  void checkDocumentIdentity() {
    if (selectedImagePathKtp.value.isEmpty) {
      failSnackbar('KTP', "Kamu belum meilih foto Identitas");
    } else if (selectedImagePathNpwp.value.isEmpty) {
      failSnackbar('NPWP', 'Kamu belum memilih foto NPWP');
    } else {
      final isValid = kyc2Key.currentState.validate();
      if (!isValid) {
        return;
      }
      kyc2Key.currentState.save();
      kycDocument();
    }
  }

  void kycDocument() async {
    isLoading(true);
    var resp = await _repo.kycDocument(
        idTypeValue.value.toString(), nomorKTP.text, File(selectedImagePathKtp.value), nomorNPWP.text, File(selectedImagePathNpwp.value), auth.token);
    if (resp.success) {
      onInit();
      Get.back();
      successSnackbar('Berhasil', 'Kamu berhasil melengkapi Dokumen Identitas');
    } else {
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoading(false);
  }
}
