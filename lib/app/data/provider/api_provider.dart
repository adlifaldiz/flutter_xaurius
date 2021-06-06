import 'dart:async';

import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:flutter_xaurius/app/helpers/debug_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

enum MethodRequest { POST, GET, PUT, DELETE }

class ApiProvider extends GetConnect {

  ApiProvider(String baseUrl){
    httpClient.baseUrl = baseUrl;
  }

  Future<Response> call(String url, {MethodRequest method = MethodRequest.POST, Map<String, dynamic> request, Map<String, String> header, String token, bool useFormData = false,}) async {
    var headers = {'Accept': 'application/json'};
    if(header != null){
      headers = header;
    }
    if(token != null){
      if(header != null){
        header.addAll({
          'JWT': '$token'
        });
        headers = header;
      }else{
        headers = {
          'Accept': 'application/json',
          'JWT': '$token'
        };
      }
      if(method == MethodRequest.PUT){
        headers = {
          'Accept': 'application/json',
          'JWT': '$token',
          'Content-Type': 'application/x-www-form-urlencoded'
        };
      }
    }

    printDebug('URL : ${httpClient.baseUrl}$url');
    printDebug('Method : $method');
    printDebug("Header : $headers");
    printDebug("Request : $request");
    printDebug("FormData : $useFormData");
    var selectedMethod;
    try{
      Response response;
      switch (method) {
        case MethodRequest.GET:
          selectedMethod = method;
          response = await httpClient.get(url, headers: headers, query: request);
          break;
        case MethodRequest.PUT:
          selectedMethod = method;
          response = await httpClient.put(url, body: request, headers: headers,
          );
          break;
        case MethodRequest.DELETE:
          selectedMethod = method;
          response = await httpClient.delete(
            url, headers: headers, query: useFormData ? FormData(request) : request,
          );
          break;
        default:
          selectedMethod = MethodRequest.POST;
          response = await httpClient.post(
            url, body: useFormData ? FormData(request) : request, headers: headers,
          );
      }
      if (response?.body is Map) {
        printWrapped('Success $selectedMethod $url: \nResponse : ${response.body}');
        return response;
      } else {
        printDebug('Success NOT MAP $selectedMethod $url: \nResponse : ${response.body}');
        Response error = Response(statusCode: 400, body: {
          "msg": "Terjadi kesalahan, coba lagi nanti",
          "success": false,
        });
        return error;
      }
    } on UnauthorizedException{
      // TODO do logout when auth is not valid here
      Get.toNamed(Routes.LOGIN);
      Response response = Response(
          body: {
            "msg": "Sesi login berakhir",
            "success": false,
          }
      );
      return response;
    } on TimeoutException{
      Response response = Response(
          body: {
            "msg": "Waktu habis",
            "success": false,
          }
      );
      return response;
    } catch (e){
      printWrapped('Error $selectedMethod $url: $e\nData: ${e.response?.data}');
      if(e.response?.data is Map && (e.response?.data['result'] == null || e.response?.data['error'] == null)) {
        (e.response.data as Map).addAll(
            <String, dynamic>{
          "msg": "Terjadi kesalahan, coba lagi nanti",
          "success": false,},
        );
        return e.response;
      } else if (e.response?.data is Map) {
        return e.response;
      } else {
        Response response = Response(
            body: {
              "msg": "Terjadi kesalahan, coba lagi nanti",
              "success": false,
            }
        );
        return response;
      }
    }
  }
}
