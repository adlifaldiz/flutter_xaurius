import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';

import 'package:get/get.dart';

import '../controllers/deposit_controller.dart';

class DepositView extends GetView<DepositController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Deposit Crypto'),
        ),
        body: Container(
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text('This is Deposit View')],
          ),
        ),
      ),
    );
  }
}
