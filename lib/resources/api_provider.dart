import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_xaurius/app/data/model/base_resp.dart';
import 'package:flutter_xaurius/app/data/model/buy_xau/response_buys_model.dart';
import 'package:flutter_xaurius/app/data/model/buy_xau/response_checkout_model.dart';
import 'package:flutter_xaurius/app/data/model/buy_xau/response_create_buys_model.dart';
import 'package:flutter_xaurius/app/data/model/buy_xau/response_detail_invoice_model.dart';
import 'package:flutter_xaurius/app/data/model/buy_xau/response_post_checkout_model.dart';
import 'package:flutter_xaurius/app/data/provider/api_url.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_xaurius/app/data/model/auth/login_resp.dart';
import 'package:flutter_xaurius/app/data/model/auth/user_resp.dart';

class ApiProvider {
  final appData = GetStorage();
  final token = 'token';
  final _url = hostAPI;

  Future<ResponseCreateBuy> createBuy(qty, network) async {
    final response = await http.post(Uri.parse("$_url/buys/create"), headers: {
      "JWT": appData.read(token)
    }, body: {
      'buy[buy_qty]': qty,
      'buy[buy_network]': network,
    });
    print(response.body);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      ResponseCreateBuy responseCreateBuy = ResponseCreateBuy.fromJson(jsonResponse);
      return responseCreateBuy;
    } else {
      return null;
    }
  }

  Future<ResponsePostCheckOut> postCheckOut(_buyId, orangId, walletAddress, merchantId, voucherCode) async {
    final response = await http.post(Uri.parse("$_url/buys/$_buyId/checkout"), headers: {
      "JWT": appData.read(token)
    }, body: {
      'buy_id': orangId,
      'buy_address': walletAddress,
      'merchant_id': merchantId,
      'voucher_code': voucherCode,
    });
    print(response.body);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      ResponsePostCheckOut responsePostCheckOut = ResponsePostCheckOut.fromJson(jsonResponse);
      return responsePostCheckOut;
    } else {
      return null;
    }
  }

  Future<ResponseCheckOut> getCheckOut(_buyId) async {
    final response = await http.get(Uri.parse("$_url/buys/$_buyId/checkout"), headers: {"JWT": appData.read(token)});
    print(response.body);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      ResponseCheckOut responseCheckOut = ResponseCheckOut.fromJson(jsonResponse);
      return responseCheckOut;
    } else {
      return null;
    }
  }

  Future<ResponseDetailInvoice> getDetailInvoice(invoiceId) async {
    final response = await http.get(Uri.parse("$_url/buys/$invoiceId/invoice"), headers: {"JWT": appData.read(token)});
    print(response.body);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      ResponseDetailInvoice responseDetailInvoice = ResponseDetailInvoice.fromJson(jsonResponse);
      return responseDetailInvoice;
    } else {
      return null;
    }
  }
}
