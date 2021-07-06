import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/data/model/chips_model.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter_xaurius/app/modules/history/buy_history/controllers/buy_history_controller.dart';
import 'package:flutter_xaurius/app/modules/history/buy_history/views/buy_history_view.dart';
import 'package:flutter_xaurius/app/modules/history/deposit_history/views/deposit_history_view.dart';
import 'package:flutter_xaurius/app/modules/history/sell_history/views/sell_history_view.dart';
import 'package:flutter_xaurius/app/modules/history/topup_history/views/topup_history_view.dart';
import 'package:flutter_xaurius/app/modules/history/withdraw_history/views/withdraw_history_view.dart';
import 'package:flutter_xaurius/app/widget/keep_alive_page.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class HistoryController extends GetxController {
  final GlobalKey<LiquidPullToRefreshState> refreshHistory = GlobalKey<LiquidPullToRefreshState>();
  final auth = Get.find<AuthController>();
  final buyHistory = Get.find<BuyHistoryController>();
  var isLoading = false.obs;
  var chipValue = 0.obs;
  PageController pageController;

  List<Widget> pages = [
    KeepAlivePage(child: BuyHistoryView()),
    KeepAlivePage(child: SellHistoryView()),
    KeepAlivePage(child: TopupHistoryView()),
    KeepAlivePage(child: DepositHistoryView()),
    KeepAlivePage(child: WithdrawHistoryView()),
  ];

  List<ChipsModel> chips = <ChipsModel>[
    ChipsModel(0, 'Buy'),
    ChipsModel(1, 'Sell'),
    ChipsModel(2, 'TopUp'),
    ChipsModel(3, 'Recieve Crypto'),
    ChipsModel(4, 'Send Crypto'),
  ];
  @override
  void onInit() async {
    pageController = PageController(keepPage: true);
    auth.getProfileData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future onRefresh() async {
    update();
  }

  void onChipSelected(bool selected, id) {
    chipValue.value = id;
    switch (id) {
      case 0:
        pageController.animateToPage(id, duration: Duration(milliseconds: 300), curve: Curves.ease);
        break;
      case 1:
        pageController.animateToPage(id, duration: Duration(milliseconds: 300), curve: Curves.ease);
        break;
      case 2:
        pageController.animateToPage(id, duration: Duration(milliseconds: 300), curve: Curves.ease);
        break;
      case 3:
        pageController.animateToPage(id, duration: Duration(milliseconds: 300), curve: Curves.ease);
        break;
      case 4:
        pageController.animateToPage(id, duration: Duration(milliseconds: 300), curve: Curves.ease);
        break;
      default:
        pageController.animateToPage(id, duration: Duration(milliseconds: 300), curve: Curves.ease);
    }
  }
}
