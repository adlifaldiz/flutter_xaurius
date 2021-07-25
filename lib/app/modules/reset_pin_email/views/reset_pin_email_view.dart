import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reset_pin_email_controller.dart';

class ResetPinEmailView extends GetView<ResetPinEmailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ResetPinEmailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ResetPinEmailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
