import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';

import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bot_menu_history'.tr),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
              width: Get.width,
              height: kToolbarHeight,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5)),
                children: controller.chips.map((e) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 1)),
                    child: Obx(
                      () => ChoiceChip(
                        label: Text(e.name, style: controller.chipValue.value == e.id ? buttonStyle : textTitle),
                        selected: controller.chipValue.value == e.id,
                        selectedColor: primaryColor,
                        onSelected: (selected) {
                          return controller.onChipSelected(selected, e.id);
                        },
                      ),
                    ),
                  );
                }).toList(),
              )),
        ),
      ),
      body: PageView(
        controller: controller.pageController,
        children: controller.pages,
        physics: NeverScrollableScrollPhysics(),
      ),

      // Obx(() {
      //   if (controller.isLoading.value) {
      //     return ShimmerList();
      //   } else if (controller.listBuys.isEmpty) {
      //     return EmptyState(
      //       onPressed: () => controller.getBuys(),
      //     );
      //   }
      //   return LiquidPullToRefresh(
      //     color: backgroundPanelColor,
      //     backgroundColor: primaryColor,
      //     key: controller.refreshHistory,
      //     onRefresh: controller.onRefresh,
      //     showChildOpacityTransition: false,
      //     child: ListView.builder(
      //         padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5)),
      //         itemCount: controller.listBuys.length,
      //         itemBuilder: (context, index) {
      //           return Padding(
      //             padding: EdgeInsets.symmetric(vertical: percentWidth(context, 1)),
      //             child: GestureDetector(
      //               onTap: () => Get.toNamed(Routes.INVOICE, arguments: {
      //                 'invoiceId': controller.listBuys[index].invoiceId,
      //                 'fromBuy': false,
      //               }),
      //               child: XauriusContainer(
      //                   child: Column(
      //                 children: [
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       Row(
      //                         children: [
      //                           Text(
      //                             'Invoice',
      //                             style: textTitle,
      //                           ),
      //                           SizedBox(width: 5),
      //                           Text(
      //                             '#' + controller.listBuys[index].invoiceId.toString(),
      //                           ),
      //                         ],
      //                       ),
      //                       Text(
      //                         controller.listBuys[index].buyStatus.toString(),
      //                         style: textTitle.copyWith(color: primaryColor),
      //                       ),
      //                     ],
      //                   ),
      //                   SizedBox(height: 20),
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       Text(
      //                         'quantity_xau'.tr,
      //                         style: stylePrimary,
      //                       ),
      //                       Text(
      //                         controller.listBuys[index].buyQty + ' XAU',
      //                       ),
      //                     ],
      //                   ),
      //                   SizedBox(height: 10),
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       Text(
      //                         'Total ',
      //                         style: stylePrimary,
      //                       ),
      //                       Text(
      //                         customCurrency(controller.listBuys[index].buyAmount) + ' IDR',
      //                       ),
      //                     ],
      //                   ),
      //                   SizedBox(height: 10),
      //                 ],
      //               )),
      //             ),
      //           );
      //         }),
      //   );
      // }),
    );
  }
}
