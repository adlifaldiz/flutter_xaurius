import 'package:flutter_xaurius/app/helpers/dialog_utils.dart';
import 'package:flutter_xaurius/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter_xaurius/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter_xaurius/app/routes/app_pages.dart';
import 'package:flutter_xaurius/app/widget/coming_soon.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransactionController extends GetxController {
  final auth = Get.find<AuthController>();
  final dash = Get.find<DashboardController>();
  DateFormat formatter = DateFormat('yyyy-MM-dd');

  final approve = 'approve';

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future onRefresh() async {
    auth.getProfileData();
    dash.onInit();
    update();
  }

  void router(id) {
    switch (id) {
      case 1:
        Get.toNamed(Routes.TOP_UP);
        break;
      case 2:
        Get.toNamed(Routes.CHART_VIEW);
        break;
      case 3:
        Get.toNamed(Routes.BUY_XAU);
        break;
      case 4:
        //sellxau
        //Get.toNamed(Routes.SELL_XAU);
        Get.to(ComingSoonScreen());
        break;
      case 5:
        //redeem
        Get.to(ComingSoonScreen());
        break;
      case 6:
        //trans send XAU
        Get.to(ComingSoonScreen());
        break;
      case 7:
        //trans receive XAU
        Get.to(ComingSoonScreen());
        break;
      case 8:
        //deposit
        Get.toNamed(Routes.RECEIVE_XAU);
        break;
      case 9:
        //withdraw
        Get.toNamed(Routes.SEND_XAU);

        break;
      case 10:
        //trans send
        Get.to(ComingSoonScreen());
        break;
      case 11:
        //trans_credit_general
        Get.to(ComingSoonScreen());
        break;
      case 12:
        //trans_electricity_general
        Get.to(ComingSoonScreen());
        break;
      case 13:
        //trans_package_general
        Get.to(ComingSoonScreen());
        break;
      case 100:
        // if need coming soon
        Get.to(ComingSoonScreen());
        break;
    }
  }
}
