import 'package:flutter_xaurius/app/data/model/auth/user_data.dart';
import 'package:flutter_xaurius/app/data/model/auth/user_voucher.dart';
import 'package:flutter_xaurius/app/data/model/balances/balance_data.dart';
import 'package:flutter_xaurius/app/data/provider/api_repository.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final _repo = ApiRepository();

  String token;
  UserData userData;
  List<Voucher> userVouchers;
  List<BalanceData> userBalance;

  var isLoading = false.obs;
  var isError = false.obs;

  Future getProfileData() async {
    isLoading(true);
    final resp = await _repo.getPersonalInfo(token);
    if (resp.success) {
      userData = resp.data.orang;
      userBalance = resp.data.balances;
      userVouchers = resp.data.vouchers;
      isLoading(false);
    } else {
      isLoading(false);
    }
    isLoading(false);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
