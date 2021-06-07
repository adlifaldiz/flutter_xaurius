import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/gold_price_controller.dart';

class GoldPriceView extends GetView<GoldPriceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GoldPriceView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'GoldPriceView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
