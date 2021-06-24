import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/widget/empty_state.dart';

import 'package:get/get.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('notif_title'.tr),
        centerTitle: true,
      ),
      body: EmptyState(),
    );
  }
}
