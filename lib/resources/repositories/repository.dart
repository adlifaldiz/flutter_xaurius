import 'dart:async';

import 'package:dio/dio.dart';

import '../api_provider.dart';

class Repository {
  // final title = '';
  final apiProvider = ApiProvider();
  final dio = Dio();

  Future addSaveEmail(email) => apiProvider.addEmail(email);
  Future addVerifCode(email, otp) => apiProvider.addCode(email, otp);
  Future login(email, pin) => apiProvider.login(email, pin);
}
