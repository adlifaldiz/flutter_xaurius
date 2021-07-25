import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reset_pin_create_pin_controller.dart';

class ResetPinCreatePinView extends GetView<ResetPinCreatePinController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ResetPinCreatePinView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ResetPinCreatePinView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
