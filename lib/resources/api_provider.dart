import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_xaurius/api/host.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_xaurius/model/auth/signup_model.dart';
import 'package:flutter_xaurius/model/auth/login_model.dart';
import 'package:flutter_xaurius/model/kyc/response_kyc_1_model.dart';
import 'package:flutter_xaurius/model/kyc/response_kyc_2_model.dart';

class ApiProvider {
  final _url = hostAPI;

  Future<SignUpModel> addEmail(email) async {
    final response = await http.post(Uri.parse("$_url/auth/register"), body: {'email': email});
    print(response.body);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      SignUpModel authResponse = SignUpModel.fromJson(jsonResponse);
      return authResponse;
    } else {
      return null;
    }
  }

  Future<SignUpModel> addCode(email, otp) async {
    final response = await http.post(Uri.parse("$_url/auth/register_verification"), body: {'email': email, 'otp': otp});
    print(response.body);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      SignUpModel authResponse = SignUpModel.fromJson(jsonResponse);
      return authResponse;
    } else {
      return null;
    }
  }

  Future<SignUpModel> addpin(email, otp, pin, pinConfirm) async {
    final response = await http.post(Uri.parse("$_url/auth/register_pin"), body: {
      'email': email,
      'otp': otp,
      'pin': pin,
      'pin_confirm': pinConfirm,
    });
    print(response.body);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      SignUpModel authResponse = SignUpModel.fromJson(jsonResponse);
      return authResponse;
    } else {
      return null;
    }
  }

  Future<LoginModel> login(email, pin) async {
    final response = await http.post(Uri.parse("$_url/auth/login"), body: {
      'email': email,
      'pin': pin,
    });
    print(response.body);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      LoginModel authResponse = LoginModel.fromJson(jsonResponse);
      return authResponse;
    } else {
      return null;
    }
  }

  Future<ResponseKyc1> getKyc1(String jwt) async {
    final response = await http.get(
      Uri.parse('$_url/kyc/kyc_1_personal_info'),
      headers: {"JWT": jwt},
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      ResponseKyc1 kyc1Response = ResponseKyc1.fromJson(jsonResponse);

      print(jsonResponse);
      return kyc1Response;
    } else {
      return null;
    }
  }

  Future<ResponseKyc2> getKyc2(String jwt) async {
    final response = await http.get(
      Uri.parse('$_url/kyc/kyc_1_personal_info'),
      headers: {"JWT": jwt},
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      ResponseKyc2 kyc2Response = ResponseKyc2.fromJson(jsonResponse);

      print(jsonResponse);
      return kyc2Response;
    } else {
      return null;
    }
  }

  Future<ResponseKyc1> kyc1(nama, nomor, tanggal, alamat, kota, kodePos, negara, jwt) async {
    final response = await http.post(Uri.parse("$_url/kyc/kyc_1_personal_info"), headers: {
      "JWT": jwt
    }, body: {
      'orang[orang_name]': nama,
      'orang[orang_phone]': nomor,
      'orang[orang_birthday]': tanggal,
      'orang[orang_addr_street]': alamat,
      'orang[orang_addr_city]': kota,
      'orang[orang_addr_postal]': kodePos,
      'orang[orang_addr_country]': negara,
    });
    print(response.body);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      ResponseKyc1 kyc1Response = ResponseKyc1.fromJson(jsonResponse);
      return kyc1Response;
    } else {
      return null;
    }
  }

  Future<ResponseKyc2> kyc2(idType, idNum, File idFile, npwpNum, File npwpFile, jwt) async {
    final request = http.MultipartRequest('POST', Uri.parse("$_url/kyc/kyc_2_identity_document"));
    request.headers['JWT'] = jwt;
    request.fields['orang[orang_id_type]'] = idType;
    request.fields['orang[orang_id_num]'] = idNum;
    request.files.add(
      await http.MultipartFile.fromPath('orang[orang_id_file]', idFile.path),
    );
    request.fields['orang[orang_npwp_num]'] = npwpNum;
    request.files.add(await http.MultipartFile.fromPath('orang[orang_npwp_file]', npwpFile.path));
    var response = await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      final jsonResponse = await json.decode(response.body);
      ResponseKyc2 kyc2Response = ResponseKyc2.fromJson(jsonResponse);
      print(jsonResponse);
      return kyc2Response;
    } else {
      return null;
    }
  }
}
