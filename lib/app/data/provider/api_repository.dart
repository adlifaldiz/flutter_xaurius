import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_xaurius/api/host.dart';
import 'package:flutter_xaurius/app/data/model/base_resp.dart';
import 'package:flutter_xaurius/app/data/provider/api_provider.dart';
import 'package:flutter_xaurius/app/data/model/auth/login_resp.dart';
import 'package:flutter_xaurius/model/kyc/response_kyc_1_model.dart';
import 'package:flutter_xaurius/model/kyc/response_kyc_2_model.dart';
import 'package:get/get.dart';

import 'api_url.dart' as url;

class ApiRepository {
  final _http = ApiProvider(hostAPI);

  Future<BaseResp> register(email) async {
    final response = await _http.call(
      url.register,
      method: MethodRequest.POST,
      request: {'email': email},
    );
    final jsonResponse = json.decode(response.body);
    return BaseResp.fromJson(jsonResponse);
  }

  Future<BaseResp> registerVerification(email, otp) async {
    final response = await _http.call(
      url.registerVerification,
      method: MethodRequest.POST,
      request: {'email': email, 'otp': otp},
    );
    final jsonResponse = json.decode(response.body);
    return BaseResp.fromJson(jsonResponse);
  }

  Future<BaseResp> registerPin(email, otp, pin, pinConfirm) async {
    final response = await _http.call(
      url.registerPin,
      method: MethodRequest.POST,
      request: {
        'email': email,
        'otp': otp,
        'pin': pin,
        'pin_confirm': pinConfirm,
      },
    );
    final jsonResponse = json.decode(response.body);
    return BaseResp.fromJson(jsonResponse);
  }

  Future<LoginModel> login(email, pin) async {
    final response = await _http.call(
      url.login,
      method: MethodRequest.POST,
      request: {
        'email': email,
        'pin': pin,
      },
    );
    final jsonResponse = json.decode(response.body);
    return LoginModel.fromJson(jsonResponse);
  }

  Future<ResponseKyc1> getPersonalInfo(String token) async {
    final response = await _http.call(
      url.kycPersonalInfo,
      token: token,
      method: MethodRequest.GET,
    );
    final jsonResponse = json.decode(response.body);
    return ResponseKyc1.fromJson(jsonResponse);
  }

  Future<ResponseKyc1> kycPersonalData(
      nama, nomor, tanggal, alamat, kota, kodePos, negara, token) async {
    final response = await _http.call(
      url.kycPersonalInfo,
      token: token,
      request: {
        'orang[orang_name]': nama,
        'orang[orang_phone]': nomor,
        'orang[orang_birthday]': tanggal,
        'orang[orang_addr_street]': alamat,
        'orang[orang_addr_city]': kota,
        'orang[orang_addr_postal]': kodePos,
        'orang[orang_addr_country]': negara,
      },
    );
    final jsonResponse = json.decode(response.body);
    return ResponseKyc1.fromJson(jsonResponse);
  }

  Future<ResponseKyc2> kycDocument(
      idType, idNum, File idFile, npwpNum, File npwpFile, jwt) async {
    final response = await _http.call(url.kycDocument,
        token: jwt,
        method: MethodRequest.POST,
        useFormData: true,
        request: {
          'orang[orang_id_type]': idType,
          'orang[orang_id_num]': idNum,
          'orang[orang_id_file]':
              MultipartFile(idFile.path, filename: idFile.path.split('/').last),
          'orang[orang_npwp_num]': npwpNum,
          'orang[orang_npwp_file]': MultipartFile(npwpFile.path,
              filename: npwpFile.path.split('/').last),
        });
    final jsonResponse = json.decode(response.body);
    return ResponseKyc2.fromJson(jsonResponse);
  }
}
