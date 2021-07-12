import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xaurius/app/helpers/screen_utils.dart';
import 'package:flutter_xaurius/app/helpers/theme.dart';
import 'package:flutter_xaurius/app/widget/empty_state.dart';
import 'package:flutter_xaurius/app/widget/shimmer_list.dart';
import 'package:flutter_xaurius/app/widget/xau_container.dart';

import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../controllers/receive_history_controller.dart';

class ReceiveHistoryView extends GetView<ReceiveHistoryController> {
  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      color: backgroundPanelColor,
      backgroundColor: primaryColor,
      key: controller.refreshWd,
      onRefresh: controller.onRefresh,
      showChildOpacityTransition: false,
      child: Obx(() {
        if (controller.isLoading.value && controller.depoData.length == 0) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: percentHeight(context, 1)),
            child: AbsorbPointer(absorbing: true, child: ShimmerList()),
          );
        }
        if (controller.depoData.isEmpty) {
          return EmptyState(
            refreshAble: true,
            onPressed: () => controller.onRefresh(),
          );
        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: percentWidth(context, 5), vertical: percentHeight(context, 1)),
                controller: controller.scrollController,
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: controller.depoData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: percentWidth(context, 1)),
                    child: XauriusContainer(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Invoice',
                                    style: textTitle,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '#' + controller.depoData[index].id.toString(),
                                  ),
                                ],
                              ),
                              // Text(
                              //   controller.depoData[index].wdStatus.toString(),
                              //   style: textTitle.copyWith(color: primaryColor),
                              // ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'network'.tr,
                                style: stylePrimary,
                              ),
                              SizedBox(width: percentWidth(context, 5)),
                              Expanded(
                                child: Text(
                                  controller.depoData[index].depositNetwork,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: percentHeight(context, 1)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'quantity_xau'.tr,
                                style: stylePrimary,
                              ),
                              SizedBox(width: percentWidth(context, 5)),
                              Expanded(
                                child: Text(
                                  controller.depoData[index].depositValue + ' XAU',
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: percentHeight(context, 1)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            AnimatedContainer(
              height: controller.isLoading.value ? percentHeight(context, 2) : 0,
              duration: Duration(milliseconds: 100),
              child: controller.isLoading.value
                  ? (GetPlatform.isIOS || GetPlatform.isMacOS)
                      ? CupertinoActivityIndicator()
                      : CircularProgressIndicator(color: primaryColor, strokeWidth: 1.5)
                  : Container(),
            )
          ],
        );
      }),
    );
  }
}
