import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/widget/empty_state.dart';

import 'package:get/get.dart';

import '../controllers/sell_history_controller.dart';

class SellHistoryView extends GetView<SellHistoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: EmptyState(
      refreshAble: false,
    ));
  }
}
