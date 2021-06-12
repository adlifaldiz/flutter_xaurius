import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/voucher_controller.dart';

class VoucherView extends GetView<VoucherController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VoucherView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'VoucherView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
