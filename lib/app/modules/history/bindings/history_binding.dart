import 'package:flutter_xaurius/app/modules/history/buy_history/controllers/buy_history_controller.dart';
import 'package:flutter_xaurius/app/modules/history/deposit_history/controllers/deposit_history_controller.dart';
import 'package:flutter_xaurius/app/modules/history/sell_history/controllers/sell_history_controller.dart';
import 'package:flutter_xaurius/app/modules/history/topup_history/controllers/topup_history_controller.dart';
import 'package:flutter_xaurius/app/modules/history/withdraw_history/controllers/withdraw_history_controller.dart';
import 'package:get/get.dart';

import '../controllers/history_controller.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryController>(() => HistoryController());
    Get.lazyPut<BuyHistoryController>(() => BuyHistoryController());
    Get.lazyPut<SellHistoryController>(() => SellHistoryController());
    Get.lazyPut<TopupHistoryController>(() => TopupHistoryController());
    Get.lazyPut<DepositHistoryController>(() => DepositHistoryController());
    Get.lazyPut<WithdrawHistoryController>(() => WithdrawHistoryController());
  }
}