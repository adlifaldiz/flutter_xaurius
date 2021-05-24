import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_xaurius/model/auth/signup_model.dart';
import 'package:flutter_xaurius/model/auth/login_model.dart';
import 'package:flutter_xaurius/model/kyc/response_kyc_1_model.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  final _url = 'https://sim-b.xaurius.com/api/v1/';

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

      print(kyc1Response.msg);
      return kyc1Response;
    } else {
      return null;
    }
  }
}
