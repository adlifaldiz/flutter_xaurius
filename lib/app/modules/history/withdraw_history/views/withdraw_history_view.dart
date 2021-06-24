import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/widget/empty_state.dart';

import 'package:get/get.dart';

import '../controllers/withdraw_history_controller.dart';

class WithdrawHistoryView extends GetView<WithdrawHistoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EmptyState(
        refreshAble: true,
      ),
    );
  }
}
