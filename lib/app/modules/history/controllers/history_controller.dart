import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/data/model/chips_model.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter_xaurius/app/modules/history/buy_history/controllers/buy_history_controller.dart';
import 'package:flutter_xaurius/app/modules/history/buy_history/views/buy_history_view.dart';
import 'package:flutter_xaurius/app/modules/history/receive_history/controllers/receive_history_controller.dart';
import 'package:flutter_xaurius/app/modules/history/receive_history/views/receive_history_view.dart';
import 'package:flutter_xaurius/app/modules/history/sell_history/controllers/sell_history_controller.dart';
import 'package:flutter_xaurius/app/modules/history/sell_history/views/sell_history_view.dart';
import 'package:flutter_xaurius/app/modules/history/send_history/controllers/send_history_controller.dart';
import 'package:flutter_xaurius/app/modules/history/send_history/views/send_history_view.dart';
import 'package:flutter_xaurius/app/modules/history/topup_history/controllers/topup_history_controller.dart';
import 'package:flutter_xaurius/app/modules/history/topup_history/views/topup_history_view.dart';
import 'package:flutter_xaurius/app/widget/keep_alive_page.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class HistoryController extends GetxController {
  final GlobalKey<LiquidPullToRefreshState> refreshHistory = GlobalKey<LiquidPullToRefreshState>();
  final auth = Get.find<AuthController>();
  final buyHistory = Get.put<BuyHistoryController>(BuyHistoryController());
  final sellHistory = Get.put<SellHistoryController>(SellHistoryController());
  final topUpHistory = Get.put<TopupHistoryController>(TopupHistoryController());
  final receiveHistory = Get.put<ReceiveHistoryController>(ReceiveHistoryController());
  final sendHistory = Get.put<SendHistoryController>(SendHistoryController());
  var isLoading = false.obs;
  var chipValue = 0.obs;
  PageController pageController;

  List<Widget> pages = [
    KeepAlivePage(child: BuyHistoryView()),
    KeepAlivePage(child: SellHistoryView()),
    KeepAlivePage(child: TopupHistoryView()),
    KeepAlivePage(child: ReceiveHistoryView()),
    KeepAlivePage(child: SendHistoryView()),
  ];

  List<ChipsModel> chips = <ChipsModel>[
    ChipsModel(0, 'Buy'),
    ChipsModel(1, 'Sell'),
    ChipsModel(2, 'TopUp'),
    ChipsModel(3, 'trans_receive_xau'.tr),
    ChipsModel(4, 'trans_send_xau'.tr),
  ];

  @override
  void onInit() async {
    pageController = PageController();
    // auth.getProfileData();
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
