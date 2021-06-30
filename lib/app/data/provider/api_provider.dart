import 'dart:async';
import 'dart:io';

import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:flutter_xaurius/app/helpers/debug_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

enum MethodRequest { POST, GET, PUT, DELETE }

class ApiProvider extends GetConnect {
  ApiProvider(String baseUrl) {
    httpClient.baseUrl = baseUrl;
  }

  Future<Response> call(
    String url, {
    MethodRequest method = MethodRequest.POST,
    Map<String, dynamic> request,
    Map<String, String> header,
    String token,
    bool useFormData = false,
  }) async {
    var headers = {'Accept': 'application/json'};
    if (header != null) {
      headers = header;
    }
    if (token != null) {
      if (header != null) {
        header.addAll({'JWT': '$token'});
        headers = header;
      } else {
        headers = {'Accept': 'application/json', 'JWT': '$token'};
      }
      if (method == MethodRequest.PUT) {
        headers = {'Accept': 'application/json', 'JWT': '$token', 'Content-Type': 'application/x-www-form-urlencoded'};
      }
    }

    printDebug('URL : ${httpClient.baseUrl}$url');
    printDebug('Method : $method');
    printDebug("Header : $headers");
    printDebug("Request : $request");
    printDebug("FormData : $useFormData");
    var selectedMethod;
    try {
      Response response;
      switch (method) {
        case MethodRequest.GET:
          selectedMethod = method;
          response = await httpClient.get(url, headers: headers, query: request);
          break;
        case MethodRequest.PUT:
          selectedMethod = method;
          response = await httpClient.put(
            url,
            body: request,
            headers: headers,
          );
          break;
        case MethodRequest.DELETE:
          selectedMethod = method;
          response = await httpClient.delete(
            url,
            headers: headers,
            query: useFormData ? FormData(request) : request,
          );
          break;
        default:
          selectedMethod = MethodRequest.POST;
          response = await httpClient.post(
            url,
            body: useFormData ? FormData(request) : request,
            headers: headers,
          );
      }

      if (response?.body is Map && response.statusCode == 200) {
        printWrapped('Success $selectedMethod $url: \nResponse : ${response.body}');
        return response;
      } else if (response.statusCode == null) {
        printDebug('Success NOT MAP $selectedMethod $url: \nResponse : ${response.body}');
        Response error = Response(body: {
          "msg": "fail_conn".tr,
          "success": false,
        });
        return error;
      } else if (response.statusCode == 408) {
        printDebug('Success NOT MAP $selectedMethod $url: \nResponse : ${response.body}');
        Response error = Response(body: {
          "msg": "fail_timeout".tr,
          "success": false,
        });
        return error;
      } else if (response.statusCode == 502) {
        printDebug('Success NOT MAP $selectedMethod $url: \nResponse : ${response.body}');
        Response error = Response(body: {
          "msg": "fail_down".tr,
          "success": false,
        });
        return error;
      } else if (response.statusCode == 504) {
        printDebug('Success NOT MAP $selectedMethod $url: \nResponse : ${response.body}');
        Response error = Response(body: {
          "msg": "fail_down".tr,
          "success": false,
        });
        return error;
      } else if (response.statusCode == 401) {
        printDebug('Success NOT MAP $selectedMethod $url: \nResponse : ${response.body}');
        Response error = Response(body: {
          "msg": "fail_session".tr,
          "success": false,
        });
        return error;
      } else {
        printDebug('Success NOT MAP $selectedMethod $url: \nResponse : ${response.body}');
        Response error = Response(body: {
          "msg": "fail_wrong".tr,
          "success": false,
        });
        return error;
      }
    } on UnauthorizedException {
      // do logout when auth is not valid here
      Get.toNamed(Routes.LOGIN);
      Response response = Response(body: {
        "msg": "fail_session".tr,
        "success": false,
      });
      return response;
    } on TimeoutException {
      Response response = Response(body: {
        "msg": "fail_timeout".tr,
        "success": false,
      });
      return response;
    } on SocketException {
      Response response = Response(body: {
        "msg": "fail_conn".tr,
        "success": false,
      });
      return response;
    } catch (e) {
      printWrapped('Error $selectedMethod $url: $e\nData: ${e.response?.data}');
      if (e.response?.data is Map && (e.response?.data['result'] == null || e.response?.data['error'] == null)) {
        (e.response.data as Map).addAll(
          <String, dynamic>{
            "msg": "fail_wrong".tr,
            "success": false,
          },
        );
        return e.response;
      } else if (e.response?.data is Map) {
        return e.response;
      } else {
        Response response = Response(body: {
          "msg": "fail_wrong".tr,
          "success": false,
        });
        return response;
      }
    }
  }
}
