import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reset_pin_verif_code_controller.dart';

class ResetPinVerifCodeView extends GetView<ResetPinVerifCodeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ResetPinVerifCodeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ResetPinVerifCodeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
