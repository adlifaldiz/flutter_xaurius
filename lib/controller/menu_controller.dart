import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  var tabIndex = 1;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
