import 'dart:async';
import 'dart:io';
import 'package:flutter_xaurius/app/data/model/base_resp.dart';
import 'package:flutter_xaurius/app/data/model/deposit/resp_deposit/resp_withdraw.dart';
import 'package:flutter_xaurius/app/data/model/resp_buys/resp_buys.dart';
import 'package:flutter_xaurius/app/data/model/buy_xau/resp_checkout/resp_checkout.dart';
import 'package:flutter_xaurius/app/data/model/buy_xau/resp_create/resp_create_buy.dart';
import 'package:flutter_xaurius/app/data/model/buy_xau/resp_detail_invoice/resp_det_invoice.dart';
import 'package:flutter_xaurius/app/data/model/buy_xau/resp_post_checkout/resp_post_checkout.dart';
import 'package:flutter_xaurius/app/data/model/dashboard/response_dashboard_model.dart';
import 'package:flutter_xaurius/app/data/model/top_up/resp_detail_topup/resp_detail_invoice_top.dart';
import 'package:flutter_xaurius/app/data/model/top_up/resp_list_topup/resp_list_top.dart';
import 'package:flutter_xaurius/app/data/model/top_up/resp_post_topup/resp_post_top.dart';
import 'package:flutter_xaurius/app/data/model/va_merchant/resp_va_merchant/resp_va_merchant.dart';
import 'package:flutter_xaurius/app/data/model/withdraw/resp_withdraw/resp_withdraw.dart';
import 'package:flutter_xaurius/app/data/provider/api_provider.dart';
import 'package:flutter_xaurius/app/data/model/auth/login_resp.dart';
import 'package:flutter_xaurius/app/data/model/auth/user_resp.dart';
import 'package:get/get.dart';

import 'api_url.dart' as url;

class ApiRepository {
  final _http = ApiProvider(url.hostAPI);

  Future<BaseResp> register(String email) async {
    final response = await _http.call(
      url.register,
      method: MethodRequest.POST,
      request: {'email': email},
    );
    return BaseResp.fromJson(response.body);
  }

  Future<BaseResp> verifyRegistrationCode(String email, String otp) async {
    final response = await _http.call(
      url.registerVerification,
      method: MethodRequest.POST,
      request: {'email': email, 'otp': otp},
    );
    return BaseResp.fromJson(response.body);
  }

  Future<BaseResp> registerPin(String email, String otp, String pin, String pinConfirm) async {
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
    return BaseResp.fromJson(response.body);
  }

  Future<LoginResp> login(email, pin) async {
    final response = await _http.call(
      url.login,
      method: MethodRequest.POST,
      request: {
        'email': email,
        'pin': pin,
      },
    );
    return LoginResp.fromJson(response.body);
  }

  Future<UserResp> getPersonalInfo(String token) async {
    final response = await _http.call(
      url.profile,
      token: token,
      method: MethodRequest.GET,
    );
    return UserResp.fromJson(response.body);
  }

  Future<UserResp> kycPersonalData(nama, nomor, tanggal, alamat, kota, kodePos, negara, token) async {
    final response = await _http.call(
      url.kycPersonalInfo,
      useFormData: true,
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
    return UserResp.fromJson(response.body);
  }

  Future<UserResp> kycDocument(idType, idNum, idFile, npwpNum, npwpFile, jwt) async {
    final response =
        await _http.call(url.kycDocument, token: jwt, method: MethodRequest.POST, useFormData: true, request: {
      'orang[orang_id_type]': idType,
      'orang[orang_id_num]': idNum,
      'orang[orang_id_file_atc]':
          idFile.toString().isEmpty ? '' : MultipartFile(idFile, filename: idFile.split('/').last),
      'orang[orang_npwp_num]': npwpNum,
      'orang[orang_npwp_file_atc]':
          npwpFile.toString().isEmpty ? '' : MultipartFile(npwpFile, filename: npwpFile.split('/').last),
    });
    return UserResp.fromJson(response.body);
  }

  Future<ResponseBuys> getBuys(page, String token) async {
    final response = await _http.call(url.buys + '?page=${page.toString()}', token: token, method: MethodRequest.GET);
    return ResponseBuys.fromJson(response.body);
  }

  Future<UserResp> updateBankProfile(String token, String bankName, String holderName, String holderNumber) async {
    final response =
        await _http.call(url.profileBank, token: token, useFormData: true, method: MethodRequest.POST, request: {
      'orang[orang_bank_name]': bankName,
      'orang[orang_bank_holder]': holderName,
      'orang[orang_bank_number]': holderNumber,
    });
    return UserResp.fromJson(response.body);
  }

  Future<ResponseCreateBuy> createBuys(String qty, String network, String jwt) async {
    final response = await _http.call(url.createBuys, token: jwt, useFormData: true, request: {
      'buy[buy_qty]': qty,
      'buy[buy_network]': network,
    });
    return ResponseCreateBuy.fromJson(response.body);
  }

  Future<ResponseCheckOut> getCheckout(String buyId, String token) async {
    final response = await _http.call(
      url.buys + '/$buyId/' + url.checkOut,
      token: token,
      method: MethodRequest.GET,
    );
    return ResponseCheckOut.fromJson(response.body);
  }

  Future<ResponsePostCheckOut> postCheckout(
      String buyId, String walletAddress, String merchantId, String voucherCode, String token) async {
    final response = await _http.call(url.buys + '/$buyId' + url.checkOut,
        token: token,
        useFormData: true,
        method: MethodRequest.POST,
        request: {
          'buy_id': buyId,
          'buy_address': walletAddress,
          'merchant_id': merchantId,
          'voucher_code': voucherCode,
        });

    return ResponsePostCheckOut.fromJson(response.body);
  }

  Future<ResponseDetailInvoice> getInvoice(String invoiceId, String token) async {
    final response = await _http.call(url.buys + '/$invoiceId' + url.invoice,
        token: token, useFormData: true, method: MethodRequest.GET);
    return ResponseDetailInvoice.fromJson(response.body);
  }

  Future<ResponseVaMerchant> getVaMerchant(String token) async {
    final response = await _http.call(
      url.getVaMerchant,
      token: token,
      method: MethodRequest.GET,
    );
    return ResponseVaMerchant.fromJson(response.body);
  }

  Future<ResponseGetTopUp> getTopUp(page, String jwt) async {
    final response = await _http.call(url.getTopUp + '?page=${page.toString()}', token: jwt, method: MethodRequest.GET);
    return ResponseGetTopUp.fromJson(response.body);
  }

  Future<ResponsePostTopUp> postTopUp(merchantId, amountIdr, String jwt) async {
    final response = await _http.call(url.postTopUp, token: jwt, useFormData: true, request: {
      'merchant_id': merchantId,
      'depoidr_amount': amountIdr,
    });
    return ResponsePostTopUp.fromJson(response.body);
  }

  Future<ResponseDetailInvoiceTopUp> getDetailInvoices(invoiceId, String jwt) async {
    final response = await _http.call(url.getDetailInvoices + invoiceId, token: jwt, method: MethodRequest.GET);
    return ResponseDetailInvoiceTopUp.fromJson(response.body);
  }

  Future<BaseResp> postMadePayment(String invoiceId, String token) async {
    final response = await _http.call(
      url.madePayment,
      token: token,
      useFormData: true,
      method: MethodRequest.POST,
      request: {"invoice_id": invoiceId},
    );
    return BaseResp.fromJson(response.body);
  }

  Future<ResponseDashboard> getDashboard(String token) async {
    final response = await _http.call(url.dashboard, token: token, method: MethodRequest.GET);
    return ResponseDashboard.fromJson(response.body);
  }

  Future<BaseResp> getOTP(String jwt) async {
    final response = await _http.call(url.getOtp, token: jwt, method: MethodRequest.GET);
    return BaseResp.fromJson(response.body);
  }

  Future<BaseResp> postWdXau(String wdAddress, String qty, String networkAddress, String otp, String jwt) async {
    final response = await _http.call(url.wdXau, token: jwt, method: MethodRequest.POST, useFormData: true, request: {
      'wd[wd_address]': wdAddress,
      'wd[wd_value]': qty,
      'wd[wd_network]': networkAddress,
      'otp': otp,
    });
    return BaseResp.fromJson(response.body);
  }

  Future<ResponseWithdraw> getWdXau(String page, String jwt) async {
    final response = await _http.call(url.getWdXau, token: jwt, method: MethodRequest.GET, request: {
      'page': page,
    });
    return ResponseWithdraw.fromJson(response.body);
  }

  Future<ResponseDeposit> getDepoXau(String page, String jwt) async {
    final response = await _http.call(url.getDepoXau, token: jwt, method: MethodRequest.GET, request: {
      'page': page,
    });
    return ResponseDeposit.fromJson(response.body);
  }

  Future<BaseResp> resetPinEmail(String email) async {
    final response = await _http.call(
      url.resetPinEmail,
      method: MethodRequest.POST,
      request: {'email': email},
    );
    return BaseResp.fromJson(response.body);
  }

  Future<BaseResp> resetPinVerifCode(String email, String otp) async {
    final response = await _http.call(
      url.resetPinVerifCode,
      method: MethodRequest.POST,
      request: {'email': email, 'otp': otp},
    );
    return BaseResp.fromJson(response.body);
  }

  Future<BaseResp> resetPinRecreate(String email, String otp, String pin, String pinConfirm) async {
    final response = await _http.call(
      url.resetPinRecreate,
      method: MethodRequest.POST,
      request: {
        'email': email,
        'otp': otp,
        'pin': pin,
        'pin_confirm': pinConfirm,
      },
    );
    return BaseResp.fromJson(response.body);
  }
}
