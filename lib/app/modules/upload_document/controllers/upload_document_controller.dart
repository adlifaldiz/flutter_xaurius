import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;

import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';

class UploadDocumentController extends GetxController {
  Directory _appDocsDir;
  final _repo = ApiRepository();
  final auth = Get.find<AuthController>();
  final GlobalKey<FormState> kyc2Key = GlobalKey<FormState>();
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  Country selectedCupertinoCurrency;
  List<String> listIdType = ['KTP', 'Passport'];
  var randImg = new Random();
  var isLoading = false.obs;
  var useNpwp = false.obs;
  var mode = AutovalidateMode.disabled;
  var valueIdType = 'KTP'.obs;
  var selectedImagePathKtp = ''.obs;
  var sizeID = '0.0'.obs;
  var selectedImagePathNpwp = ''.obs;
  var sizeNpwp = '0.0'.obs;

  File ktpPath;
  File npwpPath;

  //kyc2
  TextEditingController nomorKTP;
  TextEditingController nomorNPWP;

  @override
  Future onInit() async {
    _appDocsDir = await getApplicationDocumentsDirectory();
    selectedCupertinoCurrency = CountryPickerUtils.getCountryByIsoCode('ID');
    setTextControlelr();
    setText();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setTextControlelr() {
    nomorKTP = TextEditingController();
    nomorNPWP = TextEditingController();
  }

  void onNpwpChange(bool value) {
    useNpwp.value = value;
    update();
  }

  File fileFromDocsDir(String filename) {
    String pathName = p.join(_appDocsDir.path, filename);
    return File(pathName);
  }

  void setText() {
    if (auth.userData.orangIdType == null || auth.userData.orangIdType.isEmpty) {
      valueIdType.value = listIdType.first;
    } else {
      valueIdType.value = auth.userData.orangIdType;
    }
    nomorKTP.text = auth.userData.orangIdNum;
    nomorNPWP.text = auth.userData.orangNpwpNum;
    selectedImagePathKtp(auth.userData.orangIdFile);
    selectedImagePathNpwp(auth.userData.orangNpwpFile);
    update();
  }

  Future kycDocument(idFile, nFile) async {
    print(idFile);
    isLoading(true);
    final resp = await _repo.kycDocument(valueIdType.value.toString(), nomorKTP.text, idFile, nomorNPWP.text, nFile, auth.token);
    if (resp.success) {
      await onInit();
      await auth.getProfileData();
      Get.back();
      Get.back();
      successSnackbar('success'.tr, 'suc_ud'.tr);
    } else {
      dialogConnection('Oops', resp.message, () {
        Get.back();
      });
    }
    isLoading(false);
  }

  void checkIdentity() {
    final isValid = kyc2Key.currentState.validate();
    var ktpFile = ''.obs;
    var npwpFile = ''.obs;

    if (selectedImagePathKtp.value == auth.userData.orangIdFile && auth.userData.orangIdFile != null) {
      ktpFile('');
    } else {
      ktpFile.value = File(selectedImagePathKtp.value).path;
    }
    if (selectedImagePathNpwp.value == auth.userData.orangNpwpFile && auth.userData.orangNpwpFile != null) {
      npwpFile('');
    } else {
      npwpFile.value = File(selectedImagePathNpwp.value).path;
    }

    if (selectedImagePathKtp.value.isEmpty) {
      successSnackbar('ID', 'id_pict'.tr);
    } else if (double.parse(sizeID.value) > 1) {
      successSnackbar('ID', 'Max size 1 Mb');
    } else if (nomorNPWP.text.isNotEmpty && selectedImagePathNpwp.isEmpty) {
      successSnackbar('NPWP', 'npwp_pict'.tr);
    } else if (selectedImagePathNpwp.isNotEmpty && nomorNPWP.text.isEmpty) {
      return;
    } else if (double.parse(sizeNpwp.value) > 1) {
      successSnackbar('NPWP', 'Max size 1 Mb');
    } else {
      if (isValid) {
        kyc2Key.currentState.save();
        kycDocument(ktpFile.value, npwpFile.value);
      } else {
        return;
      }
    }
  }

  void captureImageKTP() async {
    try {
      final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
      if (pickedFile != null) {
        cropImageKtp(pickedFile.path);
        // selectedImagePathKtp.value = pickedFile.path;
        // sizeID.value = ((File(selectedImagePathKtp.value).readAsBytesSync().lengthInBytes / 1024) / 1024).toStringAsFixed(2);

        print('image selected:' + pickedFile.path.toString());
      } else {
        successSnackbar('ID', 'id_pict'.tr);
        print('No image selected.');
      }
      update();
    } catch (e) {
      successSnackbar('Fail', 'fail_wrong'.tr);
    }
  }

  void takeImageKTP() async {
    try {
      final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        cropImageKtp(pickedFile.path);

        // selectedImagePathKtp.value = pickedFile.path;
        // sizeID.value = ((File(selectedImagePathKtp.value).readAsBytesSync().lengthInBytes / 1024) / 1024).toStringAsFixed(2);

        print('image selected:' + pickedFile.path.toString());
      } else {
        successSnackbar('ID', 'id_pict'.tr);
        print('No image selected.');
      }
      update();
    } catch (e) {
      successSnackbar('Fail', 'fail_wrong'.tr);
    }
  }

  void captureImageNPWP() async {
    try {
      final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
      if (pickedFile != null) {
        cropImageNpwp(pickedFile.path);

        // selectedImagePathNpwp.value = pickedFile.path;
        // sizeNpwp.value = ((File(selectedImagePathNpwp.value).readAsBytesSync().lengthInBytes / 1024) / 1024).toStringAsFixed(2);

        print('image selected:' + pickedFile.path.toString());
      } else {
        successSnackbar('NPWP', 'npwp_pict'.tr);
        print('No image selected.');
      }
      update();
    } catch (e) {
      successSnackbar('Fail', 'fail_wrong'.tr);
    }
  }

  void takeImageNPWP() async {
    try {
      final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        cropImageNpwp(pickedFile.path);

        // selectedImagePathNpwp.value = pickedFile.path;
        // sizeNpwp.value = ((File(selectedImagePathNpwp.value).readAsBytesSync().lengthInBytes / 1024) / 1024).toStringAsFixed(2);

        print('image selected:' + pickedFile.path.toString());
      } else {
        successSnackbar('NPWP', 'npwp_pict'.tr);
        print('No image selected.');
      }
      update();
    } catch (e) {
      // successSnackbar('Fail', 'fail_wrong'.tr);
      print('No image selected.');
    }
  }

  void cropImageKtp(String path) async {
    try {
      final croppedFile = await ImageCropper.cropImage(
          sourcePath: path,
          compressQuality: 50,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          androidUiSettings: AndroidUiSettings(
              toolbarTitle: 'Crop Image',
              toolbarColor: backgroundColor,
              toolbarWidgetColor: textWhiteColor,
              // backgroundColor: backgroundPanelColor,
              activeControlsWidgetColor: primaryColor,
              dimmedLayerColor: backgroundColor.withOpacity(0.3),
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          iosUiSettings: IOSUiSettings(
            aspectRatioLockEnabled: false,
            resetAspectRatioEnabled: true,
            showCancelConfirmationDialog: true,
          ));

      if (croppedFile != null) {
        selectedImagePathKtp.value = croppedFile.path;
        sizeID.value = ((File(selectedImagePathKtp.value).readAsBytesSync().lengthInBytes / 1024) / 1024).toStringAsFixed(2);
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('No image selected.');
    }
  }

  void cropImageNpwp(String path) async {
    try {
      final croppedFile = await ImageCropper.cropImage(
          sourcePath: path,
          compressQuality: 50,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          androidUiSettings: AndroidUiSettings(
              toolbarTitle: 'Crop Image',
              toolbarColor: backgroundColor,
              toolbarWidgetColor: textWhiteColor,
              // backgroundColor: backgroundPanelColor,
              activeControlsWidgetColor: primaryColor,
              dimmedLayerColor: backgroundColor.withOpacity(0.3),
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          iosUiSettings: IOSUiSettings(
            minimumAspectRatio: 1.0,
          ));

      if (croppedFile != null) {
        selectedImagePathNpwp.value = croppedFile.path;
        sizeNpwp.value = ((File(selectedImagePathNpwp.value).readAsBytesSync().lengthInBytes / 1024) / 1024).toStringAsFixed(2);
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('No image selected.');
    }
  }
}
