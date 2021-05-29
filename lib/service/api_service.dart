import 'package:dio/dio.dart';
import 'package:flutter_xaurius/helper/debug_utils.dart';

enum MethodRequest { POST, GET, PUT, DELETE }

class ApiService {
  static Dio _dio = Dio();

  ApiService(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = 90000; //90s
    _dio.options.receiveTimeout = 10000;
    _dio.options.headers = {'Accept': 'application/json'};
  }

  Future<Response> call(String url, {MethodRequest method = MethodRequest.POST, Map<String, dynamic> request, Map<String, String> header, String token, bool useFormData = false, CancelToken cancelToken}) async {
    if(header != null){
      _dio.options.headers = header;
    }
    if(token != null){
      if(header != null){
        header.addAll({
          'Authorization': 'Bearer $token'
        });
        _dio.options.headers = header;
      }else{
        _dio.options.headers = {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        };
      }
      if(method == MethodRequest.PUT){
        _dio.options.headers = {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/x-www-form-urlencoded'
        };
      }
    }

    printDebug('URL : ${_dio.options.baseUrl}$url');
    printDebug('Method : $method');
    printDebug("Header : ${_dio.options.headers}");
    printDebug("Request : $request");
    printDebug("FormData : $useFormData");
    var selectedMethod;
    try{
      Response response;
      switch (method) {
        case MethodRequest.GET:
          selectedMethod = method;
          response = await _dio.get(url, queryParameters: request, cancelToken: cancelToken);
          break;
        case MethodRequest.PUT:
          selectedMethod = method;
          response = await _dio.put(url,
            data: request, cancelToken: cancelToken
          );
          break;
        case MethodRequest.DELETE:
          selectedMethod = method;
          response = await _dio.delete(
            url,cancelToken: cancelToken,
            data: useFormData ? FormData.fromMap(request) : request,
          );
          break;
        default:
          selectedMethod = MethodRequest.POST;
          response = await _dio.post(
            url,cancelToken: cancelToken,
            data: useFormData ? FormData.fromMap(request) : request,
          );
      }

      if (response?.data is Map) {
        printWrapped('Success $selectedMethod $url: \nResponse : ${response.data}');
        return response;
      } else {
        printDebug('Success NOT MAP $selectedMethod $url: \nResponse : ${response.data}');
        Response error = Response(statusCode: 400, data: {
          "error": "Terjadi kesalahan, coba lagi nanti",
          "result": false,
        });
        return error;
      }
    } on DioError catch (e){
      printWrapped('Error $selectedMethod $url: $e\nData: ${e.response?.data}');
      if(e.response?.data is Map && (e.response?.data['result'] == null || e.response?.data['error'] == null)){
        (e.response.data as Map).addAll(
            <String, dynamic>{
          "error": "Terjadi kesalahan, coba lagi nanti",
          "result": false,});
        return e.response;
      }else if(e.response?.data is Map){
        return e.response;
      }else{
        Response response = Response(
            data: {
              "error": "Terjadi kesalahan, coba lagi nanti",
              "result": false,
            }
        );
        return response;
      }
    }
  }
}
