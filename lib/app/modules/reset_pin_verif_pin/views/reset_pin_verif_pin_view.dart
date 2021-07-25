import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reset_pin_verif_pin_controller.dart';

class ResetPinVerifPinView extends GetView<ResetPinVerifPinController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ResetPinVerifPinView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ResetPinVerifPinView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
